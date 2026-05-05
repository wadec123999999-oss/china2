create table if not exists public.destination_sell_point_cards (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  sort_order integer not null default 0,
  title text not null,
  body text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  unique (destination_slug, sort_order)
);

create table if not exists public.destination_route_seeds (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  sort_order integer not null default 0,
  title text not null,
  duration text not null,
  body text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  unique (destination_slug, sort_order)
);

create table if not exists public.destination_faqs (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  sort_order integer not null default 0,
  question text not null,
  answer text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  unique (destination_slug, sort_order)
);

drop trigger if exists set_destination_sell_point_cards_updated_at on public.destination_sell_point_cards;
create trigger set_destination_sell_point_cards_updated_at
before update on public.destination_sell_point_cards
for each row execute function public.set_updated_at();

drop trigger if exists set_destination_route_seeds_updated_at on public.destination_route_seeds;
create trigger set_destination_route_seeds_updated_at
before update on public.destination_route_seeds
for each row execute function public.set_updated_at();

drop trigger if exists set_destination_faqs_updated_at on public.destination_faqs;
create trigger set_destination_faqs_updated_at
before update on public.destination_faqs
for each row execute function public.set_updated_at();

insert into public.destination_sell_point_cards (destination_slug, sort_order, title, body)
values
  ('beijing', 1, 'Imperial order and the Central Axis', 'Use palace space, gates, altars, and axial planning to explain how power was staged, not just where emperors lived.'),
  ('beijing', 2, 'Hutongs and courtyard life', 'Slow walks, local markets, and courtyard conversations make the capital feel lived-in rather than only monumental.'),
  ('beijing', 3, 'A strong first-China orientation', 'Beijing works well as the first city for travelers who need historical grammar before moving into craft, tea, or regional culture.'),
  ('chengdu', 1, 'Sichuan food as culture', 'Hotpot, snacks, market flavor, peppercorn aroma, and local dining habits turn meals into the main cultural route.'),
  ('chengdu', 2, 'Pandas as emotional gateway', 'Pandas create immediate desire, especially for families and first-time visitors, then the trip can deepen into local life.'),
  ('chengdu', 3, 'Tea-house pace', 'Parks, tea houses, mahjong, and long afternoons make Chengdu feel approachable, social, and human.'),
  ('chongqing', 1, 'Cyberpunk-feeling 8D geography', 'Layered roads, monorails, cliffside buildings, river crossings, and sudden elevation changes create the city''s strongest visual identity.'),
  ('chongqing', 2, 'Night city and river drama', 'Neon, humidity, bridges, ferries, and high viewpoints make Chongqing especially strong for evening routes and photography.'),
  ('chongqing', 3, 'Hotpot and mountain-city appetite', 'Food is not decoration here. Heat, noise, late meals, and communal dining match the city''s physical intensity.'),
  ('quanzhou', 1, 'Maritime Silk Road and UNESCO heritage', 'Quanzhou explains China as a global port civilization, not an isolated inland empire.'),
  ('quanzhou', 2, 'Plural religions and coexistence', 'Mosques, temples, shrines, churches, and trade memory give the city unusual interpretive depth for foreign visitors.'),
  ('quanzhou', 3, 'Hokkien diaspora and living food culture', 'For Southeast Asian travelers especially, Quanzhou can feel like an origin story for family memory, language, worship, and flavor.'),
  ('jingdezhen', 1, 'World porcelain capital', 'The city''s global significance is easy to explain: porcelain from here shaped taste, trade, collecting, and design across continents.'),
  ('jingdezhen', 2, 'Living studios and kilns', 'The best route should include makers, workshops, firing culture, and contemporary craft, not only museums.'),
  ('jingdezhen', 3, 'High-value craft experience', 'Jingdezhen is ideal for travelers who want to learn by seeing hands, tools, material choices, and process.'),
  ('jingmai_mountain', 1, 'Ancient tea forest landscape', 'Tea is not just a drink here. It is a landscape, livelihood, ritual, ecology, and way to read time.'),
  ('jingmai_mountain', 2, 'Slow mountain travel', 'The appeal is pace reduction: mist, mornings, tea, walking, village stays, and distance from mass tourism.'),
  ('jingmai_mountain', 3, 'A strong premium retreat angle', 'Jingmai fits travelers seeking silence, beauty, wellness-adjacent culture, and reflective travel without making it generic wellness tourism.'),
  ('wudang_mountain', 1, 'Taoist sacred mountain', 'Temples, palaces, paths, and mountain orientation create a strong philosophical landscape, not just a scenic one.'),
  ('wudang_mountain', 2, 'Taiji and internal practice', 'Short, well-contextualized practice sessions can make the destination memorable without pretending to be a training camp.'),
  ('wudang_mountain', 3, 'Architecture and atmosphere', 'Wudang''s appeal is strongest in early light, temple routes, clouds, silence, and the feeling of movement through a sacred mountain system.')
