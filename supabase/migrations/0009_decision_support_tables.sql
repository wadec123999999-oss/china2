create table if not exists public.experience_points (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  theme_slug text references public.destination_themes(slug) on delete set null,
  slug text not null unique,
  title text not null,
  type text not null,
  summary text not null,
  good_for text[] not null default '{}',
  not_best_for text[] not null default '{}',
  booking_required boolean not null default false,
  duration_minutes integer,
  typical_price_range text,
  language_dependency text not null default 'medium' check (language_dependency in ('low', 'medium', 'high')),
  difficulty text not null default 'low' check (difficulty in ('low', 'medium', 'high')),
  foreign_visitor_friendliness integer not null default 3 check (foreign_visitor_friendliness between 1 and 5),
  source_urls text[] not null default '{}',
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.practical_facts (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  entity_type text not null,
  entity_slug text not null,
  fact_type text not null,
  value_text text,
  value_number numeric,
  currency text,
  source_url text,
  confidence_score numeric(3,2) not null default 0.70,
  last_verified_at date,
  needs_refresh boolean not null default false,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.ugc_signals (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  theme_slug text references public.destination_themes(slug) on delete set null,
  platform text not null,
  signal_type text not null check (signal_type in ('faq', 'concern', 'delight', 'misunderstanding', 'planning_blocker')),
  quote_or_paraphrase text not null,
  frequency_level text not null default 'medium' check (frequency_level in ('low', 'medium', 'high')),
  sentiment text not null default 'neutral' check (sentiment in ('positive', 'neutral', 'negative', 'curious', 'mixed')),
  use_case text,
  source_url text,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.content_angles (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  audience_slug text references public.traveler_audiences(slug) on delete cascade,
  slug text not null unique,
  headline_angle text not null,
  main_emotional_hook text not null,
  supporting_points text[] not null default '{}',
  avoid_points text[] not null default '{}',
  cta_style text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

drop trigger if exists set_experience_points_updated_at on public.experience_points;
create trigger set_experience_points_updated_at
before update on public.experience_points
for each row execute function public.set_updated_at();

drop trigger if exists set_practical_facts_updated_at on public.practical_facts;
create trigger set_practical_facts_updated_at
before update on public.practical_facts
for each row execute function public.set_updated_at();

drop trigger if exists set_ugc_signals_updated_at on public.ugc_signals;
create trigger set_ugc_signals_updated_at
before update on public.ugc_signals
for each row execute function public.set_updated_at();

drop trigger if exists set_content_angles_updated_at on public.content_angles;
create trigger set_content_angles_updated_at
before update on public.content_angles
for each row execute function public.set_updated_at();

insert into public.experience_points (
  destination_slug,
  theme_slug,
  slug,
  title,
  type,
  summary,
  good_for,
  not_best_for,
  booking_required,
  duration_minutes,
  typical_price_range,
  language_dependency,
  difficulty,
  foreign_visitor_friendliness,
  source_urls
)
values
  (
    'quanzhou',
    'qz-maritime-silk-road',
    'qz-maritime-core-walk',
    'Maritime Silk Road Core Walk',
    'walking_route',
    'A guided city-core walk that explains Quanzhou through the port story, UNESCO framing, and visible layers of exchange.',
    '{Europe,United States,Middle East,Japan,Korea,academic groups}',
    '{travelers seeking only beach leisure}',
    true,
    240,
    'medium',
    'medium',
    'low',
    4,
    '{https://whc.unesco.org/en/list/1561/}'
  ),
  (
    'beijing',
    'bj-hutong-life',
    'bj-hutong-neighborhood-walk',
    'Hutong Neighborhood Walk',
    'walking_route',
    'A slower neighborhood route through lanes, courtyards, and local urban texture rather than a capital-city checklist.',
    '{photography travelers,North America,Europe,repeat visitors}',
    '{travelers wanting only major monuments}',
    true,
    180,
    'medium',
    'medium',
    'low',
    4,
    '{https://english.visitbeijing.com.cn/article/47OMs0rcAFo}'
  ),
  (
    'jingdezhen',
    'jdz-studio-making',
    'jdz-studio-process-visit',
    'Studio Process Visit',
    'studio_visit',
    'A workshop-centered visit focused on clay, glaze, firing logic, and how makers actually work.',
    '{design travelers,makers,collectors,Japan,Europe}',
    '{travelers looking only for quick shopping}',
    true,
    120,
    'medium-high',
    'high',
    'low',
    4,
    '{https://www.unesco.org/en/creative-cities/jingdezhen}'
  ),
  (
    'chengdu',
    'cd-teahouse-rhythm',
    'cd-teahouse-afternoon',
    'Tea-House Afternoon',
    'culture_session',
    'A tea-house based experience built around local pace, conversation, and understanding why Chengdu feels slower than other big cities.',
    '{slow travelers,food travelers,North America,Australia}',
    '{travelers who dislike sitting-based experiences}',
    false,
    150,
    'low-medium',
    'low',
    'low',
    5,
    '{https://www.unesco.org/en/creative-cities/chengdu}'
  ),
  (
    'chongqing',
    'cq-night-city',
    'cq-night-view-and-movement',
    'Night View and Movement Route',
    'urban_route',
    'An evening route focused on vertical movement, river-edge views, and why Chongqing feels most itself after dark.',
    '{Korea,Japan,photography travelers,younger travelers}',
    '{travelers avoiding crowds or night walking}',
    true,
    210,
    'medium',
    'medium',
    'medium',
    4,
    '{https://www.chinadaily.com.cn/a/202104/14/WS60762274a31024ad0bab54d3.html}'
  ),
  (
    'jingmai_mountain',
    'jm-ancient-tea-forest',
    'jm-tea-forest-village-day',
    'Tea Forest and Village Day',
    'landscape_route',
    'A slow day through tea forest, village continuity, and tasting culture rather than a generic scenic drive.',
    '{tea travelers,wellness travelers,Australia,Europe}',
    '{travelers needing fast-paced urban structure}',
    true,
    360,
    'medium-high',
    'medium',
    'medium',
    3,
    '{https://whc.unesco.org/en/list/1665/}'
  ),
  (
    'wudang_mountain',
    'wd-internal-practice',
    'wd-mountain-practice-session',
    'Mountain Practice Session',
    'practice_session',
    'A light embodied session that introduces Wudang through breath, posture, and internal rhythm rather than performance spectacle.',
    '{wellness travelers,philosophy travelers,Europe,United States}',
    '{travelers expecting high-intensity adventure}',
    true,
    90,
    'medium',
    'high',
    'medium',
    3,
    '{https://whc.unesco.org/en/list/705/}'
  )
on conflict (slug) do update set
  title = excluded.title,
  summary = excluded.summary,
  good_for = excluded.good_for,
  not_best_for = excluded.not_best_for,
  booking_required = excluded.booking_required,
  duration_minutes = excluded.duration_minutes,
  typical_price_range = excluded.typical_price_range,
  language_dependency = excluded.language_dependency,
  difficulty = excluded.difficulty,
  foreign_visitor_friendliness = excluded.foreign_visitor_friendliness,
  source_urls = excluded.source_urls,
  updated_at = timezone('utc', now());

insert into public.practical_facts (
  destination_slug,
  entity_type,
  entity_slug,
  fact_type,
  value_text,
  source_url,
  confidence_score,
  last_verified_at,
  needs_refresh
)
values
  (
    'quanzhou',
    'destination',
    'quanzhou',
    'best_time_of_day',
    'Old-city walking and heritage reading are strongest in the cooler morning and late afternoon, when street texture and temple atmosphere are easier to absorb.',
    'https://whc.unesco.org/en/list/1561/',
    0.82,
    '2026-05-02',
    false
  ),
  (
    'beijing',
    'destination',
    'beijing',
    'planning_note',
    'Major imperial and heritage sites can require advance reservations or timed entry, so Beijing routes should not be treated as fully spontaneous.',
    'https://english.beijing.gov.cn/mostrequested/',
    0.75,
    '2026-05-02',
    true
  ),
  (
    'jingdezhen',
    'experience_point',
    'jdz-studio-process-visit',
    'reservation_method',
    'Studio-based visits typically work better by prior arrangement than by walk-in, especially when interpretation or workshop access is needed.',
    'https://www.unesco.org/en/creative-cities/jingdezhen',
    0.72,
    '2026-05-02',
    true
  ),
  (
    'chengdu',
    'experience_point',
    'cd-teahouse-afternoon',
    'typical_price_note',
    'Tea-house entry can be low-friction, but curated interpretation changes the value from a casual drink stop into a cultural reading of the city.',
    'https://www.unesco.org/en/creative-cities/chengdu',
    0.71,
    '2026-05-02',
    false
  ),
  (
    'chongqing',
    'experience_point',
    'cq-night-view-and-movement',
    'best_time_of_day',
    'Night routes should begin before full darkness so travelers can understand the terrain before the city shifts into its strongest visual mode.',
    'https://www.chinadaily.com.cn/a/202104/14/WS60762274a31024ad0bab54d3.html',
    0.79,
    '2026-05-02',
    false
  ),
  (
    'jingmai_mountain',
    'experience_point',
    'jm-tea-forest-village-day',
    'transport_access',
    'Jingmai works best as a planned extension with transport arranged in advance rather than as an improvised stop.',
    'https://whc.unesco.org/en/list/1665/',
    0.76,
    '2026-05-02',
    false
  ),
  (
    'wudang_mountain',
    'experience_point',
    'wd-mountain-practice-session',
    'english_support_level',
    'Interpretation quality matters more than the physical movement itself; foreign-traveler friendliness rises sharply with bilingual framing.',
    'https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html',
    0.73,
    '2026-05-02',
    false
  )
on conflict do nothing;

insert into public.ugc_signals (
  destination_slug,
  theme_slug,
  platform,
  signal_type,
  quote_or_paraphrase,
  frequency_level,
  sentiment,
  use_case,
  source_url
)
values
  (
    'quanzhou',
    'qz-hokkien-roots',
    'YouTube comments / diaspora travel interest',
    'faq',
    'Can I visit Quanzhou meaningfully if I only know my family is Hokkien but do not know the exact ancestral village?',
    'medium',
    'curious',
    'roots-travel concierge',
    null
  ),
  (
    'beijing',
    'bj-hutong-life',
    'foreign traveler blog pattern',
    'misunderstanding',
    'Travelers often think hutongs are just cute alleys, then realize the city feels much richer once those lanes are interpreted as living neighborhoods.',
    'medium',
    'mixed',
    'city interpretation framing',
    'https://english.visitbeijing.com.cn/article/47OMs0rcAFo'
  ),
  (
    'jingdezhen',
    'jdz-studio-making',
    'artist / maker travel coverage',
    'delight',
    'Foreign visitors are often surprised that Jingdezhen still feels like a live creative ecosystem rather than a finished heritage town.',
    'medium',
    'positive',
    'high-value craft traveler copy',
    'http://english.scio.gov.cn/internationalexchanges/2025-10/20/content_118132564.html'
  ),
  (
    'chengdu',
    'cd-teahouse-rhythm',
    'travel media / foreign visitor writing',
    'planning_blocker',
    'Travelers drawn to Chengdu often do not know how to turn tea-house atmosphere into an actual route rather than a single stop.',
    'high',
    'curious',
    'concierge route design',
    'https://www.nationalgeographic.com/travel/article/chengdu-ancient-teahouses-are-going-viral'
  ),
  (
    'chongqing',
    'cq-topography',
    'international media',
    'misunderstanding',
    'Many travelers first see Chongqing as a cyberpunk photo city, but need help understanding why its topography actually matters.',
    'high',
    'curious',
    'destination reframing',
    'https://www.cnn.com/travel/chongqing-china-tourism-cyberpunk-city-intl-hnk'
  ),
  (
    'jingmai_mountain',
    'jm-slow-retreat',
    'high-end travel editorial',
    'concern',
    'Travelers interested in Jingmai also worry that UNESCO fame could make the destination too touristy if not approached lightly.',
    'medium',
    'mixed',
    'expectation setting',
    'https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/'
  ),
  (
    'wudang_mountain',
    'wd-internal-practice',
    'overseas kung fu interest',
    'faq',
    'Do I need martial-arts training to get anything meaningful out of Wudang?',
    'medium',
    'curious',
    'entry-level qualification',
    'https://www.globaltimes.cn/page/202306/1291971.shtml'
  )
on conflict do nothing;

insert into public.content_angles (
  destination_slug,
  audience_slug,
  slug,
  headline_angle,
  main_emotional_hook,
  supporting_points,
  avoid_points,
  cta_style
)
values
  (
    'quanzhou',
    'seasia_diaspora',
    'qz-seasia-diaspora-angle',
    'A Hokkien homeland journey through temples, food, and family memory',
    'Quanzhou can feel less like a new destination and more like a return to cultural source memory.',
    '{roots travel,temple culture,food memory,family identity}',
    '{generic china city break,cheap beach framing}',
    'Invitation to request a tailored roots route'
  ),
  (
    'beijing',
    'north_america_cultural',
    'bj-north-america-cultural-angle',
    'Read China through imperial order, hutong texture, and the structure of the capital',
    'Beijing offers one of the clearest starting points for understanding China with seriousness and depth.',
    '{imperial space,hutong life,urban memory,architectural reading}',
    '{monument checklist,fast bus-tour framing}',
    'Prompt to start with a curated cultural day'
  ),
  (
    'jingdezhen',
    'japan_culture',
    'jdz-japan-culture-angle',
    'A porcelain city where material knowledge, making, and form still feel alive',
    'Jingdezhen rewards travelers who want to understand objects through process rather than only through shopping.',
    '{porcelain history,studios,craft continuity,object culture}',
    '{souvenir town framing,one-hour pottery gimmick}',
    'Invitation to build a deeper craft immersion'
  ),
  (
    'chengdu',
    'australia_cultural',
    'cd-australia-cultural-angle',
    'A slower China through tea houses, food, and the pleasure of local pace',
    'Chengdu makes China feel more lived-in, generous, and human-scaled.',
    '{tea-house rhythm,food culture,local ease,stay-longer city}',
    '{panda-only framing,restaurant list without interpretation}',
    'Prompt to plan a slow Chengdu route'
  ),
  (
    'chongqing',
    'korea_visual_culture',
    'cq-korea-visual-angle',
    'A vertical city of night energy, movement, appetite, and unforgettable urban atmosphere',
    'Chongqing feels most compelling when dramatic visuals are paired with a real explanation of how the city works.',
    '{night views,topography,street appetite,urban intensity}',
    '{cyberpunk-only framing,selfie-only route}',
    'Invitation to design a night-and-city route'
  ),
  (
    'jingmai_mountain',
    'australia_cultural',
    'jm-australia-slow-angle',
    'An ancient tea landscape for travelers who want mountain stillness and cultural continuity',
    'Jingmai offers a quieter and more reflective China, built around ecology, village rhythm, and tea.',
    '{tea forests,slow travel,village continuity,contemplative route}',
    '{scenic-only framing,rushed plantation stop}',
    'Prompt to request a tea retreat-style journey'
  ),
  (
    'wudang_mountain',
    'europe_heritage',
    'wd-europe-heritage-angle',
    'A Taoist sacred mountain where architecture, philosophy, and pace belong to the same experience',
    'Wudang offers a way into China through sacred space and reflective movement rather than through pure sightseeing.',
    '{taoist architecture,internal practice,mountain atmosphere,reflective travel}',
    '{kung-fu-show framing,generic mountain tourism}',
    'Invitation to plan a reflective Wudang route'
  )
on conflict (slug) do update set
  headline_angle = excluded.headline_angle,
  main_emotional_hook = excluded.main_emotional_hook,
  supporting_points = excluded.supporting_points,
  avoid_points = excluded.avoid_points,
  cta_style = excluded.cta_style,
  updated_at = timezone('utc', now());
