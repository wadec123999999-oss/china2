import fs from "node:fs";
import path from "node:path";
import vm from "node:vm";

const rootDir = process.cwd();
const sourcePath = path.join(rootDir, "lib", "destination-positioning.ts");
const guideSourcePath = path.join(rootDir, "lib", "destination-guides.ts");
const outputDir = path.join(rootDir, "content", "rag");
const outputPath = path.join(outputDir, "destination-knowledge.jsonl");
const detailCardFilePattern =
	/^destination-knowledge-(details|practical|planning|audiences|growth)\.json$/;

const cityLabels = {
	beijing: "Beijing",
	chengdu: "Chengdu",
	chongqing: "Chongqing",
	quanzhou: "Quanzhou",
	jingdezhen: "Jingdezhen",
	"jingmai-mountain": "Jingmai Mountain",
	"wudang-mountain": "Wudang Mountain",
};

function readPositioningObject() {
	const source = fs.readFileSync(sourcePath, "utf8");
	const startToken = "export const destinationPositioningBySlug = ";
	const start = source.indexOf(startToken);
	const end = source.lastIndexOf(" satisfies Record<DestinationSlug, DestinationPositioning>;");

	if (start === -1 || end === -1 || end <= start) {
		throw new Error("Could not locate destinationPositioningBySlug export.");
	}

	const objectSource = source.slice(start + startToken.length, end);
	return vm.runInNewContext(`(${objectSource})`, {}, { timeout: 1000 });
}

function readGuidesObject() {
	const source = fs.readFileSync(guideSourcePath, "utf8");
	const startToken = "export const destinationGuides = ";
	const start = source.indexOf(startToken);
	const end = source.lastIndexOf(" satisfies Record<DestinationSlug, DestinationGuide>;");

	if (start === -1 || end === -1 || end <= start) {
		throw new Error("Could not locate destinationGuides export.");
	}

	const objectSource = source.slice(start + startToken.length, end);
	return vm.runInNewContext(`(${objectSource})`, {}, { timeout: 1000 });
}

function normalizeId(value) {
	return value
		.toLowerCase()
		.replace(/[^a-z0-9]+/g, "-")
		.replace(/^-+|-+$/g, "");
}

function createRecord({
	slug,
	type,
	title,
	text,
	tags = [],
	metadata = {},
	source = "a-deeper-china-redesign/lib/destination-positioning.ts",
	version = "v1-static-positioning",
}) {
	return {
		id: `${slug}:${type}:${normalizeId(title)}`,
		destination_slug: slug.replace(/-/g, "_"),
		destination_name: cityLabels[slug] ?? slug,
		language: "en",
		content_type: type,
		title,
		text,
		tags,
		metadata,
		source,
		version,
	};
}

function readDetailCards() {
	if (!fs.existsSync(outputDir)) return [];

	return fs
		.readdirSync(outputDir)
		.filter((fileName) => detailCardFilePattern.test(fileName))
		.flatMap((fileName) =>
			JSON.parse(fs.readFileSync(path.join(outputDir, fileName), "utf8")).map(
				(card) => ({
					...card,
					sourceFile: fileName,
				}),
			),
		);
}

function toAllowedContentType(type) {
	const allowedTypes = new Set([
		"positioning_overview",
		"sell_point",
		"audience_fit",
		"route_seed",
		"traveler_faq",
		"attraction",
		"experience",
		"food",
		"transport",
		"market_profile",
		"source_note",
	]);

	if (allowedTypes.has(type)) return type;

	const mappings = {
		experience_cluster: "experience",
		photo_route: "experience",
		craft_context: "experience",
		hands_on_experience: "experience",
		tea_context: "experience",
		food_context: "food",
		route_design_note: "route_seed",
		route_pairing: "route_seed",
		audience_angle: "market_profile",
		conversion_hook: "source_note",
	};

	return mappings[type] ?? "source_note";
}

function buildRecords(positioningBySlug) {
	const records = [];

	for (const [slug, positioning] of Object.entries(positioningBySlug)) {
		const cityName = cityLabels[slug] ?? slug;

		records.push(
			createRecord({
				slug,
				type: "positioning_overview",
				title: `${cityName} positioning overview`,
				text: `${positioning.signatureHook}\n\nWhy visit: ${positioning.whyVisit}\n\nAvoid framing: ${positioning.doNotSellAs}`,
				tags: ["why_visit", "positioning", "avoid_generic"],
				metadata: {
					best_for: positioning.bestFor,
				},
			}),
		);

		for (const [index, point] of positioning.coreSellPoints.entries()) {
			records.push(
				createRecord({
					slug,
					type: "sell_point",
					title: point.title,
					text: `${cityName} selling point: ${point.title}. ${point.body}`,
					tags: ["sell_point", "city_identity"],
					metadata: { sort_order: index + 1 },
				}),
			);
		}

		records.push(
			createRecord({
				slug,
				type: "audience_fit",
				title: `${cityName} best-fit travelers`,
				text: `${cityName} is best for: ${positioning.bestFor.join("; ")}.`,
				tags: ["audience", "conversion"],
				metadata: {
					best_for: positioning.bestFor,
				},
			}),
		);

		for (const [index, route] of positioning.routeSeeds.entries()) {
			records.push(
				createRecord({
					slug,
					type: "route_seed",
					title: route.title,
					text: `${route.title} (${route.duration}): ${route.body}`,
					tags: ["route_seed", "itinerary"],
					metadata: {
						sort_order: index + 1,
						duration: route.duration,
					},
				}),
			);
		}

		for (const [index, item] of positioning.faq.entries()) {
			records.push(
				createRecord({
					slug,
					type: "traveler_faq",
					title: item.question,
					text: `Question: ${item.question}\nAnswer direction: ${item.answer}`,
					tags: ["faq", "traveler_question"],
					metadata: { sort_order: index + 1 },
				}),
			);
		}
	}

	return records;
}

