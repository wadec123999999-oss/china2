# Destination RAG Seed Data

This folder contains exportable seed records for the destination knowledge layer.

## Files

- `destination-knowledge.jsonl`: JSONL records generated from `lib/destination-positioning.ts`.
- `destination-knowledge.seed.sql`: SQL seed generated from the JSONL file for `public.rag_documents`.

## Generate

```bash
pnpm export:destination-rag
pnpm export:destination-rag-sql
pnpm import:destination-rag
```

## Supabase Import

When a real Supabase project is available:

1. Apply migrations through `supabase db push`, or paste `supabase/migrations/0018_rag_documents.sql` and `supabase/migrations/0019_rag_keyword_search.sql` into Supabase SQL Editor.
2. Paste `content/rag/destination-knowledge.seed.sql` into Supabase SQL Editor to upsert the 70 seed rows.
3. Alternatively run `pnpm import:destination-rag` after `.env.local` has a working Supabase URL and service role key.
4. The `search_rag_documents` SQL function provides a keyword-search layer over `title`, `body`, and `tags`.
5. Later, add embeddings / pgvector on top of `rag_documents.body`. Until then, keyword retrieval can use `destination_slug`, `content_type`, `tags`, `title`, and `body`.

## Record Shape

Each line is a standalone JSON object with:

- `id`: stable record id.
- `destination_slug`: database-style slug, for example `chongqing` or `wudang_mountain`.
- `destination_name`: display name.
- `language`: currently `en`.
- `content_type`: `positioning_overview`, `sell_point`, `audience_fit`, `route_seed`, or `traveler_faq`.
- `title`: short title for retrieval display.
- `text`: retrieval text to embed.
- `tags`: lightweight retrieval tags.
- `metadata`: structured helper fields.
- `source`: source file path.
- `version`: export version.

## Current Scope

This is not a full live database. It is a structured MVP knowledge layer for the concierge and future RAG ingestion. The content focuses on why foreign travelers should come to each city, what the selling point is, who it fits, how not to frame it, and what route seeds can start a planning conversation.

## Next Data Needed

- Live attraction records: opening hours, tickets, booking links, accessibility.
- Food and experience records: restaurants, markets, guides, studios, tea gardens, Taiji sessions.
- Market-specific records: Southeast Asia, Japan/Korea, North America, Europe, Middle East.
- Source register: official sources, guidebooks, reviews, first-hand notes, confidence level.