on conflict (destination_slug, sort_order) do update set
  title = excluded.title,
  body = excluded.body,
  updated_at = timezone('utc', now());

insert into public.destination_route_seeds (destination_slug, sort_order, title, duration, body)
values
  ('beijing', 1, 'Capital Order', '3 days', 'Central Axis, Forbidden City context, altar culture, hutong walks, and one carefully paced Great Wall day.'),
  ('beijing', 2, 'Courtyard Beijing', '4 days', 'Hutongs, courtyard meals, local markets, temple routes, and slower neighborhood interpretation.'),
  ('beijing', 3, 'Beijing as Prologue', '2-3 days', 'Use Beijing to establish China''s historical frame before continuing to Jingdezhen, Quanzhou, Wudang, or Chengdu.'),
  ('chengdu', 1, 'Food and Panda First', '3 days', 'Panda base early morning, neighborhood snacks, hotpot, tea house, and a market-led flavor walk.'),
  ('chengdu', 2, 'Slow Chengdu', '4 days', 'Parks, teahouses, old streets, Sichuan opera, food neighborhoods, and one gentle countryside or craft extension.'),
  ('chengdu', 3, 'Chengdu and Chongqing Contrast', '5-6 days', 'Pair Chengdu''s softness and food culture with Chongqing''s 8D visual intensity and river-city drama.'),
  ('chongqing', 1, '8D City Immersion', '2-3 days', 'Layered transit, old stairs, river crossings, high viewpoints, neon night walks, and one proper hotpot evening.'),
  ('chongqing', 2, 'Cyberpunk Chongqing', '3 days', 'Focus on visual rhythm: monorail moments, bridges, elevated streets, fog, nightscape, and dense local neighborhoods.'),
  ('chongqing', 3, 'Sichuan Basin Pairing', '5-6 days', 'Contrast Chengdu''s ease and pandas with Chongqing''s vertical drama, hotpot, and urban intensity.'),
  ('quanzhou', 1, 'Maritime World City', '3 days', 'Old port memory, UNESCO components, religious sites, street food, and a slow old-city route.'),
  ('quanzhou', 2, 'Hokkien Roots', '4 days', 'Ancestral halls, temple culture, food memory, diaspora interpretation, and optional clan or village extensions.'),
  ('quanzhou', 3, 'Craft and Ritual Quanzhou', '5 days', 'Zanhua, Nanyin, incense, tea, ceramics, local markets, and religious landscapes shaped into an immersive route.'),
  ('jingdezhen', 1, 'Porcelain Deep Dive', '3 days', 'Historic kilns, museum context, studio visits, market texture, and one hands-on making or glazing session.'),
  ('jingdezhen', 2, 'Designer Jingdezhen', '4 days', 'Contemporary studios, independent makers, material research, old kiln districts, and curated collecting guidance.'),
  ('jingdezhen', 3, 'Porcelain and Capital Contrast', '6-7 days', 'Pair Beijing''s imperial order with Jingdezhen''s material culture to show power, taste, trade, and craft.'),
  ('jingmai_mountain', 1, 'Tea Forest Stay', '3 days', 'Village base, tea forest walks, tea tasting, mountain mornings, and conversations around ecology and craft.'),
  ('jingmai_mountain', 2, 'Slow Yunnan Tea Route', '5 days', 'Jingmai with nearby tea landscapes, village rhythm, light hiking, and careful lodge pacing.'),
  ('jingmai_mountain', 3, 'Tea and Craft China', '7 days', 'Pair Jingmai''s tea ecology with Jingdezhen''s porcelain process for a material culture route.'),
  ('wudang_mountain', 1, 'Taoist Mountain Primer', '2-3 days', 'Temple sequence, mountain routes, Taoist interpretation, early morning light, and a short Taiji introduction.'),
  ('wudang_mountain', 2, 'Practice and Stillness', '4 days', 'Slow temple walking, private contextual practice, philosophy-led interpretation, and unhurried mountain time.'),
  ('wudang_mountain', 3, 'Wudang and Beijing', '6-7 days', 'Contrast Beijing''s state ritual and axial order with Wudang''s mountain spirituality and internal cultivation.')