function buildGuideRecords(guidesBySlug) {
	const records = [];

	for (const [slug, guide] of Object.entries(guidesBySlug)) {
		const cityName = cityLabels[slug] ?? slug;

		records.push(
			createRecord({
				slug,
				type: "source_note",
				title: `${cityName} editorial guide frame`,
				text: `${guide.editorialLead}\n\nNot generic: ${guide.notGeneric.title}. ${guide.notGeneric.body}\n\nVisual direction: ${guide.visualCaption}`,
				tags: ["editorial_guide", "avoid_generic", "visual_direction"],
				source: "a-deeper-china-redesign/lib/destination-guides.ts",
				version: "v1-editorial-guides",
			}),
		);

		for (const [index, item] of guide.readTheCity.entries()) {
			records.push(
				createRecord({
					slug,
					type: "experience",
					title: `${cityName} city reading - ${item.title}`,
					text: `${item.title}: ${item.body}`,
					tags: ["read_the_city", "interpretation", "differentiated_guide"],
					metadata: { sort_order: index + 1 },
					source: "a-deeper-china-redesign/lib/destination-guides.ts",
					version: "v1-editorial-guides",
				}),
			);
		}

		for (const [index, day] of guide.signatureDays.entries()) {
			records.push(
				createRecord({
					slug,
					type: "route_seed",
					title: `${cityName} signature day - ${day.title}`,
					text: `${day.title}: ${day.body}`,
					tags: ["signature_day", "itinerary", "route_logic"],
					metadata: { sort_order: index + 1 },
					source: "a-deeper-china-redesign/lib/destination-guides.ts",
					version: "v1-editorial-guides",
				}),
			);
		}

		for (const [index, fit] of guide.travelerFit.entries()) {
			records.push(
				createRecord({
					slug,
					type: "market_profile",
					title: `${cityName} traveler fit - ${fit.title}`,
					text: `${fit.title}: ${fit.body}`,
					tags: ["traveler_fit", "audience", "conversion"],
					metadata: { sort_order: index + 1 },
					source: "a-deeper-china-redesign/lib/destination-guides.ts",
					version: "v1-editorial-guides",
				}),
			);
		}

		for (const [index, signal] of guide.planningSignals.entries()) {
			records.push(
				createRecord({
					slug,
					type: "source_note",
					title: `${cityName} planning signal - ${signal.title}`,
					text: `${signal.title}: ${signal.body}`,
					tags: ["planning_signal", "route_design", "concierge"],
					metadata: { sort_order: index + 1 },
					source: "a-deeper-china-redesign/lib/destination-guides.ts",
					version: "v1-editorial-guides",
				}),
			);
		}

		records.push(
			createRecord({
				slug,
				type: "source_note",
				title: `${cityName} research anchors`,
				text: guide.sourceAnchors
					.map((source) => `${source.label}: ${source.url}`)
					.join("\n"),
				tags: ["source_anchor", "research", "evidence"],
				metadata: {
					source_count: guide.sourceAnchors.length,
					urls: guide.sourceAnchors.map((source) => source.url),
				},
				source: "a-deeper-china-redesign/lib/destination-guides.ts",
				version: "v1-editorial-guides",
			}),
		);
	}

	return records;
}

const positioningBySlug = readPositioningObject();
const guidesBySlug = readGuidesObject();
const detailCards = readDetailCards();
const records = [
	...buildRecords(positioningBySlug),
	...buildGuideRecords(guidesBySlug),
	...detailCards.map((card) =>
		createRecord({
			...card,
			type: toAllowedContentType(card.type),
			metadata: {
				...(card.metadata ?? {}),
				detail_type: card.type,
			},
			source: `a-deeper-china-redesign/content/rag/${card.sourceFile}`,
			version: "v1-curated-detail-cards",
		}),
	),
];

fs.mkdirSync(outputDir, { recursive: true });
fs.writeFileSync(
	outputPath,
	`${records.map((record) => JSON.stringify(record)).join("\n")}\n`,
	"utf8",
);

console.log(`Wrote ${records.length} destination RAG records to ${outputPath}`);
