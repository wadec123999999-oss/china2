import fs from "node:fs";
import path from "node:path";
import vm from "node:vm";

const rootDir = process.cwd();
const sourcePath = path.join(rootDir, "lib", "destination-positioning.ts");
const outputDir = path.join(rootDir, "content", "rag");
const outputPath = path.join(outputDir, "destination-knowledge.jsonl");

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

function normalizeId(value) {
	return value
		.toLowerCase()
		.replace(/[^a-z0-9]+/g, "-")
		.replace(/^-+|-+$/g, "");
}

function createRecord({ slug, type, title, text, tags = [], metadata = {} }) {
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
		source: "a-deeper-china-redesign/lib/destination-positioning.ts",
		version: "v1-static-positioning",
	};
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

const positioningBySlug = readPositioningObject();
const records = buildRecords(positioningBySlug);

fs.mkdirSync(outputDir, { recursive: true });
fs.writeFileSync(
	outputPath,
	`${records.map((record) => JSON.stringify(record)).join("\n")}\n`,
	"utf8",
);

console.log(`Wrote ${records.length} destination RAG records to ${outputPath}`);
