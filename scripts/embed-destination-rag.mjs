import { createClient } from "@supabase/supabase-js";
import { config as loadEnv } from "dotenv";

loadEnv({ path: ".env.local" });

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const embeddingApiKey =
	process.env.EMBEDDING_API_KEY ??
	process.env.OPENAI_API_KEY ??
	process.env.LLM_API_KEY;
const embeddingBaseUrl =
	process.env.EMBEDDING_BASE_URL ??
	process.env.OPENAI_BASE_URL ??
	process.env.LLM_BASE_URL ??
	"https://api.openai.com/v1";
const embeddingModel =
	process.env.EMBEDDING_MODEL ?? "text-embedding-3-small";
const embeddingDimensions = Number.parseInt(
	process.env.EMBEDDING_DIMENSIONS ?? "1536",
	10,
);

if (!supabaseUrl || !serviceRoleKey) {
	throw new Error(
		"Missing NEXT_PUBLIC_SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY.",
	);
}

if (!embeddingApiKey) {
	throw new Error(
		"Missing EMBEDDING_API_KEY, OPENAI_API_KEY, or LLM_API_KEY.",
	);
}

if (embeddingDimensions !== 1536) {
	throw new Error(
		"Current Supabase vector column is vector(1536). Set EMBEDDING_DIMENSIONS=1536 or add a matching migration.",
	);
}

const supabase = createClient(supabaseUrl, serviceRoleKey, {
	auth: {
		autoRefreshToken: false,
		persistSession: false,
	},
});

async function embed(text) {
	const response = await fetch(
		`${embeddingBaseUrl.replace(/\/$/, "")}/embeddings`,
		{
			method: "POST",
			headers: {
				Authorization: `Bearer ${embeddingApiKey}`,
				"Content-Type": "application/json",
			},
			body: JSON.stringify({
				model: embeddingModel,
				input: text,
				dimensions: embeddingDimensions,
			}),
		},
	);

	if (!response.ok) {
		const body = await response.text().catch(() => "");
		throw new Error(`Embedding request failed ${response.status}: ${body}`);
	}

	const data = await response.json();
	const vector = data?.data?.[0]?.embedding;
	if (!Array.isArray(vector) || vector.length !== embeddingDimensions) {
		throw new Error(
			`Embedding dimension mismatch. Expected ${embeddingDimensions}, got ${vector?.length ?? "none"}.`,
		);
	}

	return vector;
}

const { data: documents, error } = await supabase
	.from("rag_documents")
	.select("id, destination_name, content_type, title, body, tags")
	.is("embedding", null)
	.order("destination_slug", { ascending: true })
	.limit(200);

if (error) {
	throw new Error(`Failed to read rag_documents: ${error.message}`);
}

let embedded = 0;

for (const document of documents ?? []) {
	const input = [
		document.destination_name,
		document.content_type,
		document.title,
		document.body,
		(document.tags ?? []).join(", "),
	].join("\n");

	const embedding = await embed(input);
	const { error: updateError } = await supabase
		.from("rag_documents")
		.update({
			embedding,
			embedding_model: embeddingModel,
			embedded_at: new Date().toISOString(),
		})
		.eq("id", document.id);

	if (updateError) {
		throw new Error(`Failed to update ${document.id}: ${updateError.message}`);
	}

	embedded += 1;
	console.log(`Embedded ${embedded}: ${document.id}`);
}

console.log(`Embedded ${embedded} RAG documents.`);
