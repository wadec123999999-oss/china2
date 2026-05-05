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
  with tokens as (
    select array_agg(distinct token) filter (where length(token) >= 3) as terms
    from regexp_split_to_table(lower(coalesce(query_text, '')), '[^a-z0-9]+') as token
  ),
  scored as (
    select
      doc.*,
      (
        select count(*)::real
        from unnest(coalesce(tokens.terms, '{}')) as term
        where
          lower(doc.destination_name) like '%' || term || '%'
          or lower(coalesce(doc.destination_slug, '')) like '%' || term || '%'
          or lower(doc.content_type) like '%' || term || '%'
          or lower(doc.title) like '%' || term || '%'
          or lower(doc.body) like '%' || term || '%'
          or exists (
            select 1
            from unnest(doc.tags) as tag
            where lower(tag) like '%' || term || '%'
          )
      )
      + case
          when match_destination_slugs is not null
            and cardinality(match_destination_slugs) > 0
            and doc.destination_slug = any(match_destination_slugs)
          then 8
          else 0
        end
      + case doc.content_type
          when 'positioning_overview' then 1.6
          when 'sell_point' then 1.2
          when 'route_seed' then 1.0
          when 'traveler_faq' then 0.6
          else 0.3
        end as score
    from public.rag_documents doc
    cross join tokens
    where
      (
        match_destination_slugs is null
        or cardinality(match_destination_slugs) = 0
        or doc.destination_slug = any(match_destination_slugs)
      )
  )
  select
    scored.id,
    scored.destination_slug,
    scored.destination_name,
    scored.content_type,
    scored.title,
    scored.body,
    scored.tags,
    scored.metadata,
    scored.score as rank
  from scored
  where scored.score > 0
  order by scored.score desc, scored.updated_at desc
  limit greatest(1, least(coalesce(match_limit, 8), 24));
$$;
