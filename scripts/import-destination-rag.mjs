import fs from "node:fs";
import path from "node:path";

import { createClient } from "@supabase/supabase-js";

const rootDir = process.cwd();
const inputPath = path.join(rootDir, "content", "rag", "destination-knowledge.jsonl");

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !serviceRoleKey) {
	throw new Error(
		"Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY.",
	);
}

const records = fs
	.readFileSync(inputPath, "utf8")
	.split(/\r?\n/)
	.map((line) => line.trim())
	.filter(Boolean)
	.map((line) => JSON.parse(line));

const rows = records.map((record) => ({
	id: record.id,
	destination_slug: record.destination_slug,
	destination_name: record.destination_name,
	language: record.language,
	content_type: record.content_type,
	title: record.title,
	body: record.text,
	tags: record.tags ?? [],
	metadata: record.metadata ?? {},
	source: record.source,
	source_url: null,
	source_confidence: "curated",
	content_version: record.version,
}));

const supabase = createClient(supabaseUrl, serviceRoleKey, {
	auth: {
		autoRefreshToken: false,
		persistSession: false,
	},
});

const batchSize = 100;
let imported = 0;

for (let index = 0; index < rows.length; index += batchSize) {
	const batch = rows.slice(index, index + batchSize);
	const { error } = await supabase.from("rag_documents").upsert(batch, {
		onConflict: "id",
	});

	if (error) {
		throw new Error(`Failed to import batch ${index / batchSize + 1}: ${error.message}`);
	}

	imported += batch.length;
}

console.log(`Imported ${imported} destination RAG rows into Supabase.`);
