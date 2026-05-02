create table if not exists public.destinations (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  city text not null,
  category_focus text[] not null default '{}',
  short_pitch text not null,
  detail text not null,
  highlights text[] not null default '{}',
  pace_tags text[] not null default '{}',
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.sample_itineraries (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  title text not null,
  city text not null,
  category text,
  duration_days integer not null default 3,
  summary text not null,
  highlights text[] not null default '{}',
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.leads (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid references public.conversations(id) on delete set null,
  email text,
  name text,
  interest text,
  preferred_cities text[] not null default '{}',
  notes text,
  source text not null default 'chat' check (source in ('chat', 'booking', 'manual')),
  status text not null default 'new' check (status in ('new', 'qualified', 'contacted', 'closed')),
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

drop trigger if exists set_destinations_updated_at on public.destinations;
create trigger set_destinations_updated_at
before update on public.destinations
for each row execute function public.set_updated_at();

drop trigger if exists set_sample_itineraries_updated_at on public.sample_itineraries;
create trigger set_sample_itineraries_updated_at
before update on public.sample_itineraries
for each row execute function public.set_updated_at();

drop trigger if exists set_leads_updated_at on public.leads;
create trigger set_leads_updated_at
before update on public.leads
for each row execute function public.set_updated_at();

insert into public.destinations (
  slug,
  name,
  city,
  category_focus,
  short_pitch,
  detail,
  highlights,
  pace_tags
)
values
  (
    'beijing',
    'Beijing',
    'beijing',
    '{calligraphy,photography,tcm}',
    'Imperial layers, hutong life, and a city where ritual still shapes how history is felt.',
    'Beijing matters when the route balances monuments with neighborhood life: imperial order, socialist memory, and lived texture all sit on top of one another.',
    '{Forbidden City,Hutong life,Ritual and memory}',
    '{balanced,immersive}'
  ),
  (
    'chengdu',
    'Chengdu',
    'chengdu',
    '{tea,sichuan_food}',
    'Tea-house rhythm, deep food culture, and a city whose comfort is part of its cultural meaning.',
    'Chengdu works best for travelers who want daily life, appetite, and slower observation rather than only landmark accumulation.',
    '{Tea-house rhythm,Sichuan flavor,Gentle urban pace}',
    '{slow,balanced}'
  ),
  (
    'chongqing',
    'Chongqing',
    'chongqing',
    '{sichuan_food,photography}',
    'Vertical streets, river drama, and a city whose geography shapes every meal and every image.',
    'Chongqing is strongest when framed as an urban culture route: topography, nightlife, and food all reinforce one another.',
    '{Mountain city structure,Night energy,Hotpot culture}',
    '{balanced,immersive}'
  ),
  (
    'jingdezhen',
    'Jingdezhen',
    'jingdezhen',
    '{porcelain}',
    'Porcelain, kilns, material knowledge, and one of the clearest craft cultures in China.',
    'Jingdezhen should be handled as a making culture, not only a shopping stop: process, firing, studio practice, and collecting context matter.',
    '{Kilns and workshops,Material culture,Craft continuity}',
    '{slow,immersive}'
  ),
  (
    'quanzhou',
    'Quanzhou',
    'quanzhou',
    '{maritime_silk_road,photography}',
    'Port memory, temple landscapes, and one of the richest urban stories of exchange in China.',
    'Quanzhou rewards slower reading: trade, architecture, religion, and everyday life are layered into the same streets.',
    '{Port history,Temple landscapes,Layered faiths}',
    '{balanced,immersive}'
  )
on conflict (slug) do update set
  short_pitch = excluded.short_pitch,
  detail = excluded.detail,
  highlights = excluded.highlights,
  pace_tags = excluded.pace_tags,
  updated_at = timezone('utc', now());

insert into public.sample_itineraries (
  slug,
  title,
  city,
  category,
  duration_days,
  summary,
  highlights
)
values
  (
    'jingdezhen-ceramic-deep-dive',
    '3-Day Jingdezhen Ceramic Deep Dive',
    'jingdezhen',
    'porcelain',
    3,
    'A quieter route through kiln history, workshop practice, and collecting culture rather than a generic craft checklist.',
    '{Imperial kiln context,Hands-on workshop,Studio conversations}'
  ),
  (
    'chengdu-tea-and-food',
    '3-Day Chengdu Tea and Food Route',
    'chengdu',
    'tea',
    3,
    'A slower Chengdu route built around tea-house rhythm, local markets, and how food reveals everyday life.',
    '{Tea-house orientation,Market decoding,Sichuan table culture}'
  ),
  (
    'chongqing-urban-drama',
    '3-Day Chongqing Urban Drama Route',
    'chongqing',
    'photography',
    3,
    'A visually led city route that ties elevation, river views, and bold food culture into one coherent experience.',
    '{Topography and skyline,Night walking,Food scene context}'
  ),
  (
    'quanzhou-maritime-memory',
    '3-Day Quanzhou Maritime Memory Route',
    'quanzhou',
    'maritime_silk_road',
    3,
    'A port-history route through temples, architecture, and the lingering logic of exchange.',
    '{Port history,Temple network,Street-level trade memory}'
  ),
  (
    'beijing-cultural-reading',
    '3-Day Beijing Cultural Reading',
    'beijing',
    'calligraphy',
    3,
    'A refined introduction to Beijing that connects imperial scale with hutong life and intellectual culture.',
    '{Imperial order,Hutong texture,Urban memory}'
  )
on conflict (slug) do update set
  summary = excluded.summary,
  highlights = excluded.highlights,
  updated_at = timezone('utc', now());
