import fs from "node:fs";
import path from "node:path";

export type DestinationRagRecord = {
	id: string;
	destination_slug: string;
	destination_name: string;
	language: "en";
	content_type:
		| "positioning_overview"
		| "sell_point"
		| "audience_fit"
		| "route_seed"
		| "traveler_faq"
		| "attraction"
		| "experience"
		| "food"
		| "transport"
		| "market_profile"
		| "source_note";
	title: string;
	text: string;
	tags: string[];
	metadata: Record<string, unknown>;
	source: string;
	version: string;
};

let cachedRecords: DestinationRagRecord[] | null = null;

function loadDestinationRagRecords() {
	if (cachedRecords) return cachedRecords;

	const filePath = path.join(
		process.cwd(),
		"content",
		"rag",
		"destination-knowledge.jsonl",
	);

	try {
		const raw = fs.readFileSync(filePath, "utf8");
		cachedRecords = raw
			.split(/\r?\n/)
			.map((line) => line.trim())
			.filter(Boolean)
			.map((line) => JSON.parse(line) as DestinationRagRecord);
	} catch {
		cachedRecords = [];
	}

	return cachedRecords;
}

function tokenize(value: string) {
	return value
		.toLowerCase()
		.split(/[^a-z0-9]+/)
		.filter((token) => token.length >= 3);
}

function normalizeDestinationSlug(value: string) {
	return value.toLowerCase().replace(/[\s-]+/g, "_");
}

function hasRouteCombinationIntent(value: string) {
	const lowered = value.toLowerCase();
	return [
		"route",
		"itinerary",
		"combine",
		"combination",
		"multi-city",
		"multi city",
		"which cities",
		"city order",
		"first trip",
		"first-time",
		"first time",
		"pair",
		"vs",
		"versus",
		"compare",
	].some((marker) => lowered.includes(marker));
}

function scoreRecord({
	record,
	tokens,
	preferredSlugs,
}: {
	record: DestinationRagRecord;
	tokens: string[];
	preferredSlugs: string[];
}) {
	let score = 0;

	if (preferredSlugs.includes(record.destination_slug)) {
		score += 80;
	}

	const searchable = [
		record.destination_name,
		record.destination_slug,
		record.content_type,
		record.title,
		record.text,
		record.tags.join(" "),
	]
		.join(" ")
		.toLowerCase();

	for (const token of tokens) {
		if (record.destination_slug.includes(token)) score += 20;
		if (record.title.toLowerCase().includes(token)) score += 12;
		if (record.tags.some((tag) => tag.toLowerCase().includes(token))) score += 8;
		if (searchable.includes(token)) score += 4;
	}

	switch (record.content_type) {
		case "positioning_overview":
			score += 16;
			break;
		case "sell_point":
			score += 12;
			break;
		case "route_seed":
			score += 10;
			break;
		case "traveler_faq":
			score += 6;
			break;
		case "audience_fit":
			score += 4;
			break;
		case "market_profile":
			score += 5;
			break;
		case "experience":
			score += 5;
			break;
		case "source_note":
			score += 3;
			break;
	}

	if (
		record.tags.some((tag) => tag === "route_combination") &&
		hasRouteCombinationIntent(`${tokens.join(" ")} ${record.title}`)
	) {
		score += 26;
	}

	return score;
}

export function searchDestinationRag({
	message,
	preferredCities,
	limit = 8,
}: {
	message: string;
	preferredCities: string[];
	limit?: number;
}) {
	const records = loadDestinationRagRecords();
	const tokens = tokenize(`${message} ${preferredCities.join(" ")}`);
	const preferredSlugs = preferredCities.map(normalizeDestinationSlug);

	return records
		.map((record) => ({
			record,
			score: scoreRecord({ record, tokens, preferredSlugs }),
		}))
		.filter((item) => item.score > 0)
		.sort((a, b) => b.score - a.score)
		.slice(0, limit)
		.map((item) => item.record);
}
