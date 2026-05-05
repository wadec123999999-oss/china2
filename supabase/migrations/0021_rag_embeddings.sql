create extension if not exists vector;

alter table public.rag_documents
add column if not exists embedding vector(1536);

alter table public.rag_documents
add column if not exists embedding_model text;

alter table public.rag_documents
add column if not exists embedded_at timestamptz;

create index if not exists rag_documents_embedding_idx
on public.rag_documents
using ivfflat (embedding vector_cosine_ops)
with (lists = 32)
where embedding is not null;

create or replace function public.match_rag_documents(
  query_embedding vector(1536),
  match_destination_slugs text[] default null,
  match_limit integer default 8
)
returns table (
  id text,
  destination_slug text,
  destination_name text,
  content_type text,
  title text,
  body text,
  tags text[],
  metadata jsonb,
  similarity real
)
language sql
stable
as $$
  select
    doc.id,
    doc.destination_slug,
    doc.destination_name,
    doc.content_type,
    doc.title,
    doc.body,
    doc.tags,
    doc.metadata,
    (1 - (doc.embedding <=> query_embedding))::real as similarity
  from public.rag_documents doc
  where
    doc.embedding is not null
    and (
      match_destination_slugs is null
      or cardinality(match_destination_slugs) = 0
      or doc.destination_slug = any(match_destination_slugs)
    )
  order by doc.embedding <=> query_embedding
  limit greatest(1, least(coalesce(match_limit, 8), 24));
$$;
