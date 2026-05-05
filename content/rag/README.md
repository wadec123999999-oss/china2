# Destination RAG Seed Data

This folder contains exportable seed records for the destination knowledge layer.

## Files

- `destination-knowledge.jsonl`: JSONL records generated from `lib/destination-positioning.ts`.

## Generate

```bash
pnpm export:destination-rag
```

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
