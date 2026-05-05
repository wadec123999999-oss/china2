create table if not exists public.rag_documents (
  id text primary key,
  destination_slug text references public.destinations(slug) on delete cascade,
  destination_name text not null,
  language text not null default 'en',
  content_type text not null check (
    content_type in (
      'positioning_overview',
      'sell_point',
      'audience_fit',
      'route_seed',
      'traveler_faq',
      'attraction',
      'experience',
      'food',
      'transport',
      'market_profile',
      'source_note'
    )
  ),
  title text not null,
  body text not null,
  tags text[] not null default '{}',
  metadata jsonb not null default '{}'::jsonb,
  source text not null,
  source_url text,
  source_confidence text not null default 'curated' check (
    source_confidence in ('official', 'curated', 'operator_note', 'review_derived', 'unverified')
  ),
  content_version text not null default 'v1',
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create index if not exists rag_documents_destination_idx
on public.rag_documents (destination_slug);

create index if not exists rag_documents_content_type_idx
on public.rag_documents (content_type);

create index if not exists rag_documents_tags_idx
on public.rag_documents using gin (tags);

create index if not exists rag_documents_metadata_idx
on public.rag_documents using gin (metadata);

drop trigger if exists set_rag_documents_updated_at on public.rag_documents;
create trigger set_rag_documents_updated_at
before update on public.rag_documents
for each row execute function public.set_updated_at();
