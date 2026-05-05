import fs from "node:fs";
import path from "node:path";

const rootDir = process.cwd();
const inputPath = path.join(rootDir, "content", "rag", "destination-knowledge.jsonl");
const outputPath = path.join(rootDir, "content", "rag", "destination-knowledge.seed.sql");

function sqlString(value) {
	if (value === null || value === undefined) return "null";
	return `'${String(value).replace(/'/g, "''")}'`;
}

function sqlTextArray(values) {
	return `array[${values.map(sqlString).join(", ")}]::text[]`;
}

const records = fs
	.readFileSync(inputPath, "utf8")
	.split(/\r?\n/)
	.map((line) => line.trim())
	.filter(Boolean)
	.map((line) => JSON.parse(line));

const rows = records.map((record) => {
	return `(
  ${sqlString(record.id)},
  ${sqlString(record.destination_slug)},
  ${sqlString(record.destination_name)},
  ${sqlString(record.language)},
  ${sqlString(record.content_type)},
  ${sqlString(record.title)},
  ${sqlString(record.text)},
  ${sqlTextArray(record.tags ?? [])},
  ${sqlString(JSON.stringify(record.metadata ?? {}))}::jsonb,
  ${sqlString(record.source)},
  null,
  'curated',
  ${sqlString(record.version)}
)`;
});

const sql = `insert into public.rag_documents (
  id,
  destination_slug,
  destination_name,
  language,
  content_type,
  title,
  body,
  tags,
  metadata,
  source,
  source_url,
  source_confidence,
  content_version
)
values
${rows.join(",\n")}
on conflict (id) do update set
  destination_slug = excluded.destination_slug,
  destination_name = excluded.destination_name,
  language = excluded.language,
  content_type = excluded.content_type,
  title = excluded.title,
  body = excluded.body,
  tags = excluded.tags,
  metadata = excluded.metadata,
  source = excluded.source,
  source_url = excluded.source_url,
  source_confidence = excluded.source_confidence,
  content_version = excluded.content_version,
  updated_at = timezone('utc', now());
`;

fs.writeFileSync(outputPath, sql, "utf8");
console.log(`Wrote ${records.length} rag_documents seed rows to ${outputPath}`);