on conflict (destination_slug, sort_order) do update set
  title = excluded.title,
  duration = excluded.duration,
  body = excluded.body,
  updated_at = timezone('utc', now());

insert into public.destination_faqs (destination_slug, sort_order, question, answer)
values
  ('beijing', 1, 'Why should a culture-focused traveler start in Beijing?', 'It gives the clearest opening frame for Chinese history, space, hierarchy, ritual, and urban continuity.'),
  ('beijing', 2, 'How do we avoid making Beijing feel generic?', 'Reduce checklist pressure and build the route around contrasts: axis and alley, palace and courtyard, ceremony and daily life.'),
  ('chengdu', 1, 'Is Chengdu only about pandas?', 'No. Pandas are the strongest hook, but the memorable trip comes from food, tea houses, parks, and local social rhythm.'),
  ('chengdu', 2, 'Who is Chengdu best for?', 'Travelers who want culture through appetite, comfort, and daily life rather than only monuments.'),
  ('chongqing', 1, 'Why is Chongqing called an 8D city?', 'Because roads, rails, buildings, riverbanks, and walkways stack across multiple levels, making navigation feel vertical and cinematic.'),
  ('chongqing', 2, 'Is Chongqing suitable for luxury cultural travel?', 'Yes, if the route is curated around atmosphere, viewpoints, local food, and urban interpretation rather than generic viral stops.'),
  ('quanzhou', 1, 'Which foreign markets are most naturally attracted to Quanzhou?', 'Philippines, Malaysia, Singapore, Indonesia, and Thailand are especially strong because of Hokkien, diaspora, food, and temple connections.'),
  ('quanzhou', 2, 'What makes Quanzhou different from Xiamen?', 'Xiamen is easier and more polished; Quanzhou is deeper for maritime heritage, religious plurality, old streets, and living traditions.'),
  ('jingdezhen', 1, 'Why would a foreign traveler go to Jingdezhen?', 'Because it turns Chinese culture into something physical and understandable through clay, firing, craft, and global porcelain history.'),
  ('jingdezhen', 2, 'Is Jingdezhen only for collectors?', 'No. It is also strong for designers, families, students, artists, and travelers who want hands-on cultural experience.'),
  ('jingmai_mountain', 1, 'Why is Jingmai worth including?', 'It adds quiet, ecology, tea culture, and emotional contrast to an itinerary that might otherwise be too city-heavy.'),
  ('jingmai_mountain', 2, 'Who should not choose Jingmai?', 'Travelers who want fast logistics, dense nightlife, or a simple checklist route may find it too slow.'),
  ('wudang_mountain', 1, 'Is Wudang mainly for martial arts fans?', 'No. Martial culture matters, but the deeper appeal is Taoist mountain culture, architecture, philosophy, and embodied practice.'),
  ('wudang_mountain', 2, 'How should Wudang be paced?', 'Slowly. The route should leave space for light, weather, walking, breathing, and interpretation rather than packing too many stops.')
on conflict (destination_slug, sort_order) do update set
  question = excluded.question,
  answer = excluded.answer,
  updated_at = timezone('utc', now());
