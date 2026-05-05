import fs from "node:fs";
import path from "node:path";

import { createClient } from "@supabase/supabase-js";
import { config as loadEnv } from "dotenv";

loadEnv({ path: ".env.local" });

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

const batchSize = 10;
let imported = 0;

async function upsertWithRetry(batch, batchNumber) {
	let lastError = null;

	for (let attempt = 1; attempt <= 3; attempt += 1) {
		const { error } = await supabase.from("rag_documents").upsert(batch, {
			onConflict: "id",
		});

		if (!error) return;
		lastError = error;
		await new Promise((resolve) => setTimeout(resolve, attempt * 750));
	}

	throw new Error(
		`Failed to import batch ${batchNumber}: ${lastError?.message ?? "unknown error"}`,
	);
}

for (let index = 0; index < rows.length; index += batchSize) {
	const batch = rows.slice(index, index + batchSize);
	await upsertWithRetry(batch, index / batchSize + 1);
	imported += batch.length;
}

console.log(`Imported ${imported} destination RAG rows into Supabase.`);
