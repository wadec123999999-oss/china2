create table if not exists public.traveler_audiences (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  name text not null,
  market_scope text not null default 'global',
  description text not null,
  trip_motive text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.destination_themes (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  slug text not null unique,
  title text not null,
  category text not null,
  summary text not null,
  why_it_matters text not null,
  default_priority integer not null default 3 check (default_priority between 1 and 10),
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.knowledge_cards (
  id text primary key,
  destination_slug text not null references public.destinations(slug) on delete cascade,
  theme_slug text references public.destination_themes(slug) on delete set null,
  title text not null,
  category text not null,
  summary text not null,
  visitor_hook text not null,
  why_it_matters text not null,
  best_for text[] not null default '{}',
  not_best_for text[] not null default '{}',
  source_urls text[] not null default '{}',
  source_type text not null default 'mixed',
  appeal_score integer not null default 3 check (appeal_score between 1 and 5),
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.knowledge_card_questions (
  id uuid primary key default gen_random_uuid(),
  knowledge_card_id text not null references public.knowledge_cards(id) on delete cascade,
  question text not null,
  sort_order integer not null default 0,
  created_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.knowledge_card_audiences (
  id uuid primary key default gen_random_uuid(),
  knowledge_card_id text not null references public.knowledge_cards(id) on delete cascade,
  audience_slug text not null references public.traveler_audiences(slug) on delete cascade,
  fit_score integer not null default 3 check (fit_score between 1 and 5),
  rationale text not null,
  created_at timestamptz not null default timezone('utc', now()),
  unique (knowledge_card_id, audience_slug)
);

create table if not exists public.faq_items (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  audience_slug text references public.traveler_audiences(slug) on delete set null,
  question text not null,
  answer text not null,
  tags text[] not null default '{}',
  source_card_ids text[] not null default '{}',
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.itinerary_modules (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  slug text not null unique,
  title text not null,
  duration_hours integer not null,
  pace text not null check (pace in ('slow', 'balanced', 'immersive')),
  summary text not null,
  why_this_sequence text not null,
  best_for text[] not null default '{}',
  conversion_cta text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.itinerary_module_cards (
  id uuid primary key default gen_random_uuid(),
  itinerary_module_id uuid not null references public.itinerary_modules(id) on delete cascade,
  knowledge_card_id text not null references public.knowledge_cards(id) on delete cascade,
  sort_order integer not null default 0,
  role text not null default 'core' check (role in ('core', 'supporting', 'optional')),
  unique (itinerary_module_id, knowledge_card_id)
);

drop trigger if exists set_traveler_audiences_updated_at on public.traveler_audiences;
create trigger set_traveler_audiences_updated_at
before update on public.traveler_audiences
for each row execute function public.set_updated_at();

drop trigger if exists set_destination_themes_updated_at on public.destination_themes;
create trigger set_destination_themes_updated_at
before update on public.destination_themes
for each row execute function public.set_updated_at();

drop trigger if exists set_knowledge_cards_updated_at on public.knowledge_cards;
create trigger set_knowledge_cards_updated_at
before update on public.knowledge_cards
for each row execute function public.set_updated_at();

drop trigger if exists set_faq_items_updated_at on public.faq_items;
create trigger set_faq_items_updated_at
before update on public.faq_items
for each row execute function public.set_updated_at();

drop trigger if exists set_itinerary_modules_updated_at on public.itinerary_modules;
create trigger set_itinerary_modules_updated_at
before update on public.itinerary_modules
for each row execute function public.set_updated_at();

insert into public.traveler_audiences (slug, name, market_scope, description, trip_motive)
values
  (
    'seasia_diaspora',
    'Southeast Asian Hokkien Diaspora',
    'regional',
    'Travelers from Southeast Asia with Hokkien, Fujian, or overseas Chinese family ties.',
    'roots travel, identity, temples, family memory, and food connection'
  ),
  (
    'japan_culture',
    'Japan Cultural Travelers',
    'national',
    'Travelers from Japan who respond to heritage, ceramics, tea, and refined city-walk experiences.',
    'heritage walking, design, tea, and photogenic cultural detail'
  ),
  (
    'korea_visual_culture',
    'Korea Visual Culture Travelers',
    'national',
    'Travelers from Korea looking for visually distinctive and shareable cultural experiences with depth.',
    'city walks, photography, styling, tea, and ceramics'
  ),
  (
    'north_america_cultural',
    'North America Cultural Travelers',
    'regional',
    'Travelers from the United States and Canada seeking deeper understanding, not just landmark coverage.',
    'history, interpretation, roots travel, and curated cultural immersion'
  ),
  (
    'australia_cultural',
    'Australia Premium Cultural Travelers',
    'national',
    'Travelers from Australia who value slower premium itineraries with strong cultural framing.',
    'craft, heritage, food, and design-forward regional travel'
  ),
  (
    'middle_east_heritage',
    'Middle East Heritage Travelers',
    'regional',
    'Travelers interested in Quanzhou''s Islamic heritage, Arab merchant history, and spice-route memory.',
    'faith, trade history, and differentiated cultural discovery'
  ),
  (
    'europe_heritage',
    'Europe Heritage Travelers',
    'regional',
    'Travelers from Europe drawn to UNESCO, medieval trade, religious coexistence, and ceramics.',
    'world history, material culture, and refined heritage travel'
  ),
  (
    'family_roots',
    'Family Roots Travelers',
    'global',
    'Multi-generational visitors planning an ancestry-oriented or identity-led journey.',
    'family meaning, explanation, and emotionally grounded route planning'
  ),
  (
    'photography_style',
    'Photography and Style Travelers',
    'global',
    'Travelers who enter through strong visuals but can convert into deeper culture if the story is coherent.',
    'photo-led discovery, styling, social sharing, and local identity'
  ),
  (
    'academic_museum',
    'Academic and Museum Groups',
    'global',
    'Researchers, museum circles, and intellectually motivated groups interested in maritime exchange and heritage systems.',
    'serious interpretation, evidence-backed storytelling, and thematic depth'
  )
on conflict (slug) do update set
  name = excluded.name,
  market_scope = excluded.market_scope,
  description = excluded.description,
  trip_motive = excluded.trip_motive,
  updated_at = timezone('utc', now());

insert into public.destination_themes (
  destination_slug,
  slug,
  title,
  category,
  summary,
  why_it_matters,
  default_priority
)
values
  (
    'quanzhou',
    'qz-maritime-silk-road',
    'Maritime Silk Road and UNESCO World Heritage',
    'heritage',
    'The strongest global frame for Quanzhou is its role as a major Song-Yuan port known historically as Zayton.',
    'This is the clearest way to explain Quanzhou to foreign visitors who may not know the city but do understand world history, UNESCO, and trade routes.',
    1
  ),
  (
    'quanzhou',
    'qz-religious-diversity',
    'Religious Diversity and Civilizational Exchange',
    'heritage',
    'Quanzhou turns maritime exchange into something visible through temples, Islamic heritage, and cross-cultural remains.',
    'This prevents the city from being sold as a generic old town and gives it a more intellectually serious travel proposition.',
    2
  ),
  (
    'quanzhou',
    'qz-hokkien-roots',
    'Hokkien Roots and Overseas Chinese Memory',
    'diaspora',
    'Quanzhou is one of the strongest roots-travel anchors in coastal China for Southeast Asian Hokkien and overseas Chinese communities.',
    'This is one of the most conversion-friendly themes because it is emotional, identity-led, and highly differentiating.',
    3
  ),
  (
    'quanzhou',
    'qz-food-life',
    'Gastronomy and Everyday Life',
    'food',
    'Food is the easiest way to make Quanzhou feel lived-in, generous, and immediately approachable.',
    'Food lowers the barrier to entry while still supporting deeper cultural interpretation.',
    4
  ),
  (
    'quanzhou',
    'qz-visual-living-culture',
    'Visual Living Culture: Xunpu and the Coast',
    'living_culture',
    'Xunpu and coastal women''s culture create one of Quanzhou''s strongest visual hooks for younger and photo-led travelers.',
    'This gives Quanzhou a memorable contemporary face without reducing it to social-media tourism.',
    5
  ),
  (
    'quanzhou',
    'qz-craft-routes',
    'Tea, Porcelain, and Incense Craft Routes',
    'craft',
    'The wider Quanzhou region supports premium, tactile extensions through tea, porcelain, and incense.',
    'These experiences turn a city visit into a curated cultural journey with higher willingness to pay.',
    6
  ),
  (
    'quanzhou',
    'qz-evening-culture',
    'Nanyin and Evening Culture',
    'intangible_heritage',
    'Nanyin adds a refined night-time layer rooted in Minnan heritage and intangible culture.',
    'This deepens itinerary quality and helps Quanzhou feel more than a daytime heritage stop.',
    7
  )
on conflict (slug) do update set
  title = excluded.title,
  category = excluded.category,
  summary = excluded.summary,
  why_it_matters = excluded.why_it_matters,
  default_priority = excluded.default_priority,
  updated_at = timezone('utc', now());

insert into public.knowledge_cards (
  id,
  destination_slug,
  theme_slug,
  title,
  category,
  summary,
  visitor_hook,
  why_it_matters,
  best_for,
  not_best_for,
  source_urls,
  source_type,
  appeal_score
)
values
  (
    'qz_world_heritage_zayton',
    'quanzhou',
    'qz-maritime-silk-road',
    'Quanzhou: Emporium of the World in Song-Yuan China',
    'world_heritage',
    'Quanzhou''s strongest international identifier is its UNESCO World Heritage status and its role as a major Maritime Silk Road port known historically as Zayton.',
    'A living Maritime Silk Road city where medieval global trade, religions, ceramics, bridges and port infrastructure still shape the urban story.',
    'This is the most efficient top-of-funnel explanation for why Quanzhou matters to foreign visitors.',
    '{Europe,United States,Middle East,Japan,Korea,Southeast Asian diaspora,academic groups}',
    '{travelers only looking for beach leisure,checklist-only city breakers}',
    '{https://whc.unesco.org/en/list/1561/}',
    'international_org',
    5
  ),
  (
    'qz_religious_diversity',
    'quanzhou',
    'qz-religious-diversity',
    'Religious Diversity in Quanzhou',
    'heritage',
    'Quanzhou is unusually strong at showing how maritime trade brought together faiths, people, and material culture within one city.',
    'Few Chinese old towns show maritime trade and religious diversity as visibly as Quanzhou.',
    'This helps position Quanzhou as a city of exchange and coexistence rather than a static heritage stop.',
    '{Middle East,Europe,United States,India,Southeast Asia,academic groups}',
    '{visitors wanting only entertainment-led travel}',
    '{https://whc.unesco.org/en/list/1561/,https://www.unesco.org/en/articles/heritage-so-young-youth-telling-stories-quanzhou-world-heritage-city-red-brick-walls-and-ancient}',
    'mixed',
    5
  ),
  (
    'qz_hokkien_roots',
    'quanzhou',
    'qz-hokkien-roots',
    'Hokkien Roots and Overseas Chinese Heritage',
    'diaspora',
    'Quanzhou is one of the strongest roots-travel cities in coastal China for Hokkien and overseas Chinese communities, linking family memory, dialect, temples, and food.',
    'For many Hokkien families overseas, Quanzhou is not just a destination; it is an ancestral starting point.',
    'This is one of Quanzhou''s most emotionally powerful and conversion-ready themes, especially for Southeast Asian diaspora markets.',
    '{Philippines,Malaysia,Singapore,Indonesia,Thailand,United States,Australia,family roots}',
    '{travelers with no interest in migration or identity narratives}',
    '{https://www.quanzhou.gov.cn/gastronomy/en/about/unesco-heritage/202412/t20241203_3112420.htm}',
    'official_city',
    5
  ),
  (
    'qz_gastronomy',
    'quanzhou',
    'qz-food-life',
    'UNESCO Creative City of Gastronomy',
    'food',
    'Quanzhou food is one of the easiest and most shareable ways to explain the city''s maritime history, local life, and regional identity.',
    'Quanzhou food is one of the easiest ways to taste the city''s maritime history.',
    'Food is a low-friction acquisition hook that can still lead into heritage, trade, ritual, and everyday life.',
    '{Southeast Asia,Japan,Korea,Europe,United States,families}',
    '{travelers looking only for luxury fine dining rather than local culture}',
    '{https://www.unesco.org/en/creative-cities/quanzhou,https://www.quanzhou.gov.cn/gastronomy/en/about/unesco-heritage/202412/t20241203_3112420.htm}',
    'mixed',
    5
  ),
  (
    'qz_xunpu_zanhua',
    'quanzhou',
    'qz-visual-living-culture',
    'Xunpu Zanhua Floral Headdress',
    'intangible_heritage_photo',
    'The Xunpu floral headpiece tradition is one of Quanzhou''s strongest visual and social-media-friendly hooks when framed as living coastal women''s culture.',
    'A colorful, photogenic tradition rooted in the life of women in a fishing village near the Maritime Silk Road port.',
    'This is a strong acquisition hook for younger and visual-first travelers, but it works best when connected back to local identity and the maritime story.',
    '{Japan,Korea,Southeast Asia,Europe,United States,photography and style}',
    '{travelers seeking only academic heritage without visual culture}',
    '{https://www.quanzhou.gov.cn/gastronomy/en/about/unesco-heritage/202412/t20241203_3112420.htm}',
    'official_city',
    4
  ),
  (
    'qz_anxi_tieguanyin',
    'quanzhou',
    'qz-craft-routes',
    'Anxi Tieguanyin Oolong Tea Culture',
    'tea',
    'Anxi tea culture gives Quanzhou a premium extension through landscapes, tasting, and craft knowledge.',
    'A day trip from Quanzhou can move from the old port to the mountain landscapes behind one of China''s best-known oolong teas.',
    'Tea helps shift the product from city sightseeing into curated cultural travel with stronger willingness to pay.',
    '{Japan,Korea,Southeast Asia,Europe,United States,slow cultural travelers}',
    '{travelers seeking only fast city breaks}',
    '{https://www.fao.org/giahs/giahs-around-the-world/china-anxi-tea-culture-system/en}',
    'international_org',
    4
  ),
  (
    'qz_dehua_blanc_de_chine',
    'quanzhou',
    'qz-craft-routes',
    'Dehua White Porcelain, Blanc de Chine',
    'porcelain',
    'Dehua porcelain gives Quanzhou a strong design, ceramics, and museum-friendly narrative through the globally legible Blanc de Chine story.',
    'Blanc de Chine connects Quanzhou''s Maritime Silk Road with European porcelain taste and contemporary craft design.',
    'This is one of the strongest bridges from Quanzhou into design culture, collecting, and European material-culture narratives.',
    '{France,Italy,Germany,United Kingdom,Japan,Korea,United States,academic groups}',
    '{visitors uninterested in craft or object culture}',
    '{https://www.quanzhou.gov.cn/gastronomy/en/about/unesco-heritage/202412/t20241203_3112420.htm}',
    'official_city',
    4
  ),
  (
    'qz_yongchun_incense',
    'quanzhou',
    'qz-craft-routes',
    'Yongchun Incense and the Spice Routes',
    'incense',
    'Yongchun incense expands Quanzhou''s appeal through scent, ritual, trade memory, and spice-route storytelling.',
    'An aroma-based heritage experience linking Chinese incense, Arab spice routes and the Maritime Silk Road.',
    'This gives Quanzhou a differentiated sensory story, especially for Middle East and heritage-oriented markets.',
    '{Middle East,Europe,United States,Southeast Asia,India,slow cultural travelers}',
    '{travelers wanting only headline landmarks}',
    '{https://www.quanzhou.gov.cn/gastronomy/en/about/unesco-heritage/202412/t20241203_3112420.htm}',
    'official_city',
    4
  ),
  (
    'qz_nanyin',
    'quanzhou',
    'qz-evening-culture',
    'Nanyin, the Sound of Minnan Heritage',
    'performing_arts',
    'Nanyin adds evening depth and intangible-heritage credibility to a Quanzhou itinerary.',
    'An intimate evening performance can turn Quanzhou''s old-town heritage into sound.',
    'This is especially useful for cultural depth, itinerary pacing, and premium interpretive programs.',
    '{Southeast Asian diaspora,Europe,United States,Japan,Korea,academic groups}',
    '{travelers wanting only quick daytime sightseeing}',
    '{https://ich.unesco.org/en/RL/nanyin-00199}',
    'international_org',
    4
  ),
  (
    'qz_coast_bridges',
    'quanzhou',
    'qz-visual-living-culture',
    'Coast, Ancient Towns and Bridges',
    'coast_citywalk',
    'Quanzhou''s coast, bridges, fishing settlements, and old-town atmosphere work best as supporting layers inside larger heritage and living-culture routes.',
    'The coast is best experienced as part of Quanzhou''s maritime story: bridges, fishing villages, seafood, stone carving and old ports.',
    'This helps keep the destination from being misframed as generic seaside leisure while still preserving scenic and family-friendly value.',
    '{Japan,Korea,Southeast Asia,families,photographers}',
    '{travelers expecting a resort-style beach holiday}',
    '{https://whc.unesco.org/en/list/1561/,https://www.quanzhou.gov.cn/gastronomy/en/about/unesco-heritage/202412/t20241203_3112420.htm}',
    'mixed',
    3
  ),
  (
    'qz_2025_inbound_growth',
    'quanzhou',
    'qz-maritime-silk-road',
    '2025 Inbound Tourism Growth and Overseas Promotion Markets',
    'market_data',
    'Recent inbound growth signals strengthen the case for English-language product building, concierge planning, and market-specific messaging for Quanzhou.',
    'Quanzhou is actively positioning itself for international visitors, especially across Asia, the Middle East and the United States.',
    'This is a strategy card rather than a traveler-facing one, useful for deciding where to invest content, service, and outbound sales effort.',
    '{Japan,Malaysia,Singapore,Philippines,United Arab Emirates,United States,destination operators}',
    '{travelers seeking itinerary inspiration rather than market context}',
    '{https://ttgchina.com/2025/08/21/%E7%A6%8F%E5%BB%BA%E6%B3%89%E5%B7%9E%E5%85%A5%E5%A2%83%E6%97%85%E6%B8%B82025%E4%B8%8A%E5%8D%8A%E5%B9%B4%E8%BF%85%E7%8C%9B%E5%8F%91%E5%B1%95/}',
    'industry_media',
    4
  )
on conflict (id) do update set
  theme_slug = excluded.theme_slug,
  title = excluded.title,
  category = excluded.category,
  summary = excluded.summary,
  visitor_hook = excluded.visitor_hook,
  why_it_matters = excluded.why_it_matters,
  best_for = excluded.best_for,
  not_best_for = excluded.not_best_for,
  source_urls = excluded.source_urls,
  source_type = excluded.source_type,
  appeal_score = excluded.appeal_score,
  updated_at = timezone('utc', now());

insert into public.knowledge_card_questions (knowledge_card_id, question, sort_order)
values
  ('qz_world_heritage_zayton', 'Why is Quanzhou a UNESCO World Heritage city?', 1),
  ('qz_world_heritage_zayton', 'What does Zayton mean?', 2),
  ('qz_world_heritage_zayton', 'Was Quanzhou an important port in ancient China?', 3),
  ('qz_religious_diversity', 'Are there Islamic heritage sites in Quanzhou?', 1),
  ('qz_religious_diversity', 'Why are there Hindu carvings in Quanzhou?', 2),
  ('qz_religious_diversity', 'What makes Quanzhou different from other Chinese old towns?', 3),
  ('qz_hokkien_roots', 'My family is Hokkien. Should I visit Quanzhou?', 1),
  ('qz_hokkien_roots', 'Can I do a roots tour in Quanzhou?', 2),
  ('qz_hokkien_roots', 'How is Quanzhou connected to Southeast Asian Chinese communities?', 3),
  ('qz_gastronomy', 'Why is Quanzhou interesting for food-focused travelers?', 1),
  ('qz_gastronomy', 'How does food connect to Quanzhou''s history?', 2),
  ('qz_xunpu_zanhua', 'What is Xunpu and why is it so popular?', 1),
  ('qz_xunpu_zanhua', 'Is the floral headdress only for photos, or does it have cultural meaning?', 2),
  ('qz_anxi_tieguanyin', 'Can I add a tea day trip to a Quanzhou itinerary?', 1),
  ('qz_anxi_tieguanyin', 'Why is Tieguanyin a strong fit for premium cultural travelers?', 2),
  ('qz_dehua_blanc_de_chine', 'What is Blanc de Chine and why does it matter here?', 1),
  ('qz_dehua_blanc_de_chine', 'Is Dehua a good add-on for art and design travelers?', 2),
  ('qz_yongchun_incense', 'What makes incense culture near Quanzhou special?', 1),
  ('qz_yongchun_incense', 'How does incense connect to maritime trade?', 2),
  ('qz_nanyin', 'What is Nanyin?', 1),
  ('qz_nanyin', 'Can I hear traditional Minnan music in Quanzhou?', 2),
  ('qz_coast_bridges', 'Is Quanzhou a beach destination?', 1),
  ('qz_coast_bridges', 'What should I combine with the coast in Quanzhou?', 2),
  ('qz_2025_inbound_growth', 'Why invest in Quanzhou inbound products now?', 1)
on conflict do nothing;

insert into public.knowledge_card_audiences (knowledge_card_id, audience_slug, fit_score, rationale)
values
  ('qz_world_heritage_zayton', 'europe_heritage', 5, 'UNESCO and medieval trade create a clear European entry point.'),
  ('qz_world_heritage_zayton', 'north_america_cultural', 5, 'This audience responds well to historical framing and destination meaning.'),
  ('qz_world_heritage_zayton', 'middle_east_heritage', 4, 'Port-history framing helps bridge into Arab trade connections.'),
  ('qz_world_heritage_zayton', 'academic_museum', 5, 'Strong fit for serious interpretation and world-history comparison.'),
  ('qz_religious_diversity', 'middle_east_heritage', 5, 'Islamic heritage and coexistence are core reasons this market may care.'),
  ('qz_religious_diversity', 'europe_heritage', 5, 'Comparative religion and exchange themes travel well in Europe.'),
  ('qz_religious_diversity', 'academic_museum', 5, 'High value for study tours and interpretive groups.'),
  ('qz_hokkien_roots', 'seasia_diaspora', 5, 'This is one of the strongest roots-travel hooks in the whole Quanzhou proposition.'),
  ('qz_hokkien_roots', 'family_roots', 5, 'The card directly supports ancestry-oriented route building.'),
  ('qz_hokkien_roots', 'australia_cultural', 4, 'Useful for diaspora and family-history-driven travel from Australia.'),
  ('qz_gastronomy', 'japan_culture', 4, 'Food is an accessible way in for culturally curious Japanese visitors.'),
  ('qz_gastronomy', 'korea_visual_culture', 4, 'Food and city texture are strong Korean market hooks.'),
  ('qz_gastronomy', 'north_america_cultural', 4, 'Food helps translate local life into something immediate and memorable.'),
  ('qz_xunpu_zanhua', 'korea_visual_culture', 5, 'Highly visual cultural experiences fit this audience well.'),
  ('qz_xunpu_zanhua', 'japan_culture', 4, 'Works when paired with local identity and not only photography.'),
  ('qz_xunpu_zanhua', 'photography_style', 5, 'This is the clearest photo-led acquisition hook.'),
  ('qz_anxi_tieguanyin', 'japan_culture', 5, 'Tea culture is a strong fit for refined and process-oriented travel.'),
  ('qz_anxi_tieguanyin', 'europe_heritage', 4, 'Tea landscapes add premium depth to heritage itineraries.'),
  ('qz_anxi_tieguanyin', 'north_america_cultural', 4, 'Useful for travelers seeking slow, curated extension days.'),
  ('qz_dehua_blanc_de_chine', 'europe_heritage', 5, 'Blanc de Chine makes Dehua legible in European decorative-arts terms.'),
  ('qz_dehua_blanc_de_chine', 'academic_museum', 5, 'Very strong fit for museums, collectors, and design researchers.'),
  ('qz_dehua_blanc_de_chine', 'japan_culture', 4, 'Ceramics and craft resonate strongly in this market.'),
  ('qz_yongchun_incense', 'middle_east_heritage', 5, 'Incense and spice-route framing create differentiated relevance.'),
  ('qz_yongchun_incense', 'europe_heritage', 4, 'Good supporting theme for trade, ritual, and sensory culture.'),
  ('qz_nanyin', 'seasia_diaspora', 4, 'A strong Minnan continuity theme for diaspora audiences.'),
  ('qz_nanyin', 'academic_museum', 5, 'High fit for intangible-heritage-oriented groups.'),
  ('qz_nanyin', 'japan_culture', 4, 'Works for audiences receptive to slower, refined performance culture.'),
  ('qz_coast_bridges', 'photography_style', 4, 'Good supporting texture for scenic and visual itineraries.'),
  ('qz_coast_bridges', 'family_roots', 3, 'Helpful as part of a broader route but usually not enough alone.'),
  ('qz_2025_inbound_growth', 'seasia_diaspora', 4, 'Useful for market-priority planning and messaging investment.'),
  ('qz_2025_inbound_growth', 'middle_east_heritage', 4, 'Helps justify future market-facing investment and outreach.')
on conflict (knowledge_card_id, audience_slug) do update set
  fit_score = excluded.fit_score,
  rationale = excluded.rationale;

insert into public.faq_items (
  destination_slug,
  audience_slug,
  question,
  answer,
  tags,
  source_card_ids
)
values
  (
    'quanzhou',
    null,
    'Why should I visit Quanzhou?',
    'Quanzhou is one of the best cities in China for travelers who want culture, history, food, and local life in one place. Its strongest appeal comes from its UNESCO World Heritage story, Maritime Silk Road history, religious diversity, Hokkien diaspora connections, and rich craft and food culture.',
    '{positioning,top-of-funnel}',
    '{qz_world_heritage_zayton,qz_religious_diversity,qz_gastronomy}'
  ),
  (
    'quanzhou',
    null,
    'What makes Quanzhou different from other historic cities in China?',
    'Quanzhou is not only about monuments. Trade, religion, migration, food, and craft all intersect here. It is a city where overseas Chinese memory, Islamic heritage, temples, ceramics, tea, incense, and daily life belong to the same story.',
    '{differentiation,heritage}',
    '{qz_religious_diversity,qz_hokkien_roots,qz_gastronomy}'
  ),
  (
    'quanzhou',
    'family_roots',
    'Can I do a roots or ancestry trip in Quanzhou?',
    'Yes. Quanzhou is especially relevant for Hokkien and Fujian diaspora families. A good roots itinerary should combine migration history, temple culture, food memory, local interpretation, and broader family-history context rather than only list ancestral sites.',
    '{diaspora,roots-travel}',
    '{qz_hokkien_roots}'
  ),
  (
    'quanzhou',
    'middle_east_heritage',
    'Is Quanzhou interesting for Muslim travelers?',
    'Yes, especially for travelers interested in history and Islamic heritage. Quanzhou is known for sites connected to early Islamic presence and maritime exchange with Arab merchants, and it works best when framed as part of a wider story of trade, faith, and cultural contact.',
    '{middle-east,islamic-heritage}',
    '{qz_religious_diversity,qz_yongchun_incense}'
  ),
  (
    'quanzhou',
    'japan_culture',
    'Is Quanzhou suitable for Japan and Korea markets?',
    'Yes. Quanzhou fits well with travelers who enjoy heritage walks, atmospheric old neighborhoods, tea, ceramics, photography, and distinctive cultural experiences such as Xunpu styling.',
    '{japan,korea,market-fit}',
    '{qz_world_heritage_zayton,qz_xunpu_zanhua,qz_anxi_tieguanyin,qz_dehua_blanc_de_chine}'
  ),
  (
    'quanzhou',
    null,
    'Is Quanzhou good for food-focused travelers?',
    'Yes. Food is one of Quanzhou''s strongest entry points. The city is well suited to travelers who enjoy markets, local snacks, regional dishes, and culinary storytelling as part of a broader cultural trip.',
    '{food,gastronomy}',
    '{qz_gastronomy}'
  ),
  (
    'quanzhou',
    'photography_style',
    'What is Xunpu and why is it popular?',
    'Xunpu refers to a coastal women''s cultural tradition associated with the famous floral headpiece look. It is popular because it is highly visual, socially shareable, and tied to local identity rather than being a generic costume attraction.',
    '{xunpu,visual-culture,photography}',
    '{qz_xunpu_zanhua}'
  ),
  (
    'quanzhou',
    null,
    'Is Quanzhou a beach destination?',
    'Not in the usual sense. It has coastal scenes and fishing-settlement culture, but that should not be the main reason to come. The coast is strongest when experienced as part of wider cultural stories about women, trade, ritual, and daily life.',
    '{coast,expectation-management}',
    '{qz_coast_bridges}'
  )
on conflict do nothing;

insert into public.itinerary_modules (
  destination_slug,
  slug,
  title,
  duration_hours,
  pace,
  summary,
  why_this_sequence,
  best_for,
  conversion_cta
)
values
  (
    'quanzhou',
    'qz-maritime-core-walk',
    'Maritime Silk Road Core Walk',
    4,
    'balanced',
    'A city-core module built around the Song-Yuan port story, UNESCO framing, and why Quanzhou mattered globally.',
    'This should come first because it gives visitors one clear mental model before they see supporting sites.',
    '{Europe,United States,Japan,Korea,academic groups}',
    'Request a tailored Quanzhou heritage route'
  ),
  (
    'quanzhou',
    'qz-faith-exchange-route',
    'Religious Diversity and Exchange Route',
    4,
    'immersive',
    'A route that turns Quanzhou''s multi-faith remains into a story about exchange, coexistence, and port-city complexity.',
    'This module works after or alongside the UNESCO framing because it deepens the city from trade story into civilizational story.',
    '{Middle East,Europe,academic groups,North America}',
    'Plan a deeper Quanzhou culture day'
  ),
  (
    'quanzhou',
    'qz-hokkien-roots-day',
    'Hokkien Roots and Family Memory Day',
    6,
    'slow',
    'A diaspora-oriented day for visitors who want Quanzhou to feel personal, familial, and emotionally legible.',
    'This module should slow down the trip and move from public heritage to identity, migration, and memory.',
    '{Philippines,Malaysia,Singapore,Indonesia,Thailand,family roots}',
    'Request a custom roots-focused Quanzhou route'
  ),
  (
    'quanzhou',
    'qz-food-and-living-culture',
    'Food and Living Culture Route',
    5,
    'balanced',
    'A route combining gastronomy, old-town texture, and local everyday life for travelers who want culture through taste and atmosphere.',
    'Food helps visitors absorb the city without information overload and works well early in the trip or as a second-day anchor.',
    '{Southeast Asia,Japan,Korea,North America,families}',
    'Build a food-led Quanzhou itinerary'
  ),
  (
    'quanzhou',
    'qz-craft-extension-day',
    'Tea, Porcelain, or Incense Extension Day',
    8,
    'slow',
    'A premium extension module that takes Quanzhou beyond city heritage into tea landscapes, porcelain culture, or incense making.',
    'This should be used after the city itself is understood, turning broad interest into a higher-value themed journey.',
    '{Europe,Japan,Korea,North America,Middle East,design travelers}',
    'Request a multi-day Quanzhou craft journey'
  )
on conflict (slug) do update set
  title = excluded.title,
  duration_hours = excluded.duration_hours,
  pace = excluded.pace,
  summary = excluded.summary,
  why_this_sequence = excluded.why_this_sequence,
  best_for = excluded.best_for,
  conversion_cta = excluded.conversion_cta,
  updated_at = timezone('utc', now());

insert into public.itinerary_module_cards (itinerary_module_id, knowledge_card_id, sort_order, role)
select m.id, c.card_id, c.sort_order, c.role
from public.itinerary_modules m
join (
  values
    ('qz-maritime-core-walk', 'qz_world_heritage_zayton', 1, 'core'),
    ('qz-maritime-core-walk', 'qz_coast_bridges', 2, 'supporting'),
    ('qz-faith-exchange-route', 'qz_religious_diversity', 1, 'core'),
    ('qz-faith-exchange-route', 'qz_world_heritage_zayton', 2, 'supporting'),
    ('qz-faith-exchange-route', 'qz_yongchun_incense', 3, 'optional'),
    ('qz-hokkien-roots-day', 'qz_hokkien_roots', 1, 'core'),
    ('qz-hokkien-roots-day', 'qz_gastronomy', 2, 'supporting'),
    ('qz-hokkien-roots-day', 'qz_nanyin', 3, 'optional'),
    ('qz-food-and-living-culture', 'qz_gastronomy', 1, 'core'),
    ('qz-food-and-living-culture', 'qz_xunpu_zanhua', 2, 'supporting'),
    ('qz-food-and-living-culture', 'qz_coast_bridges', 3, 'supporting'),
    ('qz-craft-extension-day', 'qz_anxi_tieguanyin', 1, 'core'),
    ('qz-craft-extension-day', 'qz_dehua_blanc_de_chine', 2, 'core'),
    ('qz-craft-extension-day', 'qz_yongchun_incense', 3, 'optional')
) as c(module_slug, card_id, sort_order, role)
  on c.module_slug = m.slug
on conflict (itinerary_module_id, knowledge_card_id) do nothing;
