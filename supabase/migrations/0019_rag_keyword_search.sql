create index if not exists rag_documents_fts_idx
on public.rag_documents
using gin (
  to_tsvector(
    'english',
    coalesce(title, '') || ' ' || coalesce(body, '')
  )
);

create or replace function public.search_rag_documents(
  query_text text,
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
  rank real
)
language sql
stable
as $$
  with query as (
    select websearch_to_tsquery('english', coalesce(query_text, '')) as tsq
  )
  select
    doc.id,
    doc.destination_slug,
    doc.destination_name,
    doc.content_type,
    doc.title,
    doc.body,
    doc.tags,
    doc.metadata,
    ts_rank_cd(
      to_tsvector(
        'english',
        coalesce(doc.title, '') || ' ' || coalesce(doc.body, '')
      ),
      query.tsq
    ) as rank
  from public.rag_documents doc, query
  where
    query.tsq @@ to_tsvector(
      'english',
      coalesce(doc.title, '') || ' ' || coalesce(doc.body, '')
    )
    and (
      match_destination_slugs is null
      or cardinality(match_destination_slugs) = 0
      or doc.destination_slug = any(match_destination_slugs)
    )
  order by rank desc, doc.updated_at desc
  limit greatest(1, least(coalesce(match_limit, 8), 24));
$$;
