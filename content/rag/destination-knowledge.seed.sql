insert into public.rag_documents (
  id,
  destination_slug,
  destination_name,
  language,
  content_type,
  title,
  body,
  tags,
  metadata,
  source,
  source_url,
  source_confidence,
  content_version
)
values
(
  'beijing:positioning_overview:beijing-positioning-overview',
  'beijing',
  'Beijing',
  'en',
  'positioning_overview',
  'Beijing positioning overview',
  'China''s capital is strongest when it is read as a city of order, ritual, power, and ordinary courtyard life.

Why visit: Beijing gives foreign travelers a clear way to understand how imperial authority, ceremonial space, socialist memory, and neighborhood texture coexist. The value is not only the Forbidden City or the Great Wall. It is the contrast between monumental axes and human-scale hutongs, between state ritual and small daily habits.

Avoid framing: Do not frame Beijing as a checklist of famous sights. The premium version is about reading power, space, ritual, and neighborhood life with context.',
  array['why_visit', 'positioning', 'avoid_generic']::text[],
  '{"best_for":["First-time visitors who want historical context","Architecture and urban planning travelers","Culture-led families or private small groups","Museum, history, and diplomacy-minded guests"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:sell_point:imperial-order-and-the-central-axis',
  'beijing',
  'Beijing',
  'en',
  'sell_point',
  'Imperial order and the Central Axis',
  'Beijing selling point: Imperial order and the Central Axis. Use palace space, gates, altars, and axial planning to explain how power was staged, not just where emperors lived.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:sell_point:hutongs-and-courtyard-life',
  'beijing',
  'Beijing',
  'en',
  'sell_point',
  'Hutongs and courtyard life',
  'Beijing selling point: Hutongs and courtyard life. Slow walks, local markets, and courtyard conversations make the capital feel lived-in rather than only monumental.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:sell_point:a-strong-first-china-orientation',
  'beijing',
  'Beijing',
  'en',
  'sell_point',
  'A strong first-China orientation',
  'Beijing selling point: A strong first-China orientation. Beijing works well as the first city for travelers who need historical grammar before moving into craft, tea, or regional culture.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:audience_fit:beijing-best-fit-travelers',
  'beijing',
  'Beijing',
  'en',
  'audience_fit',
  'Beijing best-fit travelers',
  'Beijing is best for: First-time visitors who want historical context; Architecture and urban planning travelers; Culture-led families or private small groups; Museum, history, and diplomacy-minded guests.',
  array['audience', 'conversion']::text[],
  '{"best_for":["First-time visitors who want historical context","Architecture and urban planning travelers","Culture-led families or private small groups","Museum, history, and diplomacy-minded guests"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:route_seed:capital-order',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Capital Order',
  'Capital Order (3 days): Central Axis, Forbidden City context, altar culture, hutong walks, and one carefully paced Great Wall day.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":1,"duration":"3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:route_seed:courtyard-beijing',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Courtyard Beijing',
  'Courtyard Beijing (4 days): Hutongs, courtyard meals, local markets, temple routes, and slower neighborhood interpretation.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":2,"duration":"4 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:route_seed:beijing-as-prologue',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing as Prologue',
  'Beijing as Prologue (2-3 days): Use Beijing to establish China''s historical frame before continuing to Jingdezhen, Quanzhou, Wudang, or Chengdu.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":3,"duration":"2-3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:traveler_faq:why-should-a-culture-focused-traveler-start-in-beijing',
  'beijing',
  'Beijing',
  'en',
  'traveler_faq',
  'Why should a culture-focused traveler start in Beijing?',
  'Question: Why should a culture-focused traveler start in Beijing?
Answer direction: It gives the clearest opening frame for Chinese history, space, hierarchy, ritual, and urban continuity.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:traveler_faq:how-do-we-avoid-making-beijing-feel-generic',
  'beijing',
  'Beijing',
  'en',
  'traveler_faq',
  'How do we avoid making Beijing feel generic?',
  'Question: How do we avoid making Beijing feel generic?
Answer direction: Reduce checklist pressure and build the route around contrasts: axis and alley, palace and courtyard, ceremony and daily life.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:positioning_overview:chengdu-positioning-overview',
  'chengdu',
  'Chengdu',
  'en',
  'positioning_overview',
  'Chengdu positioning overview',
  'Chengdu is the easiest major Chinese city for foreigners to love through food, pandas, tea houses, and an unhurried social rhythm.

Why visit: Chengdu should lead with Sichuan food and pandas because those are the strongest emotional entry points for most foreign visitors. The deeper sell is that food, tea, parks, conversation, and neighborhood ease reveal a relaxed but culturally dense version of urban China.

Avoid framing: Do not reduce Chengdu to spicy food alone. Food and pandas should open the door, but the premium story is local ease, tea-house rhythm, and Sichuan social life.',
  array['why_visit', 'positioning', 'avoid_generic']::text[],
  '{"best_for":["Food-first travelers","Families and couples","Travelers who want China to feel relaxed, not overwhelming","Guests pairing pandas with Sichuan culture"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:sell_point:sichuan-food-as-culture',
  'chengdu',
  'Chengdu',
  'en',
  'sell_point',
  'Sichuan food as culture',
  'Chengdu selling point: Sichuan food as culture. Hotpot, snacks, market flavor, peppercorn aroma, and local dining habits turn meals into the main cultural route.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:sell_point:pandas-as-emotional-gateway',
  'chengdu',
  'Chengdu',
  'en',
  'sell_point',
  'Pandas as emotional gateway',
  'Chengdu selling point: Pandas as emotional gateway. Pandas create immediate desire, especially for families and first-time visitors, then the trip can deepen into local life.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:sell_point:tea-house-pace',
  'chengdu',
  'Chengdu',
  'en',
  'sell_point',
  'Tea-house pace',
  'Chengdu selling point: Tea-house pace. Parks, tea houses, mahjong, and long afternoons make Chengdu feel approachable, social, and human.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:audience_fit:chengdu-best-fit-travelers',
  'chengdu',
  'Chengdu',
  'en',
  'audience_fit',
  'Chengdu best-fit travelers',
  'Chengdu is best for: Food-first travelers; Families and couples; Travelers who want China to feel relaxed, not overwhelming; Guests pairing pandas with Sichuan culture.',
  array['audience', 'conversion']::text[],
  '{"best_for":["Food-first travelers","Families and couples","Travelers who want China to feel relaxed, not overwhelming","Guests pairing pandas with Sichuan culture"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:route_seed:food-and-panda-first',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Food and Panda First',
  'Food and Panda First (3 days): Panda base early morning, neighborhood snacks, hotpot, tea house, and a market-led flavor walk.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":1,"duration":"3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:route_seed:slow-chengdu',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Slow Chengdu',
  'Slow Chengdu (4 days): Parks, teahouses, old streets, Sichuan opera, food neighborhoods, and one gentle countryside or craft extension.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":2,"duration":"4 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:route_seed:chengdu-and-chongqing-contrast',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu and Chongqing Contrast',
  'Chengdu and Chongqing Contrast (5-6 days): Pair Chengdu''s softness and food culture with Chongqing''s 8D visual intensity and river-city drama.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":3,"duration":"5-6 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:traveler_faq:is-chengdu-only-about-pandas',
  'chengdu',
  'Chengdu',
  'en',
  'traveler_faq',
  'Is Chengdu only about pandas?',
  'Question: Is Chengdu only about pandas?
Answer direction: No. Pandas are the strongest hook, but the memorable trip comes from food, tea houses, parks, and local social rhythm.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chengdu:traveler_faq:who-is-chengdu-best-for',
  'chengdu',
  'Chengdu',
  'en',
  'traveler_faq',
  'Who is Chengdu best for?',
  'Question: Who is Chengdu best for?
Answer direction: Travelers who want culture through appetite, comfort, and daily life rather than only monuments.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:positioning_overview:chongqing-positioning-overview',
  'chongqing',
  'Chongqing',
  'en',
  'positioning_overview',
  'Chongqing positioning overview',
  'Chongqing is China''s most cinematic 8D mountain city: cyberpunk-feeling nights, impossible levels, hotpot heat, rivers, bridges, and vertical daily life.

Why visit: Chongqing should be sold as a sensory urban experience that feels unlike flat-grid cities. Foreign travelers remember the way trains, bridges, stairs, riverbanks, cliffside buildings, neon, fog, and hotpot combine into a city that feels almost fictional but is fully lived-in.

Avoid framing: Do not present Chongqing as just another food city or a list of viral photo spots. The sell is the lived 8D geography plus night movement, appetite, and river-city scale.',
  array['why_visit', 'positioning', 'avoid_generic']::text[],
  '{"best_for":["Visual travelers and photographers","Young premium travelers who want atmosphere","Food and nightlife-led guests","Visitors who want a city that feels different from Beijing or Shanghai"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:sell_point:cyberpunk-feeling-8d-geography',
  'chongqing',
  'Chongqing',
  'en',
  'sell_point',
  'Cyberpunk-feeling 8D geography',
  'Chongqing selling point: Cyberpunk-feeling 8D geography. Layered roads, monorails, cliffside buildings, river crossings, and sudden elevation changes create the city''s strongest visual identity.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:sell_point:night-city-and-river-drama',
  'chongqing',
  'Chongqing',
  'en',
  'sell_point',
  'Night city and river drama',
  'Chongqing selling point: Night city and river drama. Neon, humidity, bridges, ferries, and high viewpoints make Chongqing especially strong for evening routes and photography.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:sell_point:hotpot-and-mountain-city-appetite',
  'chongqing',
  'Chongqing',
  'en',
  'sell_point',
  'Hotpot and mountain-city appetite',
  'Chongqing selling point: Hotpot and mountain-city appetite. Food is not decoration here. Heat, noise, late meals, and communal dining match the city''s physical intensity.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:audience_fit:chongqing-best-fit-travelers',
  'chongqing',
  'Chongqing',
  'en',
  'audience_fit',
  'Chongqing best-fit travelers',
  'Chongqing is best for: Visual travelers and photographers; Young premium travelers who want atmosphere; Food and nightlife-led guests; Visitors who want a city that feels different from Beijing or Shanghai.',
  array['audience', 'conversion']::text[],
  '{"best_for":["Visual travelers and photographers","Young premium travelers who want atmosphere","Food and nightlife-led guests","Visitors who want a city that feels different from Beijing or Shanghai"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:route_seed:8d-city-immersion',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  '8D City Immersion',
  '8D City Immersion (2-3 days): Layered transit, old stairs, river crossings, high viewpoints, neon night walks, and one proper hotpot evening.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":1,"duration":"2-3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:route_seed:cyberpunk-chongqing',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Cyberpunk Chongqing',
  'Cyberpunk Chongqing (3 days): Focus on visual rhythm: monorail moments, bridges, elevated streets, fog, nightscape, and dense local neighborhoods.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":2,"duration":"3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:route_seed:sichuan-basin-pairing',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Sichuan Basin Pairing',
  'Sichuan Basin Pairing (5-6 days): Contrast Chengdu''s ease and pandas with Chongqing''s vertical drama, hotpot, and urban intensity.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":3,"duration":"5-6 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:traveler_faq:why-is-chongqing-called-an-8d-city',
  'chongqing',
  'Chongqing',
  'en',
  'traveler_faq',
  'Why is Chongqing called an 8D city?',
  'Question: Why is Chongqing called an 8D city?
Answer direction: Because roads, rails, buildings, riverbanks, and walkways stack across multiple levels, making navigation feel vertical and cinematic.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'chongqing:traveler_faq:is-chongqing-suitable-for-luxury-cultural-travel',
  'chongqing',
  'Chongqing',
  'en',
  'traveler_faq',
  'Is Chongqing suitable for luxury cultural travel?',
  'Question: Is Chongqing suitable for luxury cultural travel?
Answer direction: Yes, if the route is curated around atmosphere, viewpoints, local food, and urban interpretation rather than generic viral stops.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:positioning_overview:quanzhou-positioning-overview',
  'quanzhou',
  'Quanzhou',
  'en',
  'positioning_overview',
  'Quanzhou positioning overview',
  'Quanzhou is a world-class Maritime Silk Road port where UNESCO heritage, plural religions, Hokkien memory, food, and craft still overlap in the streets.

Why visit: Quanzhou is strongest for travelers who want China connected to the wider world. Its value is not beach tourism. It is the rare combination of Song-Yuan maritime trade, temples, mosques, ancestral memory, overseas Chinese ties, foodways, and living craft traditions.

Avoid framing: Do not sell Quanzhou as a generic coastal city. The premium story is port memory, religious plurality, Hokkien identity, food, and hand-made heritage.',
  array['why_visit', 'positioning', 'avoid_generic']::text[],
  '{"best_for":["Southeast Asian Hokkien and diaspora travelers","UNESCO and maritime history travelers","Religion, food, and old-city walkers","Travelers seeking depth beyond famous first-tier cities"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:sell_point:maritime-silk-road-and-unesco-heritage',
  'quanzhou',
  'Quanzhou',
  'en',
  'sell_point',
  'Maritime Silk Road and UNESCO heritage',
  'Quanzhou selling point: Maritime Silk Road and UNESCO heritage. Quanzhou explains China as a global port civilization, not an isolated inland empire.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:sell_point:plural-religions-and-coexistence',
  'quanzhou',
  'Quanzhou',
  'en',
  'sell_point',
  'Plural religions and coexistence',
  'Quanzhou selling point: Plural religions and coexistence. Mosques, temples, shrines, churches, and trade memory give the city unusual interpretive depth for foreign visitors.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:sell_point:hokkien-diaspora-and-living-food-culture',
  'quanzhou',
  'Quanzhou',
  'en',
  'sell_point',
  'Hokkien diaspora and living food culture',
  'Quanzhou selling point: Hokkien diaspora and living food culture. For Southeast Asian travelers especially, Quanzhou can feel like an origin story for family memory, language, worship, and flavor.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:audience_fit:quanzhou-best-fit-travelers',
  'quanzhou',
  'Quanzhou',
  'en',
  'audience_fit',
  'Quanzhou best-fit travelers',
  'Quanzhou is best for: Southeast Asian Hokkien and diaspora travelers; UNESCO and maritime history travelers; Religion, food, and old-city walkers; Travelers seeking depth beyond famous first-tier cities.',
  array['audience', 'conversion']::text[],
  '{"best_for":["Southeast Asian Hokkien and diaspora travelers","UNESCO and maritime history travelers","Religion, food, and old-city walkers","Travelers seeking depth beyond famous first-tier cities"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:route_seed:maritime-world-city',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Maritime World City',
  'Maritime World City (3 days): Old port memory, UNESCO components, religious sites, street food, and a slow old-city route.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":1,"duration":"3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:route_seed:hokkien-roots',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Hokkien Roots',
  'Hokkien Roots (4 days): Ancestral halls, temple culture, food memory, diaspora interpretation, and optional clan or village extensions.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":2,"duration":"4 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:route_seed:craft-and-ritual-quanzhou',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Craft and Ritual Quanzhou',
  'Craft and Ritual Quanzhou (5 days): Zanhua, Nanyin, incense, tea, ceramics, local markets, and religious landscapes shaped into an immersive route.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":3,"duration":"5 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:traveler_faq:which-foreign-markets-are-most-naturally-attracted-to-quanzhou',
  'quanzhou',
  'Quanzhou',
  'en',
  'traveler_faq',
  'Which foreign markets are most naturally attracted to Quanzhou?',
  'Question: Which foreign markets are most naturally attracted to Quanzhou?
Answer direction: Philippines, Malaysia, Singapore, Indonesia, and Thailand are especially strong because of Hokkien, diaspora, food, and temple connections.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'quanzhou:traveler_faq:what-makes-quanzhou-different-from-xiamen',
  'quanzhou',
  'Quanzhou',
  'en',
  'traveler_faq',
  'What makes Quanzhou different from Xiamen?',
  'Question: What makes Quanzhou different from Xiamen?
Answer direction: Xiamen is easier and more polished; Quanzhou is deeper for maritime heritage, religious plurality, old streets, and living traditions.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:positioning_overview:jingdezhen-positioning-overview',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'positioning_overview',
  'Jingdezhen positioning overview',
  'Jingdezhen is not only a porcelain museum city; it is a living craft ecosystem where clay, kiln, glaze, studio, and global design still meet.

Why visit: Jingdezhen gives foreign travelers a tactile way into Chinese culture. Instead of only viewing heritage, they can understand material, process, labor, failure, beauty, and global trade through porcelain. It is especially strong for design-minded and craft-minded guests.

Avoid framing: Do not frame Jingdezhen as a shopping stop. The premium value is the craft ecosystem: kilns, studios, makers, materials, and global porcelain history.',
  array['why_visit', 'positioning', 'avoid_generic']::text[],
  '{"best_for":["Design, craft, and architecture travelers","Museum and collector audiences","Artists, students, and creative professionals","Travelers who prefer process over sightseeing"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:sell_point:world-porcelain-capital',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'sell_point',
  'World porcelain capital',
  'Jingdezhen selling point: World porcelain capital. The city''s global significance is easy to explain: porcelain from here shaped taste, trade, collecting, and design across continents.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:sell_point:living-studios-and-kilns',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'sell_point',
  'Living studios and kilns',
  'Jingdezhen selling point: Living studios and kilns. The best route should include makers, workshops, firing culture, and contemporary craft, not only museums.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:sell_point:high-value-craft-experience',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'sell_point',
  'High-value craft experience',
  'Jingdezhen selling point: High-value craft experience. Jingdezhen is ideal for travelers who want to learn by seeing hands, tools, material choices, and process.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:audience_fit:jingdezhen-best-fit-travelers',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'audience_fit',
  'Jingdezhen best-fit travelers',
  'Jingdezhen is best for: Design, craft, and architecture travelers; Museum and collector audiences; Artists, students, and creative professionals; Travelers who prefer process over sightseeing.',
  array['audience', 'conversion']::text[],
  '{"best_for":["Design, craft, and architecture travelers","Museum and collector audiences","Artists, students, and creative professionals","Travelers who prefer process over sightseeing"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:route_seed:porcelain-deep-dive',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Porcelain Deep Dive',
  'Porcelain Deep Dive (3 days): Historic kilns, museum context, studio visits, market texture, and one hands-on making or glazing session.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":1,"duration":"3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:route_seed:designer-jingdezhen',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Designer Jingdezhen',
  'Designer Jingdezhen (4 days): Contemporary studios, independent makers, material research, old kiln districts, and curated collecting guidance.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":2,"duration":"4 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:route_seed:porcelain-and-capital-contrast',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Porcelain and Capital Contrast',
  'Porcelain and Capital Contrast (6-7 days): Pair Beijing''s imperial order with Jingdezhen''s material culture to show power, taste, trade, and craft.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":3,"duration":"6-7 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:traveler_faq:why-would-a-foreign-traveler-go-to-jingdezhen',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'traveler_faq',
  'Why would a foreign traveler go to Jingdezhen?',
  'Question: Why would a foreign traveler go to Jingdezhen?
Answer direction: Because it turns Chinese culture into something physical and understandable through clay, firing, craft, and global porcelain history.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingdezhen:traveler_faq:is-jingdezhen-only-for-collectors',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'traveler_faq',
  'Is Jingdezhen only for collectors?',
  'Question: Is Jingdezhen only for collectors?
Answer direction: No. It is also strong for designers, families, students, artists, and travelers who want hands-on cultural experience.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:positioning_overview:jingmai-mountain-positioning-overview',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'positioning_overview',
  'Jingmai Mountain positioning overview',
  'Jingmai is a slow tea mountain world where ancient tea forests, villages, ecology, and ritual create a quieter, more contemplative China route.

Why visit: Jingmai should be developed as a high-aesthetic slow travel destination, not a conventional attraction cluster. Its power comes from tea landscapes, mountain air, village continuity, ethnic culture, ecology, and the emotional shift that happens when the trip slows down.

Avoid framing: Do not sell Jingmai as a fast sightseeing stop. The value depends on slowness, weather, tea ritual, mountain texture, and local interpretation.',
  array['why_visit', 'positioning', 'avoid_generic']::text[],
  '{"best_for":["Tea travelers and nature-focused guests","Slow travel and retreat-style visitors","Photographers and high-aesthetic travelers","Repeat China visitors seeking less obvious routes"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:sell_point:ancient-tea-forest-landscape',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'sell_point',
  'Ancient tea forest landscape',
  'Jingmai Mountain selling point: Ancient tea forest landscape. Tea is not just a drink here. It is a landscape, livelihood, ritual, ecology, and way to read time.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:sell_point:slow-mountain-travel',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'sell_point',
  'Slow mountain travel',
  'Jingmai Mountain selling point: Slow mountain travel. The appeal is pace reduction: mist, mornings, tea, walking, village stays, and distance from mass tourism.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:sell_point:a-strong-premium-retreat-angle',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'sell_point',
  'A strong premium retreat angle',
  'Jingmai Mountain selling point: A strong premium retreat angle. Jingmai fits travelers seeking silence, beauty, wellness-adjacent culture, and reflective travel without making it generic wellness tourism.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:audience_fit:jingmai-mountain-best-fit-travelers',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'audience_fit',
  'Jingmai Mountain best-fit travelers',
  'Jingmai Mountain is best for: Tea travelers and nature-focused guests; Slow travel and retreat-style visitors; Photographers and high-aesthetic travelers; Repeat China visitors seeking less obvious routes.',
  array['audience', 'conversion']::text[],
  '{"best_for":["Tea travelers and nature-focused guests","Slow travel and retreat-style visitors","Photographers and high-aesthetic travelers","Repeat China visitors seeking less obvious routes"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:route_seed:tea-forest-stay',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Tea Forest Stay',
  'Tea Forest Stay (3 days): Village base, tea forest walks, tea tasting, mountain mornings, and conversations around ecology and craft.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":1,"duration":"3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:route_seed:slow-yunnan-tea-route',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Slow Yunnan Tea Route',
  'Slow Yunnan Tea Route (5 days): Jingmai with nearby tea landscapes, village rhythm, light hiking, and careful lodge pacing.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":2,"duration":"5 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:route_seed:tea-and-craft-china',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Tea and Craft China',
  'Tea and Craft China (7 days): Pair Jingmai''s tea ecology with Jingdezhen''s porcelain process for a material culture route.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":3,"duration":"7 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:traveler_faq:why-is-jingmai-worth-including',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'traveler_faq',
  'Why is Jingmai worth including?',
  'Question: Why is Jingmai worth including?
Answer direction: It adds quiet, ecology, tea culture, and emotional contrast to an itinerary that might otherwise be too city-heavy.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'jingmai-mountain:traveler_faq:who-should-not-choose-jingmai',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'traveler_faq',
  'Who should not choose Jingmai?',
  'Question: Who should not choose Jingmai?
Answer direction: Travelers who want fast logistics, dense nightlife, or a simple checklist route may find it too slow.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:positioning_overview:wudang-mountain-positioning-overview',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'positioning_overview',
  'Wudang Mountain positioning overview',
  'Wudang Mountain is a Taoist sacred landscape where architecture, mountain paths, Taiji, breath, and internal practice give the trip spiritual weight.

Why visit: Wudang should be positioned around Taoist culture and Taiji, not just mountain scenery. For foreign travelers, it offers an unusually coherent combination of sacred architecture, philosophy, martial tradition, body practice, early light, and reflective travel.

Avoid framing: Do not sell Wudang as generic scenery or kung fu performance. The premium route needs Taoist context, Taiji literacy, mountain pacing, and quiet.',
  array['why_visit', 'positioning', 'avoid_generic']::text[],
  '{"best_for":["Taoism, philosophy, and martial culture travelers","Guests seeking reflective mountain travel","Wellness-adjacent travelers who want real culture","Repeat China visitors looking beyond standard routes"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:sell_point:taoist-sacred-mountain',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'sell_point',
  'Taoist sacred mountain',
  'Wudang Mountain selling point: Taoist sacred mountain. Temples, palaces, paths, and mountain orientation create a strong philosophical landscape, not just a scenic one.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:sell_point:taiji-and-internal-practice',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'sell_point',
  'Taiji and internal practice',
  'Wudang Mountain selling point: Taiji and internal practice. Short, well-contextualized practice sessions can make the destination memorable without pretending to be a training camp.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:sell_point:architecture-and-atmosphere',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'sell_point',
  'Architecture and atmosphere',
  'Wudang Mountain selling point: Architecture and atmosphere. Wudang''s appeal is strongest in early light, temple routes, clouds, silence, and the feeling of movement through a sacred mountain system.',
  array['sell_point', 'city_identity']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:audience_fit:wudang-mountain-best-fit-travelers',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'audience_fit',
  'Wudang Mountain best-fit travelers',
  'Wudang Mountain is best for: Taoism, philosophy, and martial culture travelers; Guests seeking reflective mountain travel; Wellness-adjacent travelers who want real culture; Repeat China visitors looking beyond standard routes.',
  array['audience', 'conversion']::text[],
  '{"best_for":["Taoism, philosophy, and martial culture travelers","Guests seeking reflective mountain travel","Wellness-adjacent travelers who want real culture","Repeat China visitors looking beyond standard routes"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:route_seed:taoist-mountain-primer',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Taoist Mountain Primer',
  'Taoist Mountain Primer (2-3 days): Temple sequence, mountain routes, Taoist interpretation, early morning light, and a short Taiji introduction.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":1,"duration":"2-3 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:route_seed:practice-and-stillness',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Practice and Stillness',
  'Practice and Stillness (4 days): Slow temple walking, private contextual practice, philosophy-led interpretation, and unhurried mountain time.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":2,"duration":"4 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:route_seed:wudang-and-beijing',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang and Beijing',
  'Wudang and Beijing (6-7 days): Contrast Beijing''s state ritual and axial order with Wudang''s mountain spirituality and internal cultivation.',
  array['route_seed', 'itinerary']::text[],
  '{"sort_order":3,"duration":"6-7 days"}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:traveler_faq:is-wudang-mainly-for-martial-arts-fans',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'traveler_faq',
  'Is Wudang mainly for martial arts fans?',
  'Question: Is Wudang mainly for martial arts fans?
Answer direction: No. Martial culture matters, but the deeper appeal is Taoist mountain culture, architecture, philosophy, and embodied practice.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'wudang-mountain:traveler_faq:how-should-wudang-be-paced',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'traveler_faq',
  'How should Wudang be paced?',
  'Question: How should Wudang be paced?
Answer direction: Slowly. The route should leave space for light, weather, walking, breathing, and interpretation rather than packing too many stops.',
  array['faq', 'traveler_question']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-positioning.ts',
  null,
  'curated',
  'v1-static-positioning'
),
(
  'beijing:source_note:beijing-editorial-guide-frame',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing editorial guide frame',
  'Beijing should be read as a grammar of power. The city is strongest when the route explains how gates, walls, axes, altars, hutongs, meals, and neighborhood habits still give form to Chinese history.

Not generic: Beyond the palace checklist. A normal Beijing guide starts with the Forbidden City and the Great Wall. A better route asks what those places teach: how authority was staged, why distance mattered, how ordinary courtyard life softened the capital, and why a first-time China trip needs a historical opening chapter.

Visual direction: Generated city image direction: gates, courtyard texture, a long ceremonial axis, and small human movement inside monumental scale.',
  array['editorial_guide', 'avoid_generic', 'visual_direction']::text[],
  '{}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:experience:beijing-city-reading-axis-and-approach',
  'beijing',
  'Beijing',
  'en',
  'experience',
  'Beijing city reading - Axis and approach',
  'Axis and approach: Use the Central Axis to explain sequence: gate, threshold, court, altar, view line, and controlled movement through space.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:experience:beijing-city-reading-hutongs-as-counterweight',
  'beijing',
  'Beijing',
  'en',
  'experience',
  'Beijing city reading - Hutongs as counterweight',
  'Hutongs as counterweight: Hutongs prevent Beijing from becoming only a city of state power. They show breakfast, doors, bicycles, courtyard memory, and the human scale behind the capital.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:experience:beijing-city-reading-ritual-not-only-sightseeing',
  'beijing',
  'Beijing',
  'en',
  'experience',
  'Beijing city reading - Ritual, not only sightseeing',
  'Ritual, not only sightseeing: Temples and altars help travelers understand seasonal order, cosmology, ceremony, and the symbolic logic behind imperial Beijing.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:route_seed:beijing-signature-day-day-1-courtyard-soft-landing',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing signature day - Day 1: Courtyard soft landing',
  'Day 1: Courtyard soft landing: A hutong walk, slow northern meal, and neighborhood orientation before the heavy monuments begin.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:route_seed:beijing-signature-day-day-2-central-axis-reading',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing signature day - Day 2: Central Axis reading',
  'Day 2: Central Axis reading: A structured palace and axis day focused on power, approach, gates, and ceremonial space.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:route_seed:beijing-signature-day-day-3-wall-altar-or-museum',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing signature day - Day 3: Wall, altar, or museum',
  'Day 3: Wall, altar, or museum: Choose one anchor according to the traveler: landscape defense, ritual order, or object-based history.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:market_profile:beijing-traveler-fit-best-first-china-city',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing traveler fit - Best first-China city',
  'Best first-China city: Strong for travelers who need a clear frame before moving into craft, food, tea, mountain, or port cultures.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:market_profile:beijing-traveler-fit-strong-for-architecture-travelers',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing traveler fit - Strong for architecture travelers',
  'Strong for architecture travelers: Good for people who care about axes, typologies, preservation, state planning, and how cities express hierarchy.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:market_profile:beijing-traveler-fit-not-for-fast-comfort-only',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing traveler fit - Not for fast comfort only',
  'Not for fast comfort only: Travelers who want soft leisure, resort time, or food-first travel may only need Beijing as a short prologue.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:source_note:beijing-planning-signal-do-not-overload-arrival-day',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing planning signal - Do not overload arrival day',
  'Do not overload arrival day: Jet-lagged travelers understand Beijing better with one neighborhood, one meal, and one clear orientation.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:source_note:beijing-planning-signal-cluster-the-city',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing planning signal - Cluster the city',
  'Cluster the city: Beijing is large. Cross-city zigzags weaken the day and drain energy needed for interpretation.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:source_note:beijing-planning-signal-ask-about-history-tolerance',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing planning signal - Ask about history tolerance',
  'Ask about history tolerance: Some travelers want deep context; others need lighter stories, food, and neighborhood texture.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:source_note:beijing-research-anchors',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing research anchors',
  'UNESCO: Beijing Central Axis: https://whc.unesco.org/en/list/1714/
Visit Beijing: Hutong culture: https://english.visitbeijing.com.cn/article/47OMs0rcAFo',
  array['source_anchor', 'research', 'evidence']::text[],
  '{"source_count":2,"urls":["https://whc.unesco.org/en/list/1714/","https://english.visitbeijing.com.cn/article/47OMs0rcAFo"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:source_note:chengdu-editorial-guide-frame',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu editorial guide frame',
  'Chengdu is the easiest city in this portfolio for many foreign travelers to feel. Pandas and food open the door, but the deeper city is about appetite, sitting, talking, tea, parks, and the confidence of daily life.

Not generic: Food and pandas are the hook, not the whole product. A generic guide lists panda bases, hotpot, and old streets. A stronger Chengdu route uses pandas as emotional entry, then lets food, tea houses, markets, and slow social rhythm explain why the city is loved.

Visual direction: Generated city image direction: tea-house tables, market flavor, soft park life, panda warmth, and Sichuan color without tourist cliche.',
  array['editorial_guide', 'avoid_generic', 'visual_direction']::text[],
  '{}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:experience:chengdu-city-reading-food-as-social-structure',
  'chengdu',
  'Chengdu',
  'en',
  'experience',
  'Chengdu city reading - Food as social structure',
  'Food as social structure: Spice, peppercorn, shared tables, late meals, snacks, and markets show how Chengdu organizes pleasure and conversation.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:experience:chengdu-city-reading-tea-house-time',
  'chengdu',
  'Chengdu',
  'en',
  'experience',
  'Chengdu city reading - Tea-house time',
  'Tea-house time: A tea house is not a break between attractions. It is where the city''s pace becomes visible.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:experience:chengdu-city-reading-soft-urban-china',
  'chengdu',
  'Chengdu',
  'en',
  'experience',
  'Chengdu city reading - Soft urban China',
  'Soft urban China: Chengdu helps nervous first-timers feel that Chinese cities can be relaxed, legible, and emotionally easy.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:route_seed:chengdu-signature-day-day-1-panda-and-flavor-entry',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu signature day - Day 1: Panda and flavor entry',
  'Day 1: Panda and flavor entry: Early panda visit, simple snack sequence, and one confident Sichuan dinner with heat level controlled.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:route_seed:chengdu-signature-day-day-2-market-park-tea',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu signature day - Day 2: Market, park, tea',
  'Day 2: Market, park, tea: Ingredients, neighborhood food, tea-house sitting, and local park life instead of a packed attraction list.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:route_seed:chengdu-signature-day-day-3-opera-or-countryside-extension',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu signature day - Day 3: Opera or countryside extension',
  'Day 3: Opera or countryside extension: Add performance, cooking, craft, or a softer countryside day depending on the traveler.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:market_profile:chengdu-traveler-fit-best-for-families',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu traveler fit - Best for families',
  'Best for families: Children have pandas; adults have food, tea, parks, and enough cultural depth to avoid a theme-park feeling.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:market_profile:chengdu-traveler-fit-best-for-food-first-guests',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu traveler fit - Best for food-first guests',
  'Best for food-first guests: Good for travelers who understand a destination through appetite, markets, and ordering well.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:market_profile:chengdu-traveler-fit-not-the-most-monumental-city',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu traveler fit - Not the most monumental city',
  'Not the most monumental city: Guests seeking imperial scale, UNESCO port memory, or extreme urban visuals should pair Chengdu with another city.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:source_note:chengdu-planning-signal-ask-spice-tolerance-early',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu planning signal - Ask spice tolerance early',
  'Ask spice tolerance early: The route changes if a traveler wants full mala intensity, moderate heat, or cautious ordering.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:source_note:chengdu-planning-signal-anchor-days-around-meals',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu planning signal - Anchor days around meals',
  'Anchor days around meals: Meals are route infrastructure in Chengdu, not optional stops after sightseeing.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:source_note:chengdu-planning-signal-pair-with-chongqing-carefully',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu planning signal - Pair with Chongqing carefully',
  'Pair with Chongqing carefully: Chengdu works well before Chongqing: softness first, intensity second.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chengdu:source_note:chengdu-research-anchors',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu research anchors',
  'UNESCO Creative Cities: Chengdu: https://www.unesco.org/en/creative-cities/chengdu
UNESCO: Chengdu City of Gastronomy: https://unesdoc.unesco.org/ark:/48223/pf0000192047',
  array['source_anchor', 'research', 'evidence']::text[],
  '{"source_count":2,"urls":["https://www.unesco.org/en/creative-cities/chengdu","https://unesdoc.unesco.org/ark:/48223/pf0000192047"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:source_note:chongqing-editorial-guide-frame',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing editorial guide frame',
  'Chongqing is a city you understand by moving through it. Its value is not a list of viral photo spots but the feeling of stacked geography, night movement, heat, river scale, and daily life adapted to slopes.

Not generic: The 8D city is not just a meme. A normal guide sends travelers to Liziba, Hongya Cave, and hotpot. A stronger route treats elevators, rails, bridges, stairs, ferries, and viewpoints as a continuous urban reading.

Visual direction: Generated city image direction: layered roads, river fog, lit bridges, monorail movement, hotpot steam, and night-time vertical density.',
  array['editorial_guide', 'avoid_generic', 'visual_direction']::text[],
  '{}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:experience:chongqing-city-reading-navigation-as-culture',
  'chongqing',
  'Chongqing',
  'en',
  'experience',
  'Chongqing city reading - Navigation as culture',
  'Navigation as culture: Streets emerge at roof level, rail lines cut through buildings, and bridges become daily habits. Movement is the attraction.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:experience:chongqing-city-reading-night-reveals-the-city',
  'chongqing',
  'Chongqing',
  'en',
  'experience',
  'Chongqing city reading - Night reveals the city',
  'Night reveals the city: Fog, neon, river reflections, cliffside buildings, and hotpot steam make Chongqing stronger after dark.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:experience:chongqing-city-reading-heat-matches-geography',
  'chongqing',
  'Chongqing',
  'en',
  'experience',
  'Chongqing city reading - Heat matches geography',
  'Heat matches geography: Hotpot belongs to the city physically: dense, communal, late, noisy, humid, and direct.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:route_seed:chongqing-signature-day-day-1-vertical-orientation',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing signature day - Day 1: Vertical orientation',
  'Day 1: Vertical orientation: Use rail, stairs, bridges, and overlooks to make the city physically legible.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:route_seed:chongqing-signature-day-day-2-night-and-hotpot',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing signature day - Day 2: Night and hotpot',
  'Day 2: Night and hotpot: Sequence river views, elevated movement, neighborhood walking, and a serious hotpot evening.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:route_seed:chongqing-signature-day-day-3-depth-or-contrast',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing signature day - Day 3: Depth or contrast',
  'Day 3: Depth or contrast: Choose Dazu, wartime memory, river culture, or a softer neighborhood day if the traveler wants more than spectacle.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:market_profile:chongqing-traveler-fit-best-for-visual-travelers',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing traveler fit - Best for visual travelers',
  'Best for visual travelers: Strong for photographers, creators, younger premium guests, and repeat China visitors who want atmosphere.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:market_profile:chongqing-traveler-fit-good-chengdu-contrast',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing traveler fit - Good Chengdu contrast',
  'Good Chengdu contrast: Works well after Chengdu because it changes the emotional register from ease to intensity.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:market_profile:chongqing-traveler-fit-filter-mobility',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing traveler fit - Filter mobility',
  'Filter mobility: Travelers who dislike stairs, humidity, crowds, or late nights need a softened route.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:source_note:chongqing-planning-signal-stay-overnight',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing planning signal - Stay overnight',
  'Stay overnight: A day trip misses the city''s core identity. Chongqing needs at least one night, ideally two or three.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:source_note:chongqing-planning-signal-do-not-chase-only-viral-spots',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing planning signal - Do not chase only viral spots',
  'Do not chase only viral spots: The route should build transitions between levels, not jump between isolated photo locations.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:source_note:chongqing-planning-signal-use-hotpot-after-movement',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing planning signal - Use hotpot after movement',
  'Use hotpot after movement: Hotpot lands better after the traveler has already felt the city''s physical pressure.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'chongqing:source_note:chongqing-research-anchors',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing research anchors',
  'CNN Travel: Chongqing cyberpunk city: https://www.cnn.com/travel/chongqing-china-tourism-cyberpunk-city-intl-hnk
UNESCO: Dazu Rock Carvings: https://whc.unesco.org/en/list/912',
  array['source_anchor', 'research', 'evidence']::text[],
  '{"source_count":2,"urls":["https://www.cnn.com/travel/chongqing-china-tourism-cyberpunk-city-intl-hnk","https://whc.unesco.org/en/list/912"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:source_note:quanzhou-editorial-guide-frame',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou editorial guide frame',
  'Quanzhou is the clearest way in this set to show China as connected to the wider world. Its value is port memory, plural religion, Hokkien roots, food, craft, and old streets that still hold layers of exchange.

Not generic: Not a generic coastal city. A normal guide may compare Quanzhou with Xiamen or list temples. A better route explains why Zayton mattered, how religions coexisted, and why Southeast Asian Chinese travelers may feel family memory here.

Visual direction: Generated city image direction: old port streets, incense, temple roofs, stone lanes, Hokkien memory, and Maritime Silk Road atmosphere.',
  array['editorial_guide', 'avoid_generic', 'visual_direction']::text[],
  '{}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:experience:quanzhou-city-reading-maritime-silk-road-city',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Quanzhou city reading - Maritime Silk Road city',
  'Maritime Silk Road city: Quanzhou explains China as a port civilization: merchants, sailors, worship, goods, language, and migration.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:experience:quanzhou-city-reading-religious-coexistence',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Quanzhou city reading - Religious coexistence',
  'Religious coexistence: Mosques, temples, shrines, churches, and ancestor halls make the city unusually rich for foreign interpretation.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:experience:quanzhou-city-reading-hokkien-origin-story',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Quanzhou city reading - Hokkien origin story',
  'Hokkien origin story: For many Southeast Asian Chinese travelers, Quanzhou can connect surnames, food, dialect, temples, and migration memory.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:route_seed:quanzhou-signature-day-day-1-port-and-old-city-orientation',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou signature day - Day 1: Port and old-city orientation',
  'Day 1: Port and old-city orientation: UNESCO components, old streets, maritime memory, and food as the first frame.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:route_seed:quanzhou-signature-day-day-2-religion-and-exchange',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou signature day - Day 2: Religion and exchange',
  'Day 2: Religion and exchange: A walking route through plural faiths, trade memory, and layered civic life.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:route_seed:quanzhou-signature-day-day-3-living-culture',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou signature day - Day 3: Living culture',
  'Day 3: Living culture: Zanhua, Nanyin, food, craft, incense, tea, or porcelain depending on the traveler''s profile.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:market_profile:quanzhou-traveler-fit-best-for-southeast-asian-diaspora',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou traveler fit - Best for Southeast Asian diaspora',
  'Best for Southeast Asian diaspora: Especially strong for Filipino, Malaysian, Singaporean, Indonesian, and Thai Chinese travelers with Hokkien connections.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:market_profile:quanzhou-traveler-fit-strong-for-unesco-travelers',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou traveler fit - Strong for UNESCO travelers',
  'Strong for UNESCO travelers: Good for people interested in medieval trade, religious coexistence, and non-obvious heritage cities.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:market_profile:quanzhou-traveler-fit-needs-interpretation',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou traveler fit - Needs interpretation',
  'Needs interpretation: Travelers looking for skyline spectacle or resort comfort may not immediately understand why Quanzhou matters.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:source_note:quanzhou-planning-signal-ask-about-ancestry',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou planning signal - Ask about ancestry',
  'Ask about ancestry: Surname, dialect, temple, family food memory, and ancestral county can reshape the route.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:source_note:quanzhou-planning-signal-do-not-rush-it',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou planning signal - Do not rush it',
  'Do not rush it: Quanzhou''s power comes from repeated streets, meals, evening atmosphere, and context.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:source_note:quanzhou-planning-signal-pair-with-craft-routes',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou planning signal - Pair with craft routes',
  'Pair with craft routes: Anxi tea, Dehua porcelain, incense, and Nanyin can turn heritage into sensory travel.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'quanzhou:source_note:quanzhou-research-anchors',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou research anchors',
  'UNESCO World Heritage: Quanzhou: https://whc.unesco.org/en/list/1561/
UNESCO Digital Library: Quanzhou as world emporium: https://unesdoc.unesco.org/ark:/48223/pf0000394185',
  array['source_anchor', 'research', 'evidence']::text[],
  '{"source_count":2,"urls":["https://whc.unesco.org/en/list/1561/","https://unesdoc.unesco.org/ark:/48223/pf0000394185"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:source_note:jingdezhen-editorial-guide-frame',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen editorial guide frame',
  'Jingdezhen is where Chinese culture becomes physical. The city is strongest when travelers meet clay, fire, glaze, risk, tools, studio practice, and global porcelain history rather than treating it as a shopping stop.

Not generic: Not a ceramics mall. A generic guide sends visitors to buy cups and try a workshop. A stronger route teaches how to look: material, firing, glaze, labor, taste, quality, and why porcelain changed global design.

Visual direction: Generated city image direction: hands on clay, kiln glow, porcelain whites, studio tables, glaze tests, and a quiet maker district.',
  array['editorial_guide', 'avoid_generic', 'visual_direction']::text[],
  '{}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:experience:jingdezhen-city-reading-process-over-product',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Jingdezhen city reading - Process over product',
  'Process over product: The best visit shows failure, timing, heat, and hands before it shows finished objects.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:experience:jingdezhen-city-reading-global-porcelain-memory',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Jingdezhen city reading - Global porcelain memory',
  'Global porcelain memory: Jingdezhen connects local clay to royal courts, trade, collecting, imitation, taste, and museum histories across continents.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:experience:jingdezhen-city-reading-living-studios',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Jingdezhen city reading - Living studios',
  'Living studios: Contemporary makers keep the city active; the route should include working spaces, not only museums.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:route_seed:jingdezhen-signature-day-day-1-kiln-and-museum-context',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen signature day - Day 1: Kiln and museum context',
  'Day 1: Kiln and museum context: Give the traveler the historical and technical frame before hands-on activity.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:route_seed:jingdezhen-signature-day-day-2-studio-and-process',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen signature day - Day 2: Studio and process',
  'Day 2: Studio and process: Meet makers, see tools, understand glaze choices, and handle work with guidance.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:route_seed:jingdezhen-signature-day-day-3-making-or-collecting',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen signature day - Day 3: Making or collecting',
  'Day 3: Making or collecting: Choose a hands-on session, a collector''s eye route, or a contemporary maker neighborhood.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:market_profile:jingdezhen-traveler-fit-best-for-design-travelers',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen traveler fit - Best for design travelers',
  'Best for design travelers: Strong for designers, architects, artists, collectors, museum patrons, and creative students.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:market_profile:jingdezhen-traveler-fit-good-for-object-led-culture',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen traveler fit - Good for object-led culture',
  'Good for object-led culture: Works for travelers who prefer understanding culture through making and material decisions.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:market_profile:jingdezhen-traveler-fit-too-niche-for-some-first-timers',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen traveler fit - Too niche for some first-timers',
  'Too niche for some first-timers: Travelers with no interest in craft may need Beijing, Chengdu, or Chongqing first.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:source_note:jingdezhen-planning-signal-appointments-matter',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen planning signal - Appointments matter',
  'Appointments matter: Studio schedules, kiln timing, maker availability, and market days shape the real route.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:source_note:jingdezhen-planning-signal-avoid-shopping-first-copy',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen planning signal - Avoid shopping-first copy',
  'Avoid shopping-first copy: Shopping can follow understanding, but should not be the reason the city exists in the route.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:source_note:jingdezhen-planning-signal-pair-with-tea',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen planning signal - Pair with tea',
  'Pair with tea: Jingdezhen and Jingmai make a strong tea-and-porcelain material culture journey.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingdezhen:source_note:jingdezhen-research-anchors',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen research anchors',
  'UNESCO Creative Cities: Jingdezhen: https://www.unesco.org/en/creative-cities/jingdezhen
UNESCO Tentative List: Imperial Kiln Sites: https://whc.unesco.org/en/tentativelists/6265/',
  array['source_anchor', 'research', 'evidence']::text[],
  '{"source_count":2,"urls":["https://www.unesco.org/en/creative-cities/jingdezhen","https://whc.unesco.org/en/tentativelists/6265/"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:source_note:jingmai-mountain-editorial-guide-frame',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai Mountain editorial guide frame',
  'Jingmai is a slow tea landscape, not a quick scenic stop. Its meaning comes from ancient tea forests, village continuity, ecology, hospitality, and the discipline of letting the itinerary slow down.

Not generic: Tea as landscape, not beverage. A generic guide treats Jingmai as a tea tasting. A stronger route explains tea as forest, family, ritual, ecology, village governance, and a way of reading time.

Visual direction: Generated city image direction: ancient tea forest, mist, village roofs, quiet paths, cups, hands, and mountain morning light.',
  array['editorial_guide', 'avoid_generic', 'visual_direction']::text[],
  '{}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:experience:jingmai-mountain-city-reading-ancient-tea-forest',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'experience',
  'Jingmai Mountain city reading - Ancient tea forest',
  'Ancient tea forest: Tea trees, forest ecology, village life, and understorey cultivation form the core of the destination.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:experience:jingmai-mountain-city-reading-hosted-hospitality',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'experience',
  'Jingmai Mountain city reading - Hosted hospitality',
  'Hosted hospitality: Meals and tea sessions should feel relational, not transactional. Hosting is part of the cultural experience.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:experience:jingmai-mountain-city-reading-quiet-as-value',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'experience',
  'Jingmai Mountain city reading - Quiet as value',
  'Quiet as value: Mist, weather, slow mornings, and unstructured time are not empty space. They are the product.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:route_seed:jingmai-mountain-signature-day-day-1-arrive-slowly',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai Mountain signature day - Day 1: Arrive slowly',
  'Day 1: Arrive slowly: Do not force sightseeing. Settle into the village and adjust to mountain rhythm.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:route_seed:jingmai-mountain-signature-day-day-2-forest-and-tea',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai Mountain signature day - Day 2: Forest and tea',
  'Day 2: Forest and tea: Walk the tea forest, taste with context, and connect leaf, ecology, household, and hospitality.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:route_seed:jingmai-mountain-signature-day-day-3-weather-and-village-time',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai Mountain signature day - Day 3: Weather and village time',
  'Day 3: Weather and village time: Protect a morning for mist, conversation, photos, and unstructured observation.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:market_profile:jingmai-mountain-traveler-fit-best-for-slow-luxury-travelers',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai Mountain traveler fit - Best for slow-luxury travelers',
  'Best for slow-luxury travelers: Good for tea lovers, photographers, repeat China visitors, and people seeking decompression.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:market_profile:jingmai-mountain-traveler-fit-strong-for-aesthetics',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai Mountain traveler fit - Strong for aesthetics',
  'Strong for aesthetics: Appeals to travelers who choose a destination by atmosphere, texture, and quiet rather than famous sights.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:market_profile:jingmai-mountain-traveler-fit-filter-patience',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai Mountain traveler fit - Filter patience',
  'Filter patience: Guests wanting nightlife, fast transfers, shopping, or dense sightseeing are weak fits.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:source_note:jingmai-mountain-planning-signal-buffer-logistics',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai Mountain planning signal - Buffer logistics',
  'Buffer logistics: Mountain roads, weather, and slower hospitality require time in the schedule.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:source_note:jingmai-mountain-planning-signal-ask-about-comfort-tradeoffs',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai Mountain planning signal - Ask about comfort tradeoffs',
  'Ask about comfort tradeoffs: The traveler must accept less convenience in exchange for stronger atmosphere.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:source_note:jingmai-mountain-planning-signal-use-after-a-city',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai Mountain planning signal - Use after a city',
  'Use after a city: Jingmai works well as decompression after Beijing, Chengdu, or Chongqing.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'jingmai-mountain:source_note:jingmai-mountain-research-anchors',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai Mountain research anchors',
  'UNESCO World Heritage: Jingmai Mountain: https://whc.unesco.org/en/list/1665/
WildChina: Jingmai Mountain: https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/',
  array['source_anchor', 'research', 'evidence']::text[],
  '{"source_count":2,"urls":["https://whc.unesco.org/en/list/1665/","https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:source_note:wudang-mountain-editorial-guide-frame',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang Mountain editorial guide frame',
  'Wudang should be approached as a Taoist mountain system. Its power comes from architecture, paths, clouds, breath, posture, silence, and the way philosophy becomes physical through movement.

Not generic: Beyond kung-fu fantasy. A generic guide sells temples and martial arts performance. A deeper Wudang route explains sacred architecture, internal practice, body awareness, and why the mountain''s pace matters.

Visual direction: Generated city image direction: Taoist roofs in mist, mountain stairs, early light, quiet courtyards, and slow Taiji posture.',
  array['editorial_guide', 'avoid_generic', 'visual_direction']::text[],
  '{}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:experience:wudang-mountain-city-reading-sacred-mountain-sequence',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'experience',
  'Wudang Mountain city reading - Sacred mountain sequence',
  'Sacred mountain sequence: Gates, paths, courtyards, halls, peaks, and weather create a philosophical landscape.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:experience:wudang-mountain-city-reading-taiji-as-interpretation',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'experience',
  'Wudang Mountain city reading - Taiji as interpretation',
  'Taiji as interpretation: A short practice session can make Taoist ideas legible through breath, weight, attention, and posture.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:experience:wudang-mountain-city-reading-atmosphere-over-performance',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'experience',
  'Wudang Mountain city reading - Atmosphere over performance',
  'Atmosphere over performance: Early light, clouds, wet stone, and quiet walking are central, not decorative.',
  array['read_the_city', 'interpretation', 'differentiated_guide']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:route_seed:wudang-mountain-signature-day-day-1-temple-orientation',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang Mountain signature day - Day 1: Temple orientation',
  'Day 1: Temple orientation: Introduce Taoist space, mountain pacing, and the difference between scenery and sacred structure.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:route_seed:wudang-mountain-signature-day-day-2-practice-and-ascent',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang Mountain signature day - Day 2: Practice and ascent',
  'Day 2: Practice and ascent: Combine an early route with a short Taiji or breath session and enough time for stillness.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:route_seed:wudang-mountain-signature-day-day-3-reflective-route',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang Mountain signature day - Day 3: Reflective route',
  'Day 3: Reflective route: Leave space for weather, walking, and a quieter second reading of the mountain.',
  array['signature_day', 'itinerary', 'route_logic']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:market_profile:wudang-mountain-traveler-fit-best-for-meaning-seeking-travelers',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang Mountain traveler fit - Best for meaning-seeking travelers',
  'Best for meaning-seeking travelers: Strong for Taoism, philosophy, martial culture, and wellness-adjacent guests who want specificity.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:market_profile:wudang-mountain-traveler-fit-good-for-repeat-china-visitors',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang Mountain traveler fit - Good for repeat China visitors',
  'Good for repeat China visitors: Wudang shifts the trip from cities and food into practice, silence, and mountain architecture.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:market_profile:wudang-mountain-traveler-fit-filter-mobility',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang Mountain traveler fit - Filter mobility',
  'Filter mobility: Stairs, early starts, and weather matter. The route must match the traveler''s body.',
  array['traveler_fit', 'audience', 'conversion']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:source_note:wudang-mountain-planning-signal-start-early',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang Mountain planning signal - Start early',
  'Start early: Late starts weaken Wudang. Morning light and thinner crowds are part of the route.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":1}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:source_note:wudang-mountain-planning-signal-ask-practice-interest',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang Mountain planning signal - Ask practice interest',
  'Ask practice interest: Some travelers want real Taiji context; others only need a gentle cultural introduction.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":2}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:source_note:wudang-mountain-planning-signal-pair-with-beijing',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang Mountain planning signal - Pair with Beijing',
  'Pair with Beijing: Beijing and Wudang create a strong contrast between state ritual and mountain cultivation.',
  array['planning_signal', 'route_design', 'concierge']::text[],
  '{"sort_order":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'wudang-mountain:source_note:wudang-mountain-research-anchors',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang Mountain research anchors',
  'UNESCO World Heritage: Wudang Mountains: https://whc.unesco.org/en/list/705/
Hubei Foreign Affairs Office: Wudang Mountain: https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html',
  array['source_anchor', 'research', 'evidence']::text[],
  '{"source_count":2,"urls":["https://whc.unesco.org/en/list/705/","https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html"]}'::jsonb,
  'a-deeper-china-redesign/lib/destination-guides.ts',
  null,
  'curated',
  'v1-editorial-guides'
),
(
  'beijing:route_seed:beijing-3-days-route-blueprint',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing 3 days route blueprint',
  'Capital grammar for first-time China travelers (3 days).
Best for: First-time visitors who need Beijing to explain imperial order without exhausting the trip.
Route logic: Start human-scale, move into ceremonial scale, then choose one deeper anchor instead of racing across the city.
Daily sequence:
1. Hutong soft landing, courtyard texture, local breakfast or noodles, and a northern dinner that explains Beijing as lived city.
2. Central Axis and palace-space reading: gates, thresholds, courts, ceremonial movement, and why scale was political.
3. Great Wall, Temple of Heaven, or a museum day selected by traveler profile: landscape defense, ritual order, or object history.
Conversion prompt: Ask the concierge to choose the third-day anchor based on whether the traveler cares more about architecture, ritual, photography, or history.',
  array['route_blueprint', 'itinerary', '3_days']::text[],
  '{"sort_order":1,"duration":"3 days","best_for":"First-time visitors who need Beijing to explain imperial order without exhausting the trip.","day_count":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'beijing:route_seed:beijing-5-days-route-blueprint',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing 5 days route blueprint',
  'Beijing with enough time to breathe (5 days).
Best for: Culture-led couples, families, and older travelers who want depth but still need good pacing.
Route logic: Separate Beijing into neighborhood, axis, wall, ritual, and contemporary memory so the city does not become one heavy monument block.
Daily sequence:
1. Arrival, hotel area orientation, hutong walk, and a simple food route with no major museum pressure.
2. Forbidden City or Central Axis route with contextual interpretation and a quiet courtyard meal afterward.
3. Great Wall day planned for crowd avoidance, photography rhythm, and recovery time.
4. Temple of Heaven, Lama Temple, or Confucian learning route paired with tea, calligraphy, or market texture.
5. 798, museum, diplomatic quarter, or slower neighborhood day depending on whether the traveler wants modern China or older Beijing.
Conversion prompt: Ask the concierge to balance wall logistics, palace tickets, walking tolerance, and one private expert-led hutong route.',
  array['route_blueprint', 'itinerary', '5_days']::text[],
  '{"sort_order":2,"duration":"5 days","best_for":"Culture-led couples, families, and older travelers who want depth but still need good pacing.","day_count":5}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'beijing:route_seed:beijing-7-days-route-blueprint',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing 7 days route blueprint',
  'Beijing as the opening chapter of China (7 days).
Best for: Travelers using Beijing as the foundation before Chengdu, Chongqing, Jingdezhen, Wudang, or Quanzhou.
Route logic: Use a full week to build historical grammar, then convert that understanding into a stronger multi-city route.
Daily sequence:
1. Arrival and local-scale Beijing: hutongs, neighborhood rhythm, simple meal, sleep recovery.
2. Central Axis and palace reading with clear explanation of imperial space.
3. Temple and ritual day: Temple of Heaven, altar logic, seasonal order, and ceremony.
4. Great Wall or Ming Tombs route with landscape and defense framing.
5. Museum or object-history day, chosen around art, archaeology, diplomacy, or family interest.
6. Modern Beijing contrast: 798, contemporary neighborhoods, or urban planning conversation.
7. Route handoff day: decide whether the next city should be food-soft Chengdu, visual Chongqing, craft Jingdezhen, Taoist Wudang, port Quanzhou, or tea-slow Jingmai.
Conversion prompt: Use /chat to turn Beijing into the first chapter of a two- or three-city China route instead of treating it as a standalone checklist.',
  array['route_blueprint', 'itinerary', '7_days']::text[],
  '{"sort_order":3,"duration":"7 days","best_for":"Travelers using Beijing as the foundation before Chengdu, Chongqing, Jingdezhen, Wudang, or Quanzhou.","day_count":7}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'chengdu:route_seed:chengdu-3-days-route-blueprint',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu 3 days route blueprint',
  'Pandas, food, and the Chengdu rhythm (3 days).
Best for: Families, food-first travelers, and first-timers who want China to feel warm and manageable.
Route logic: Use pandas as emotional entry, then let meals, parks, tea, and markets explain why Chengdu is loved.
Daily sequence:
1. Early panda visit, gentle lunch, snack walk, and a controlled Sichuan dinner calibrated for spice tolerance.
2. Market ingredients, tea-house sitting, park life, and a slower neighborhood food route.
3. Cooking class, Sichuan opera, Dujiangyan, or a countryside/craft extension depending on traveler type.
Conversion prompt: Ask the concierge to design a Chengdu route around spice tolerance, panda timing, family comfort, and one serious food evening.',
  array['route_blueprint', 'itinerary', '3_days']::text[],
  '{"sort_order":1,"duration":"3 days","best_for":"Families, food-first travelers, and first-timers who want China to feel warm and manageable.","day_count":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'chengdu:route_seed:chengdu-5-days-route-blueprint',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu 5 days route blueprint',
  'Food-first Chengdu with local ease (5 days).
Best for: Travelers who understand culture through eating, sitting, conversation, and daily life.
Route logic: Make meals the route structure, not an afterthought; each day should have one flavor lesson and one slow-life moment.
Daily sequence:
1. Arrival, neighborhood orientation, simple noodles or snacks, and tea-house decompression.
2. Pandas early, then lunch, park life, and an introductory hotpot or chuanchuan night.
3. Market-to-table day: ingredients, cooking, ordering logic, and a food street without turning it into a tourist crawl.
4. Dujiangyan, Qingcheng Mountain, or a soft countryside day if the traveler wants history and landscape.
5. Flexible day for opera, massage, craft, cafe neighborhoods, or a food expert session before moving to Chongqing or Beijing.
Conversion prompt: Use /chat to decide whether Chengdu should stay soft and food-led or become the first half of a Chengdu-Chongqing contrast route.',
  array['route_blueprint', 'itinerary', '5_days']::text[],
  '{"sort_order":2,"duration":"5 days","best_for":"Travelers who understand culture through eating, sitting, conversation, and daily life.","day_count":5}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'chengdu:route_seed:chengdu-7-days-route-blueprint',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu 7 days route blueprint',
  'Sichuan soft landing and deeper appetite (7 days).
Best for: Food travelers, families, and repeat visitors who want Chengdu as a base rather than a two-night stop.
Route logic: Build from emotional icons to deeper Sichuan: pandas, tea, spice, water systems, mountain edge, performance, and social ease.
Daily sequence:
1. Arrival and soft landing: tea, park, simple local meal.
2. Pandas and first flavor map: noodles, snacks, hotpot logic.
3. Market, cooking, and ordering day with a local food specialist.
4. Dujiangyan and Qingcheng-style landscape/history day, paced for comfort.
5. Tea-house culture, mahjong observation, bookshop/cafe neighborhoods, and slow social rhythm.
6. Optional Leshan, countryside, craft, or wellness day depending on energy.
7. Final Chengdu food review and handoff: either Chongqing for intensity or another culture city for contrast.
Conversion prompt: Ask the concierge to build a Sichuan week around heat level, panda priority, family needs, and whether Chongqing should be added.',
  array['route_blueprint', 'itinerary', '7_days']::text[],
  '{"sort_order":3,"duration":"7 days","best_for":"Food travelers, families, and repeat visitors who want Chengdu as a base rather than a two-night stop.","day_count":7}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'chongqing:route_seed:chongqing-3-days-route-blueprint',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing 3 days route blueprint',
  'The cinematic 8D mountain city (3 days).
Best for: Visual travelers, creators, younger premium guests, and repeat China visitors who want urban intensity.
Route logic: Do not chase isolated viral stops. Build a physical sequence through levels, rails, bridges, stairs, river fog, and night food.
Daily sequence:
1. Vertical orientation: rail, stairs, river edge, viewpoints, and a route that makes the city''s levels understandable.
2. Night city sequence: bridges, skyline, old streets, hotpot steam, and controlled late-evening movement.
3. Dazu, wartime memory, or deeper neighborhood day depending on whether the traveler wants culture, history, or more city texture.
Conversion prompt: Ask /chat to design a Chongqing night route that avoids random viral hopping and sequences viewpoints, transit, and hotpot properly.',
  array['route_blueprint', 'itinerary', '3_days']::text[],
  '{"sort_order":1,"duration":"3 days","best_for":"Visual travelers, creators, younger premium guests, and repeat China visitors who want urban intensity.","day_count":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'chongqing:route_seed:chongqing-5-days-route-blueprint',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing 5 days route blueprint',
  'Chongqing beyond the viral reel (5 days).
Best for: Travelers who like atmosphere but still need cultural depth, food, and slower recovery blocks.
Route logic: Alternate intense visual movement with deeper context so the city becomes readable, not just overwhelming.
Daily sequence:
1. Arrival and first vertical walk: rail, hillside streets, river orientation.
2. Full 8D city day: Liziba-style transit moment, bridges, stairs, elevators, market texture, and night view.
3. Hotpot and food structure day: spice, ordering, broth, neighborhood meals, and late-night rhythm.
4. Dazu Rock Carvings or wartime Chongqing layer for historical depth.
5. Slow city day: old neighborhoods, river ferry, cafe/tea pause, and final night photography.
Conversion prompt: Use the concierge to filter mobility, humidity tolerance, food heat level, and photography priorities before locking the route.',
  array['route_blueprint', 'itinerary', '5_days']::text[],
  '{"sort_order":2,"duration":"5 days","best_for":"Travelers who like atmosphere but still need cultural depth, food, and slower recovery blocks.","day_count":5}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'chongqing:route_seed:chongqing-7-days-route-blueprint',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing 7 days route blueprint',
  'Chongqing as urban spectacle and river culture (7 days).
Best for: Photographers, city obsessives, food travelers, and guests who want China to feel visually unfamiliar.
Route logic: Extend beyond downtown spectacle into rock carvings, river memory, wartime layers, food, and neighborhood adaptation to topography.
Daily sequence:
1. Arrival and base orientation around one accessible neighborhood.
2. Transit and levels day: rail, stairs, bridges, elevators, and street-to-roof transitions.
3. Night route day: river reflections, skyline, cliffside buildings, and hotpot.
4. Dazu Rock Carvings or heritage excursion for contrast with urban intensity.
5. Wartime and river-history day to explain the city''s strategic memory.
6. Food and neighborhood day focused on local meals beyond hotpot.
7. Flexible creator route: sunrise, fog, ferry, final viewpoint, and Chengdu or Zhangjiajie-style onward decision.
Conversion prompt: Ask /chat to decide whether a 7-day Chongqing route should stay urban or pair with Chengdu for emotional contrast.',
  array['route_blueprint', 'itinerary', '7_days']::text[],
  '{"sort_order":3,"duration":"7 days","best_for":"Photographers, city obsessives, food travelers, and guests who want China to feel visually unfamiliar.","day_count":7}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'quanzhou:route_seed:quanzhou-3-days-route-blueprint',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou 3 days route blueprint',
  'Maritime Silk Road and Hokkien memory (3 days).
Best for: Southeast Asian Chinese diaspora, UNESCO travelers, and culture travelers who prefer layered cities over famous skylines.
Route logic: Read Quanzhou as a port civilization: trade, worship, migration, food, and old streets all have to be connected.
Daily sequence:
1. Old city and port orientation: UNESCO components, street texture, food, and Zayton/Maritime Silk Road context.
2. Plural religion route: mosque, temples, shrines, churches, and ancestor-hall logic where relevant.
3. Living culture day: zanhua, Nanyin, incense, tea, food memory, or Dehua/Anxi extension depending on profile.
Conversion prompt: Ask the concierge to adapt Quanzhou by ancestry, religion interest, food memory, and whether the traveler has Hokkien family roots.',
  array['route_blueprint', 'itinerary', '3_days']::text[],
  '{"sort_order":1,"duration":"3 days","best_for":"Southeast Asian Chinese diaspora, UNESCO travelers, and culture travelers who prefer layered cities over famous skylines.","day_count":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'quanzhou:route_seed:quanzhou-5-days-route-blueprint',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou 5 days route blueprint',
  'Quanzhou as connected China (5 days).
Best for: Travelers from the Philippines, Malaysia, Singapore, Indonesia, Thailand, the Middle East, Europe, and heritage-focused North America.
Route logic: Give the city time to move from world heritage to family memory, craft, food, and sensory culture.
Daily sequence:
1. Arrival and old-city introduction: lanes, food, temples, and port vocabulary.
2. UNESCO and maritime route: trade, officials, sailors, goods, language, and port-city logic.
3. Religious coexistence day with interpretation for Islam, Buddhism, folk belief, Christianity, and ancestor practice.
4. Living-culture day: zanhua, Nanyin, tea, incense, or food craft.
5. Anxi tea, Dehua porcelain, coastal village, or family-root route depending on traveler identity.
Conversion prompt: Use /chat to choose between diaspora-root, UNESCO-depth, halal-aware, food-led, or craft-led Quanzhou versions.',
  array['route_blueprint', 'itinerary', '5_days']::text[],
  '{"sort_order":2,"duration":"5 days","best_for":"Travelers from the Philippines, Malaysia, Singapore, Indonesia, Thailand, the Middle East, Europe, and heritage-focused North America.","day_count":5}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'quanzhou:route_seed:quanzhou-7-days-route-blueprint',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou 7 days route blueprint',
  'Quanzhou plus craft and ancestral routes (7 days).
Best for: High-value cultural travelers who want a less obvious China story with strong expert interpretation.
Route logic: Build a full Fujian cultural chapter around port memory, Hokkien roots, tea, porcelain, incense, women-led zanhua, and music.
Daily sequence:
1. Old city arrival, food orientation, and first port-memory walk.
2. UNESCO core route with maritime trade interpretation.
3. Multi-faith route and Hokkien community memory.
4. Zanhua, Nanyin, local food, and evening street culture.
5. Anxi Tieguanyin tea day with mountain, processing, and tasting context.
6. Dehua porcelain or Yongchun incense day for craft and material culture.
7. Coastal village, ancestral hall, or custom family-root day before moving to Xiamen, Jingdezhen, or Beijing.
Conversion prompt: Ask the concierge to build a Quanzhou route around surname roots, language background, religious needs, and craft interests.',
  array['route_blueprint', 'itinerary', '7_days']::text[],
  '{"sort_order":3,"duration":"7 days","best_for":"High-value cultural travelers who want a less obvious China story with strong expert interpretation.","day_count":7}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'jingdezhen:route_seed:jingdezhen-3-days-route-blueprint',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen 3 days route blueprint',
  'Porcelain as process, not shopping (3 days).
Best for: Design travelers, artists, collectors, museum visitors, and culture travelers who like material stories.
Route logic: Teach the traveler how to look at porcelain before asking them to buy or make anything.
Daily sequence:
1. Kiln and museum context: clay, fire, glaze, labor, court taste, and global porcelain history.
2. Studio and workshop day with maker conversations, tools, glaze tests, and market reading.
3. Hands-on making, collector''s eye session, or contemporary studio route depending on traveler interest.
Conversion prompt: Ask /chat to decide whether the traveler needs a maker-led, collector-led, design-led, or family-friendly Jingdezhen route.',
  array['route_blueprint', 'itinerary', '3_days']::text[],
  '{"sort_order":1,"duration":"3 days","best_for":"Design travelers, artists, collectors, museum visitors, and culture travelers who like material stories.","day_count":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'jingdezhen:route_seed:jingdezhen-5-days-route-blueprint',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen 5 days route blueprint',
  'Jingdezhen for makers and collectors (5 days).
Best for: People who want to understand craft ecosystems, not just visit a famous ceramics city.
Route logic: Move from historical authority to working process, then into contemporary studios, markets, and object judgment.
Daily sequence:
1. Arrival and porcelain grammar: what makes Jingdezhen important and how to recognize quality.
2. Museum, kiln, and imperial-production context.
3. Working studio day: forming, carving, glazing, firing risk, and maker economics.
4. Market and collector route with guidance on taste, price logic, and what not to buy blindly.
5. Hands-on, design studio, or countryside/material-source day depending on the traveler.
Conversion prompt: Use the concierge to plan appointments around studio access, market days, shipment needs, and whether the traveler wants to buy.',
  array['route_blueprint', 'itinerary', '5_days']::text[],
  '{"sort_order":2,"duration":"5 days","best_for":"People who want to understand craft ecosystems, not just visit a famous ceramics city.","day_count":5}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'jingdezhen:route_seed:jingdezhen-7-days-route-blueprint',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen 7 days route blueprint',
  'Porcelain, tea, and design culture (7 days).
Best for: Creative professionals and repeat China travelers who want a craft-intensive week.
Route logic: Give enough time for process, failure, repetition, collecting, contemporary design, and a possible tea or architecture pairing.
Daily sequence:
1. Orientation and porcelain history.
2. Kiln, museum, and imperial system day.
3. Workshop process day with hands and tools.
4. Studio visits and contemporary maker district.
5. Market, collecting, and shipping-practicality day.
6. Hands-on class or private maker session with feedback.
7. Pairing decision: continue to Jingmai for tea, Beijing for museums, or Quanzhou for maritime craft routes.
Conversion prompt: Ask /chat to build a craft week with appointment timing, object-buying rules, and the best onward city pairing.',
  array['route_blueprint', 'itinerary', '7_days']::text[],
  '{"sort_order":3,"duration":"7 days","best_for":"Creative professionals and repeat China travelers who want a craft-intensive week.","day_count":7}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'jingmai-mountain:route_seed:jingmai-mountain-3-days-route-blueprint',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai Mountain 3 days route blueprint',
  'Ancient tea forest slow landing (3 days).
Best for: Tea lovers, photographers, slow-luxury travelers, and people who need decompression after major cities.
Route logic: Protect quiet time. Jingmai fails if it is treated as a fast scenic stop.
Daily sequence:
1. Arrive slowly, settle into village rhythm, simple meal, and first tea without overprogramming.
2. Ancient tea forest walk, ecology explanation, household tea session, and hosted meal.
3. Mist morning, village observation, photography, second tasting, and departure buffer.
Conversion prompt: Ask the concierge to decide whether Jingmai should be a quiet ending, a tea-focused core, or a visual retreat after Chongqing or Beijing.',
  array['route_blueprint', 'itinerary', '3_days']::text[],
  '{"sort_order":1,"duration":"3 days","best_for":"Tea lovers, photographers, slow-luxury travelers, and people who need decompression after major cities.","day_count":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'jingmai-mountain:route_seed:jingmai-mountain-5-days-route-blueprint',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai Mountain 5 days route blueprint',
  'Tea landscape and village continuity (5 days).
Best for: Travelers willing to trade convenience for atmosphere, hospitality, and landscape depth.
Route logic: Use repeated tea sessions and weather changes to make tea feel like ecology, family, and time.
Daily sequence:
1. Arrival buffer and village orientation.
2. Tea forest, ecology, cultivation, and tasting basics.
3. Household hospitality, processing context, and comparison tasting.
4. Neighboring village or viewpoint day, adjusted for weather and road conditions.
5. Quiet morning, final tea session, and route handoff to city or airport.
Conversion prompt: Use /chat to balance road time, comfort expectations, photography, tea seriousness, and whether private hosting is needed.',
  array['route_blueprint', 'itinerary', '5_days']::text[],
  '{"sort_order":2,"duration":"5 days","best_for":"Travelers willing to trade convenience for atmosphere, hospitality, and landscape depth.","day_count":5}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'jingmai-mountain:route_seed:jingmai-mountain-7-days-route-blueprint',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai Mountain 7 days route blueprint',
  'A contemplative tea week (7 days).
Best for: Repeat China visitors, writers, photographers, tea buyers, and travelers building a slow China route.
Route logic: Make slowness the product: weather, cups, paths, hosts, village rhythms, and the difference between tea as beverage and tea as landscape.
Daily sequence:
1. Arrival and rest with no heavy program.
2. Tea forest and ecological reading.
3. Village life, hosted meal, and household tea practice.
4. Processing, storage, taste comparison, and buyer-awareness session if relevant.
5. Weather-buffer day for mist, photography, walking, or road delays.
6. Neighboring village, market, or regional cultural extension.
7. Quiet close, final tea, and onward decision to Chengdu, Jingdezhen, or Beijing.
Conversion prompt: Ask the concierge to build a Jingmai week only if the traveler values stillness, tea, hosting, and mountain logistics.',
  array['route_blueprint', 'itinerary', '7_days']::text[],
  '{"sort_order":3,"duration":"7 days","best_for":"Repeat China visitors, writers, photographers, tea buyers, and travelers building a slow China route.","day_count":7}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'wudang-mountain:route_seed:wudang-mountain-3-days-route-blueprint',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang Mountain 3 days route blueprint',
  'Taoist mountain and Taiji entry (3 days).
Best for: Travelers interested in Taoism, martial culture, philosophy, wellness-adjacent travel, and mountain atmosphere.
Route logic: Combine sacred architecture, early light, walking, and a short practice session so Taoism becomes physical, not abstract.
Daily sequence:
1. Arrival, temple orientation, sacred mountain vocabulary, and early rest.
2. Morning route through mountain architecture plus Taiji or breath practice with context.
3. Reflective second route, quieter halls, weather time, and departure buffer.
Conversion prompt: Ask /chat to adapt Wudang around walking ability, practice interest, early-start tolerance, and whether the traveler wants philosophy or photography.',
  array['route_blueprint', 'itinerary', '3_days']::text[],
  '{"sort_order":1,"duration":"3 days","best_for":"Travelers interested in Taoism, martial culture, philosophy, wellness-adjacent travel, and mountain atmosphere.","day_count":3}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'wudang-mountain:route_seed:wudang-mountain-5-days-route-blueprint',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang Mountain 5 days route blueprint',
  'Wudang without turning it into performance (5 days).
Best for: Meaning-seeking travelers and repeat China visitors who want a slower spiritual register.
Route logic: Give enough time for mist, courtyards, stairs, fatigue, silence, and practice rather than rushing peak photos.
Daily sequence:
1. Arrival and base orientation with light temple context.
2. Main mountain sequence: gates, halls, courtyards, and spatial meaning.
3. Taiji/internal practice session, breath, posture, and Taoist body logic.
4. Secondary walking route, quiet photography, and flexible weather buffer.
5. Reflection day and onward pairing with Beijing, Chengdu, or Jingdezhen.
Conversion prompt: Use the concierge to avoid overclaiming martial arts and instead build an honest Taoist mountain route.',
  array['route_blueprint', 'itinerary', '5_days']::text[],
  '{"sort_order":2,"duration":"5 days","best_for":"Meaning-seeking travelers and repeat China visitors who want a slower spiritual register.","day_count":5}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'wudang-mountain:route_seed:wudang-mountain-7-days-route-blueprint',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang Mountain 7 days route blueprint',
  'Taoist practice, mountain weather, and stillness (7 days).
Best for: Travelers who want a deeper retreat-like China segment, not only a scenic stop.
Route logic: Structure a week around repeated practice, architecture, walking, rest, and philosophical interpretation.
Daily sequence:
1. Arrival and quiet acclimatization.
2. Main sacred architecture route.
3. Introductory Taiji or internal practice with teacher context.
4. Mountain walking and secondary temple day.
5. Weather-buffer day for clouds, light, fatigue, or slower observation.
6. Second practice or philosophy session tied to what the traveler has already seen.
7. Departure reflection and route handoff to Beijing for ritual scale or Jingdezhen for material culture.
Conversion prompt: Ask /chat whether the traveler is suited for a full Wudang week or only needs a 3-day mountain chapter.',
  array['route_blueprint', 'itinerary', '7_days']::text[],
  '{"sort_order":3,"duration":"7 days","best_for":"Travelers who want a deeper retreat-like China segment, not only a scenic stop.","day_count":7}'::jsonb,
  'a-deeper-china-redesign/lib/destination-itineraries.ts',
  null,
  'curated',
  'v1-itinerary-blueprints'
),
(
  'beijing:route_seed:first-china-cultural-arc-route-combination',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'First China cultural arc route combination',
  'First China cultural arc (9-12 days).
Cities: beijing, chengdu, chongqing
Best for: First-time visitors who want history, comfort, food, pandas, and one visually unforgettable modern city.
Route logic: Begin with Beijing for historical grammar, soften into Chengdu through pandas, food, and tea, then finish with Chongqing for 8D urban intensity.
City order:
1. Beijing: power, ritual, axis, hutongs, and the first framework for China.
2. Chengdu: food, pandas, tea houses, parks, and emotional ease.
3. Chongqing: vertical geography, nightscape, hotpot, and cinematic energy.
Why it is not generic: This is not a Beijing-Xian-Shanghai standard route. It teaches China through capital order, Sichuan social life, and mountain-city urbanism.
Conversion question: Should the route be family-friendly and soft, or more visual, food-heavy, and late-night?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing']::text[],
  '{"sort_order":1,"route_id":"first-china-cultural-arc","duration":"9-12 days","cities":["beijing","chengdu","chongqing"],"primary_record_for":"beijing","best_for":"First-time visitors who want history, comfort, food, pandas, and one visually unforgettable modern city."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chengdu:route_seed:first-china-cultural-arc-route-combination',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'First China cultural arc route combination',
  'First China cultural arc (9-12 days).
Cities: beijing, chengdu, chongqing
Best for: First-time visitors who want history, comfort, food, pandas, and one visually unforgettable modern city.
Route logic: Begin with Beijing for historical grammar, soften into Chengdu through pandas, food, and tea, then finish with Chongqing for 8D urban intensity.
City order:
1. Beijing: power, ritual, axis, hutongs, and the first framework for China.
2. Chengdu: food, pandas, tea houses, parks, and emotional ease.
3. Chongqing: vertical geography, nightscape, hotpot, and cinematic energy.
Why it is not generic: This is not a Beijing-Xian-Shanghai standard route. It teaches China through capital order, Sichuan social life, and mountain-city urbanism.
Conversion question: Should the route be family-friendly and soft, or more visual, food-heavy, and late-night?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing']::text[],
  '{"sort_order":1,"route_id":"first-china-cultural-arc","duration":"9-12 days","cities":["beijing","chengdu","chongqing"],"primary_record_for":"chengdu","best_for":"First-time visitors who want history, comfort, food, pandas, and one visually unforgettable modern city."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chongqing:route_seed:first-china-cultural-arc-route-combination',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'First China cultural arc route combination',
  'First China cultural arc (9-12 days).
Cities: beijing, chengdu, chongqing
Best for: First-time visitors who want history, comfort, food, pandas, and one visually unforgettable modern city.
Route logic: Begin with Beijing for historical grammar, soften into Chengdu through pandas, food, and tea, then finish with Chongqing for 8D urban intensity.
City order:
1. Beijing: power, ritual, axis, hutongs, and the first framework for China.
2. Chengdu: food, pandas, tea houses, parks, and emotional ease.
3. Chongqing: vertical geography, nightscape, hotpot, and cinematic energy.
Why it is not generic: This is not a Beijing-Xian-Shanghai standard route. It teaches China through capital order, Sichuan social life, and mountain-city urbanism.
Conversion question: Should the route be family-friendly and soft, or more visual, food-heavy, and late-night?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing']::text[],
  '{"sort_order":1,"route_id":"first-china-cultural-arc","duration":"9-12 days","cities":["beijing","chengdu","chongqing"],"primary_record_for":"chongqing","best_for":"First-time visitors who want history, comfort, food, pandas, and one visually unforgettable modern city."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chengdu:route_seed:sichuan-basin-contrast-route-combination',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Sichuan Basin contrast route combination',
  'Sichuan Basin contrast (5-7 days).
Cities: chengdu, chongqing
Best for: Food travelers, families with older children, photographers, and travelers choosing between comfort and intensity.
Route logic: Put Chengdu first because it makes Sichuan feel relaxed and generous; put Chongqing second because it raises the volume through heat, slopes, river fog, and night movement.
City order:
1. Chengdu: pandas, tea-house rhythm, markets, controlled Sichuan flavor.
2. Chongqing: 8D movement, rails, bridges, stairs, hotpot, and night views.
Why it is not generic: The point is not to see two nearby cities. The value is emotional contrast: soft Sichuan first, cinematic Sichuan second.
Conversion question: How much spice, stairs, humidity, and late-night walking can the traveler enjoy?',
  array['route_combination', 'multi_city', 'itinerary', 'chengdu', 'chongqing']::text[],
  '{"sort_order":2,"route_id":"sichuan-basin-contrast","duration":"5-7 days","cities":["chengdu","chongqing"],"primary_record_for":"chengdu","best_for":"Food travelers, families with older children, photographers, and travelers choosing between comfort and intensity."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chongqing:route_seed:sichuan-basin-contrast-route-combination',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Sichuan Basin contrast route combination',
  'Sichuan Basin contrast (5-7 days).
Cities: chengdu, chongqing
Best for: Food travelers, families with older children, photographers, and travelers choosing between comfort and intensity.
Route logic: Put Chengdu first because it makes Sichuan feel relaxed and generous; put Chongqing second because it raises the volume through heat, slopes, river fog, and night movement.
City order:
1. Chengdu: pandas, tea-house rhythm, markets, controlled Sichuan flavor.
2. Chongqing: 8D movement, rails, bridges, stairs, hotpot, and night views.
Why it is not generic: The point is not to see two nearby cities. The value is emotional contrast: soft Sichuan first, cinematic Sichuan second.
Conversion question: How much spice, stairs, humidity, and late-night walking can the traveler enjoy?',
  array['route_combination', 'multi_city', 'itinerary', 'chengdu', 'chongqing']::text[],
  '{"sort_order":2,"route_id":"sichuan-basin-contrast","duration":"5-7 days","cities":["chengdu","chongqing"],"primary_record_for":"chongqing","best_for":"Food travelers, families with older children, photographers, and travelers choosing between comfort and intensity."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'quanzhou:route_seed:port-and-porcelain-culture-route-combination',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Port and porcelain culture route combination',
  'Port and porcelain culture (7-9 days).
Cities: quanzhou, jingdezhen
Best for: Design travelers, museum patrons, diaspora travelers, and people interested in trade, objects, craft, and global China.
Route logic: Use Quanzhou to explain maritime exchange and plural religion, then use Jingdezhen to show how Chinese material culture moved through the world.
City order:
1. Quanzhou: Maritime Silk Road, Hokkien roots, temples, food, Nanyin, zanhua, incense.
2. Jingdezhen: clay, kilns, glaze, workshops, makers, porcelain taste, and global collecting.
Why it is not generic: This route replaces famous-city sightseeing with a sharper story: how goods, belief, people, and objects made China international.
Conversion question: Is the traveler more interested in diaspora memory, religious coexistence, maker studios, or collecting?',
  array['route_combination', 'multi_city', 'itinerary', 'quanzhou', 'jingdezhen']::text[],
  '{"sort_order":3,"route_id":"port-and-porcelain-culture","duration":"7-9 days","cities":["quanzhou","jingdezhen"],"primary_record_for":"quanzhou","best_for":"Design travelers, museum patrons, diaspora travelers, and people interested in trade, objects, craft, and global China."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'jingdezhen:route_seed:port-and-porcelain-culture-route-combination',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Port and porcelain culture route combination',
  'Port and porcelain culture (7-9 days).
Cities: quanzhou, jingdezhen
Best for: Design travelers, museum patrons, diaspora travelers, and people interested in trade, objects, craft, and global China.
Route logic: Use Quanzhou to explain maritime exchange and plural religion, then use Jingdezhen to show how Chinese material culture moved through the world.
City order:
1. Quanzhou: Maritime Silk Road, Hokkien roots, temples, food, Nanyin, zanhua, incense.
2. Jingdezhen: clay, kilns, glaze, workshops, makers, porcelain taste, and global collecting.
Why it is not generic: This route replaces famous-city sightseeing with a sharper story: how goods, belief, people, and objects made China international.
Conversion question: Is the traveler more interested in diaspora memory, religious coexistence, maker studios, or collecting?',
  array['route_combination', 'multi_city', 'itinerary', 'quanzhou', 'jingdezhen']::text[],
  '{"sort_order":3,"route_id":"port-and-porcelain-culture","duration":"7-9 days","cities":["quanzhou","jingdezhen"],"primary_record_for":"jingdezhen","best_for":"Design travelers, museum patrons, diaspora travelers, and people interested in trade, objects, craft, and global China."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'jingdezhen:route_seed:tea-and-porcelain-slow-craft-route-combination',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Tea and porcelain slow craft route combination',
  'Tea and porcelain slow craft (8-11 days).
Cities: jingdezhen, jingmai-mountain
Best for: Creative professionals, tea drinkers, photographers, writers, and slow-luxury travelers.
Route logic: Begin with porcelain as object and process, then move to Jingmai where tea becomes forest, hospitality, and time.
City order:
1. Jingdezhen: material culture, studios, kilns, glaze, tools, and object judgment.
2. Jingmai: ancient tea forest, village rhythm, hosted meals, cups, mist, and quiet.
Why it is not generic: The route is built around use and touch: the cup, the leaf, the hand, the host, and the time needed to understand them.
Conversion question: Does the traveler want maker access, tea buying context, photography time, or a quieter retreat ending?',
  array['route_combination', 'multi_city', 'itinerary', 'jingdezhen', 'jingmai-mountain']::text[],
  '{"sort_order":4,"route_id":"tea-and-porcelain-slow-craft","duration":"8-11 days","cities":["jingdezhen","jingmai-mountain"],"primary_record_for":"jingdezhen","best_for":"Creative professionals, tea drinkers, photographers, writers, and slow-luxury travelers."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'jingmai-mountain:route_seed:tea-and-porcelain-slow-craft-route-combination',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Tea and porcelain slow craft route combination',
  'Tea and porcelain slow craft (8-11 days).
Cities: jingdezhen, jingmai-mountain
Best for: Creative professionals, tea drinkers, photographers, writers, and slow-luxury travelers.
Route logic: Begin with porcelain as object and process, then move to Jingmai where tea becomes forest, hospitality, and time.
City order:
1. Jingdezhen: material culture, studios, kilns, glaze, tools, and object judgment.
2. Jingmai: ancient tea forest, village rhythm, hosted meals, cups, mist, and quiet.
Why it is not generic: The route is built around use and touch: the cup, the leaf, the hand, the host, and the time needed to understand them.
Conversion question: Does the traveler want maker access, tea buying context, photography time, or a quieter retreat ending?',
  array['route_combination', 'multi_city', 'itinerary', 'jingdezhen', 'jingmai-mountain']::text[],
  '{"sort_order":4,"route_id":"tea-and-porcelain-slow-craft","duration":"8-11 days","cities":["jingdezhen","jingmai-mountain"],"primary_record_for":"jingmai-mountain","best_for":"Creative professionals, tea drinkers, photographers, writers, and slow-luxury travelers."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'beijing:route_seed:ritual-and-mountain-cultivation-route-combination',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Ritual and mountain cultivation route combination',
  'Ritual and mountain cultivation (6-8 days).
Cities: beijing, wudang-mountain
Best for: Travelers interested in architecture, Taoism, ritual, philosophy, martial culture, and the body as cultural lens.
Route logic: Use Beijing for state ritual and axial order, then move to Wudang for mountain Taoism, breath, practice, and sacred landscape.
City order:
1. Beijing: state order, palace sequence, altars, gates, and political space.
2. Wudang: Taoist architecture, mountain paths, Taiji, early light, and internal cultivation.
Why it is not generic: This is not a temple checklist. It contrasts two forms of Chinese order: capital ceremony and mountain practice.
Conversion question: Does the traveler want intellectual history, light practice, serious Taiji context, or contemplative walking?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'wudang-mountain']::text[],
  '{"sort_order":5,"route_id":"ritual-and-mountain-cultivation","duration":"6-8 days","cities":["beijing","wudang-mountain"],"primary_record_for":"beijing","best_for":"Travelers interested in architecture, Taoism, ritual, philosophy, martial culture, and the body as cultural lens."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'wudang-mountain:route_seed:ritual-and-mountain-cultivation-route-combination',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Ritual and mountain cultivation route combination',
  'Ritual and mountain cultivation (6-8 days).
Cities: beijing, wudang-mountain
Best for: Travelers interested in architecture, Taoism, ritual, philosophy, martial culture, and the body as cultural lens.
Route logic: Use Beijing for state ritual and axial order, then move to Wudang for mountain Taoism, breath, practice, and sacred landscape.
City order:
1. Beijing: state order, palace sequence, altars, gates, and political space.
2. Wudang: Taoist architecture, mountain paths, Taiji, early light, and internal cultivation.
Why it is not generic: This is not a temple checklist. It contrasts two forms of Chinese order: capital ceremony and mountain practice.
Conversion question: Does the traveler want intellectual history, light practice, serious Taiji context, or contemplative walking?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'wudang-mountain']::text[],
  '{"sort_order":5,"route_id":"ritual-and-mountain-cultivation","duration":"6-8 days","cities":["beijing","wudang-mountain"],"primary_record_for":"wudang-mountain","best_for":"Travelers interested in architecture, Taoism, ritual, philosophy, martial culture, and the body as cultural lens."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'quanzhou:route_seed:hokkien-roots-and-living-culture-route-combination',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Hokkien roots and living culture route combination',
  'Hokkien roots and living culture (5-8 days).
Cities: quanzhou, chengdu
Best for: Southeast Asian Chinese diaspora travelers who want ancestral memory plus an easy food-led city.
Route logic: Use Quanzhou for Hokkien roots, port memory, religion, and family resonance; use Chengdu afterward for softer food, pandas, and comfort.
City order:
1. Quanzhou: Hokkien origin, old streets, temples, food memory, Maritime Silk Road.
2. Chengdu: pandas, Sichuan meals, tea houses, parks, and decompression.
Why it is not generic: This route respects emotional heritage first, then protects comfort and pleasure so the trip does not become only ancestry work.
Conversion question: Should Quanzhou be built around surname roots, temple memory, food, zanhua, Nanyin, or a lighter heritage introduction?',
  array['route_combination', 'multi_city', 'itinerary', 'quanzhou', 'chengdu']::text[],
  '{"sort_order":6,"route_id":"hokkien-roots-and-living-culture","duration":"5-8 days","cities":["quanzhou","chengdu"],"primary_record_for":"quanzhou","best_for":"Southeast Asian Chinese diaspora travelers who want ancestral memory plus an easy food-led city."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chengdu:route_seed:hokkien-roots-and-living-culture-route-combination',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Hokkien roots and living culture route combination',
  'Hokkien roots and living culture (5-8 days).
Cities: quanzhou, chengdu
Best for: Southeast Asian Chinese diaspora travelers who want ancestral memory plus an easy food-led city.
Route logic: Use Quanzhou for Hokkien roots, port memory, religion, and family resonance; use Chengdu afterward for softer food, pandas, and comfort.
City order:
1. Quanzhou: Hokkien origin, old streets, temples, food memory, Maritime Silk Road.
2. Chengdu: pandas, Sichuan meals, tea houses, parks, and decompression.
Why it is not generic: This route respects emotional heritage first, then protects comfort and pleasure so the trip does not become only ancestry work.
Conversion question: Should Quanzhou be built around surname roots, temple memory, food, zanhua, Nanyin, or a lighter heritage introduction?',
  array['route_combination', 'multi_city', 'itinerary', 'quanzhou', 'chengdu']::text[],
  '{"sort_order":6,"route_id":"hokkien-roots-and-living-culture","duration":"5-8 days","cities":["quanzhou","chengdu"],"primary_record_for":"chengdu","best_for":"Southeast Asian Chinese diaspora travelers who want ancestral memory plus an easy food-led city."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chongqing:route_seed:visual-china-for-creators-route-combination',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Visual China for creators route combination',
  'Visual China for creators (7-10 days).
Cities: chongqing, jingmai-mountain, beijing
Best for: Photographers, filmmakers, writers, and travelers who want strong atmosphere rather than famous-name coverage.
Route logic: Open with Chongqing''s 8D urban spectacle, decompress in Jingmai''s tea forest, then end in Beijing with historical structure if international flights require it.
City order:
1. Chongqing: neon, fog, river, rail, stairs, and hotpot steam.
2. Jingmai: mist, tea forest, village roofs, quiet hospitality, and slow mornings.
3. Beijing: axis, hutongs, ritual architecture, and exit-city clarity.
Why it is not generic: The route is built around atmosphere and visual contrast: cyberpunk city, ancient tea forest, and capital geometry.
Conversion question: Does the traveler need a photo-led route, a creator schedule, or a more comfortable premium version with fewer rough edges?',
  array['route_combination', 'multi_city', 'itinerary', 'chongqing', 'jingmai-mountain', 'beijing']::text[],
  '{"sort_order":7,"route_id":"visual-china-for-creators","duration":"7-10 days","cities":["chongqing","jingmai-mountain","beijing"],"primary_record_for":"chongqing","best_for":"Photographers, filmmakers, writers, and travelers who want strong atmosphere rather than famous-name coverage."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'jingmai-mountain:route_seed:visual-china-for-creators-route-combination',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Visual China for creators route combination',
  'Visual China for creators (7-10 days).
Cities: chongqing, jingmai-mountain, beijing
Best for: Photographers, filmmakers, writers, and travelers who want strong atmosphere rather than famous-name coverage.
Route logic: Open with Chongqing''s 8D urban spectacle, decompress in Jingmai''s tea forest, then end in Beijing with historical structure if international flights require it.
City order:
1. Chongqing: neon, fog, river, rail, stairs, and hotpot steam.
2. Jingmai: mist, tea forest, village roofs, quiet hospitality, and slow mornings.
3. Beijing: axis, hutongs, ritual architecture, and exit-city clarity.
Why it is not generic: The route is built around atmosphere and visual contrast: cyberpunk city, ancient tea forest, and capital geometry.
Conversion question: Does the traveler need a photo-led route, a creator schedule, or a more comfortable premium version with fewer rough edges?',
  array['route_combination', 'multi_city', 'itinerary', 'chongqing', 'jingmai-mountain', 'beijing']::text[],
  '{"sort_order":7,"route_id":"visual-china-for-creators","duration":"7-10 days","cities":["chongqing","jingmai-mountain","beijing"],"primary_record_for":"jingmai-mountain","best_for":"Photographers, filmmakers, writers, and travelers who want strong atmosphere rather than famous-name coverage."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'beijing:route_seed:visual-china-for-creators-route-combination',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Visual China for creators route combination',
  'Visual China for creators (7-10 days).
Cities: chongqing, jingmai-mountain, beijing
Best for: Photographers, filmmakers, writers, and travelers who want strong atmosphere rather than famous-name coverage.
Route logic: Open with Chongqing''s 8D urban spectacle, decompress in Jingmai''s tea forest, then end in Beijing with historical structure if international flights require it.
City order:
1. Chongqing: neon, fog, river, rail, stairs, and hotpot steam.
2. Jingmai: mist, tea forest, village roofs, quiet hospitality, and slow mornings.
3. Beijing: axis, hutongs, ritual architecture, and exit-city clarity.
Why it is not generic: The route is built around atmosphere and visual contrast: cyberpunk city, ancient tea forest, and capital geometry.
Conversion question: Does the traveler need a photo-led route, a creator schedule, or a more comfortable premium version with fewer rough edges?',
  array['route_combination', 'multi_city', 'itinerary', 'chongqing', 'jingmai-mountain', 'beijing']::text[],
  '{"sort_order":7,"route_id":"visual-china-for-creators","duration":"7-10 days","cities":["chongqing","jingmai-mountain","beijing"],"primary_record_for":"beijing","best_for":"Photographers, filmmakers, writers, and travelers who want strong atmosphere rather than famous-name coverage."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'beijing:route_seed:seven-city-founder-map-route-combination',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Seven-city founder map route combination',
  'Seven-city founder map (18-24 days).
Cities: beijing, chengdu, chongqing, quanzhou, jingdezhen, jingmai-mountain, wudang-mountain
Best for: Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.
Route logic: Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.
City order:
1. Beijing: historical grammar.
2. Chengdu: food and emotional ease.
3. Chongqing: 8D visual intensity.
4. Quanzhou: port memory and Hokkien roots.
5. Jingdezhen: porcelain and maker culture.
6. Jingmai: tea forest and slow hospitality.
7. Wudang: Taoist mountain and body practice.
Why it is not generic: This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.
Conversion question: Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing', 'quanzhou', 'jingdezhen', 'jingmai-mountain', 'wudang-mountain']::text[],
  '{"sort_order":8,"route_id":"seven-city-founder-map","duration":"18-24 days","cities":["beijing","chengdu","chongqing","quanzhou","jingdezhen","jingmai-mountain","wudang-mountain"],"primary_record_for":"beijing","best_for":"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chengdu:route_seed:seven-city-founder-map-route-combination',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Seven-city founder map route combination',
  'Seven-city founder map (18-24 days).
Cities: beijing, chengdu, chongqing, quanzhou, jingdezhen, jingmai-mountain, wudang-mountain
Best for: Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.
Route logic: Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.
City order:
1. Beijing: historical grammar.
2. Chengdu: food and emotional ease.
3. Chongqing: 8D visual intensity.
4. Quanzhou: port memory and Hokkien roots.
5. Jingdezhen: porcelain and maker culture.
6. Jingmai: tea forest and slow hospitality.
7. Wudang: Taoist mountain and body practice.
Why it is not generic: This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.
Conversion question: Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing', 'quanzhou', 'jingdezhen', 'jingmai-mountain', 'wudang-mountain']::text[],
  '{"sort_order":8,"route_id":"seven-city-founder-map","duration":"18-24 days","cities":["beijing","chengdu","chongqing","quanzhou","jingdezhen","jingmai-mountain","wudang-mountain"],"primary_record_for":"chengdu","best_for":"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'chongqing:route_seed:seven-city-founder-map-route-combination',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Seven-city founder map route combination',
  'Seven-city founder map (18-24 days).
Cities: beijing, chengdu, chongqing, quanzhou, jingdezhen, jingmai-mountain, wudang-mountain
Best for: Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.
Route logic: Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.
City order:
1. Beijing: historical grammar.
2. Chengdu: food and emotional ease.
3. Chongqing: 8D visual intensity.
4. Quanzhou: port memory and Hokkien roots.
5. Jingdezhen: porcelain and maker culture.
6. Jingmai: tea forest and slow hospitality.
7. Wudang: Taoist mountain and body practice.
Why it is not generic: This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.
Conversion question: Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing', 'quanzhou', 'jingdezhen', 'jingmai-mountain', 'wudang-mountain']::text[],
  '{"sort_order":8,"route_id":"seven-city-founder-map","duration":"18-24 days","cities":["beijing","chengdu","chongqing","quanzhou","jingdezhen","jingmai-mountain","wudang-mountain"],"primary_record_for":"chongqing","best_for":"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'quanzhou:route_seed:seven-city-founder-map-route-combination',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Seven-city founder map route combination',
  'Seven-city founder map (18-24 days).
Cities: beijing, chengdu, chongqing, quanzhou, jingdezhen, jingmai-mountain, wudang-mountain
Best for: Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.
Route logic: Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.
City order:
1. Beijing: historical grammar.
2. Chengdu: food and emotional ease.
3. Chongqing: 8D visual intensity.
4. Quanzhou: port memory and Hokkien roots.
5. Jingdezhen: porcelain and maker culture.
6. Jingmai: tea forest and slow hospitality.
7. Wudang: Taoist mountain and body practice.
Why it is not generic: This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.
Conversion question: Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing', 'quanzhou', 'jingdezhen', 'jingmai-mountain', 'wudang-mountain']::text[],
  '{"sort_order":8,"route_id":"seven-city-founder-map","duration":"18-24 days","cities":["beijing","chengdu","chongqing","quanzhou","jingdezhen","jingmai-mountain","wudang-mountain"],"primary_record_for":"quanzhou","best_for":"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'jingdezhen:route_seed:seven-city-founder-map-route-combination',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Seven-city founder map route combination',
  'Seven-city founder map (18-24 days).
Cities: beijing, chengdu, chongqing, quanzhou, jingdezhen, jingmai-mountain, wudang-mountain
Best for: Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.
Route logic: Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.
City order:
1. Beijing: historical grammar.
2. Chengdu: food and emotional ease.
3. Chongqing: 8D visual intensity.
4. Quanzhou: port memory and Hokkien roots.
5. Jingdezhen: porcelain and maker culture.
6. Jingmai: tea forest and slow hospitality.
7. Wudang: Taoist mountain and body practice.
Why it is not generic: This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.
Conversion question: Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing', 'quanzhou', 'jingdezhen', 'jingmai-mountain', 'wudang-mountain']::text[],
  '{"sort_order":8,"route_id":"seven-city-founder-map","duration":"18-24 days","cities":["beijing","chengdu","chongqing","quanzhou","jingdezhen","jingmai-mountain","wudang-mountain"],"primary_record_for":"jingdezhen","best_for":"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'jingmai-mountain:route_seed:seven-city-founder-map-route-combination',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Seven-city founder map route combination',
  'Seven-city founder map (18-24 days).
Cities: beijing, chengdu, chongqing, quanzhou, jingdezhen, jingmai-mountain, wudang-mountain
Best for: Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.
Route logic: Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.
City order:
1. Beijing: historical grammar.
2. Chengdu: food and emotional ease.
3. Chongqing: 8D visual intensity.
4. Quanzhou: port memory and Hokkien roots.
5. Jingdezhen: porcelain and maker culture.
6. Jingmai: tea forest and slow hospitality.
7. Wudang: Taoist mountain and body practice.
Why it is not generic: This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.
Conversion question: Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing', 'quanzhou', 'jingdezhen', 'jingmai-mountain', 'wudang-mountain']::text[],
  '{"sort_order":8,"route_id":"seven-city-founder-map","duration":"18-24 days","cities":["beijing","chengdu","chongqing","quanzhou","jingdezhen","jingmai-mountain","wudang-mountain"],"primary_record_for":"jingmai-mountain","best_for":"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'wudang-mountain:route_seed:seven-city-founder-map-route-combination',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Seven-city founder map route combination',
  'Seven-city founder map (18-24 days).
Cities: beijing, chengdu, chongqing, quanzhou, jingdezhen, jingmai-mountain, wudang-mountain
Best for: Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea.
Route logic: Treat each city as a different China: capital order, food ease, urban intensity, maritime memory, porcelain craft, tea ecology, and Taoist mountain cultivation.
City order:
1. Beijing: historical grammar.
2. Chengdu: food and emotional ease.
3. Chongqing: 8D visual intensity.
4. Quanzhou: port memory and Hokkien roots.
5. Jingdezhen: porcelain and maker culture.
6. Jingmai: tea forest and slow hospitality.
7. Wudang: Taoist mountain and body practice.
Why it is not generic: This is not a grand tour of famous landmarks. It is a thesis route proving that China can be read through systems, materials, appetite, belief, and landscape.
Conversion question: Which three city identities matter most to the traveler: history, food, visuals, roots, craft, tea, or spiritual practice?',
  array['route_combination', 'multi_city', 'itinerary', 'beijing', 'chengdu', 'chongqing', 'quanzhou', 'jingdezhen', 'jingmai-mountain', 'wudang-mountain']::text[],
  '{"sort_order":8,"route_id":"seven-city-founder-map","duration":"18-24 days","cities":["beijing","chengdu","chongqing","quanzhou","jingdezhen","jingmai-mountain","wudang-mountain"],"primary_record_for":"wudang-mountain","best_for":"Long-stay cultural travelers, researchers, creators, or prospective clients testing the full Deeper China idea."}'::jsonb,
  'a-deeper-china-redesign/lib/route-combinations.ts',
  null,
  'curated',
  'v1-route-combinations'
),
(
  'beijing:market_profile:beijing-for-north-american-first-timers',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing for North American first-timers',
  'North American first-time visitors often need Beijing to provide orientation: dynastic history, national scale, food safety confidence, neighborhood life, and the logic of moving through a very large Chinese city. The concierge should keep the route clear and not over-intellectualize the first day.',
  array['beijing', 'north_america', 'first_time_china', 'market_profile']::text[],
  '{"priority_market":["United States","Canada"],"lead_question":"Is this your first time in China or your first time beyond Shanghai/Hong Kong?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:market_profile:beijing-for-european-heritage-and-architecture-travelers',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing for European heritage and architecture travelers',
  'European travelers with interest in architecture, museums, and historical cities can be sold Beijing through ceremonial space, axes, gates, courtyard typologies, urban preservation, and the contrast between imperial and modern state planning.',
  array['beijing', 'europe', 'architecture', 'heritage_travel']::text[],
  '{"priority_market":["United Kingdom","France","Germany","Italy","Spain"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:market_profile:beijing-for-families-needing-a-confident-china-opening',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing for families needing a confident China opening',
  'For families, Beijing should be designed with fewer stops, stronger stories, good meal timing, and clear movement. Children can understand walls, gates, dragons, courtyards, noodles, and the Great Wall more easily than abstract dynastic lectures.',
  array['beijing', 'family_travel', 'first_time_china', 'pacing']::text[],
  '{"lead_question":"How old are the children, and how much walking can they handle?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:source_note:beijing-sales-message-by-traveler-maturity',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing sales message by traveler maturity',
  'For first-timers, sell Beijing as orientation. For repeat visitors, sell it as a second reading of hutongs, altars, food, and urban form. For experts, sell it through access, interpretation, and the ability to read space rather than simply see sites.',
  array['beijing', 'sales_message', 'traveler_maturity', 'conversion']::text[],
  '{"segmentation":["first-timer","repeat visitor","specialist"],"detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:traveler_faq:which-traveler-should-start-in-beijing-instead-of-shanghai',
  'beijing',
  'Beijing',
  'en',
  'traveler_faq',
  'Which traveler should start in Beijing instead of Shanghai?',
  'Travelers who want historical grammar, imperial space, ritual order, and a strong first explanation of China should usually start in Beijing. Travelers who mainly want international ease, design retail, and cosmopolitan dining may prefer Shanghai.',
  array['beijing', 'shanghai_comparison', 'faq', 'trip_start']::text[],
  '{"answer_style":"Use as a decision filter, not a city ranking.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:market_profile:chengdu-for-southeast-asian-food-travelers',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu for Southeast Asian food travelers',
  'Southeast Asian travelers often understand food as a primary travel language. Chengdu can be sold through flavor confidence, shared tables, snacks, markets, late meals, tea, and the pleasure of a city organized around appetite.',
  array['chengdu', 'southeast_asia', 'food_travel', 'market_profile']::text[],
  '{"priority_market":["Singapore","Malaysia","Thailand","Indonesia","Philippines"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:market_profile:chengdu-for-japanese-and-korean-short-break-travelers',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu for Japanese and Korean short-break travelers',
  'Japanese and Korean travelers can be attracted by Chengdu''s direct emotional hooks: pandas, food, teahouses, relaxed street life, and a manageable city break that feels different from East Asian urban order.',
  array['chengdu', 'japan', 'korea', 'short_break', 'pandas']::text[],
  '{"priority_market":["Japan","South Korea"],"trip_length":"3-4 days","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:market_profile:chengdu-for-premium-families',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu for premium families',
  'Premium families are likely to convert in Chengdu because the route can satisfy children through pandas and snacks while giving adults Sichuan food, tea-house culture, opera, parks, and slower social observation.',
  array['chengdu', 'family_travel', 'pandas', 'premium_family']::text[],
  '{"lead_question":"Are pandas the main reason for Chengdu, or should food be equal priority?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:source_note:chengdu-sales-message-by-comfort-level',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu sales message by comfort level',
  'For cautious travelers, sell Chengdu as a soft landing with pandas, parks, and controlled spice. For adventurous eaters, sell market-led Sichuan flavor and hotpot confidence. For slow travelers, sell teahouses and unhurried social rhythm.',
  array['chengdu', 'sales_message', 'comfort_level', 'conversion']::text[],
  '{"segmentation":["cautious","food-adventurous","slow traveler"],"detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:traveler_faq:is-chengdu-better-before-or-after-beijing',
  'chengdu',
  'Chengdu',
  'en',
  'traveler_faq',
  'Is Chengdu better before or after Beijing?',
  'For first-time travelers, Beijing usually works first because it gives historical structure. Chengdu works well afterward as the emotional softening: pandas, food, teahouses, parks, and slower local life.',
  array['chengdu', 'beijing_pairing', 'faq', 'route_order']::text[],
  '{"answer_style":"Recommend Beijing then Chengdu for most first-timers.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:market_profile:chongqing-for-young-asian-visual-travelers',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing for young Asian visual travelers',
  'Young travelers from Japan, Korea, Southeast Asia, and global urban centers may be especially responsive to Chongqing''s cinematic visuals: 8D levels, neon, river haze, transit moments, and hotpot nights. The sell should be atmosphere and movement.',
  array['chongqing', 'young_travelers', 'asia', 'photography', 'cyberpunk']::text[],
  '{"priority_market":["Japan","South Korea","Singapore","Malaysia","Thailand"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:market_profile:chongqing-for-repeat-china-visitors',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing for repeat China visitors',
  'Repeat China visitors are strong Chongqing candidates because the city disrupts familiar China images. It offers vertical density, confusing levels, river scale, fog, heat, and nightlife energy rather than classical heritage or polished cosmopolitanism.',
  array['chongqing', 'repeat_china', 'urban_exploration', 'market_profile']::text[],
  '{"lead_question":"Have you already seen Beijing, Shanghai, Xi''an, or Chengdu?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:market_profile:chongqing-for-photographers-and-video-creators',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing for photographers and video creators',
  'Photographers and video creators need Chongqing sequenced by light, height, movement, and weather. The route should include night transitions, elevated viewpoints, transit scenes, river edges, food steam, and controlled walking through vertical neighborhoods.',
  array['chongqing', 'photography', 'video', 'creator_travel']::text[],
  '{"lead_question":"Are you optimizing for photos, video, food, or general atmosphere?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:source_note:chongqing-sales-message-by-energy-level',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing sales message by energy level',
  'For high-energy travelers, sell stairs, hotpot, night routes, and visual intensity. For moderate travelers, sell a curated version with fewer climbs and stronger transport support. For low-energy travelers, recommend Chengdu as the main base and Chongqing as optional.',
  array['chongqing', 'sales_message', 'energy_level', 'conversion']::text[],
  '{"segmentation":["high energy","moderate energy","low energy"],"detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:traveler_faq:should-older-travelers-visit-chongqing',
  'chongqing',
  'Chongqing',
  'en',
  'traveler_faq',
  'Should older travelers visit Chongqing?',
  'Yes, but only with careful pacing. Chongqing can be challenging because of stairs, slopes, humidity, and confusing levels. A route for older travelers should reduce climbs, use drivers strategically, and focus on river views, food, and selected viewpoints.',
  array['chongqing', 'older_travelers', 'mobility', 'faq']::text[],
  '{"answer_style":"Qualify strongly by mobility and comfort.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:market_profile:quanzhou-for-filipino-chinese-travelers',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou for Filipino Chinese travelers',
  'Filipino Chinese travelers may connect with Quanzhou through Hokkien roots, surnames, temple practice, family food memory, and maritime migration. The concierge should ask about family origin stories and whether the trip is emotional, cultural, or exploratory.',
  array['quanzhou', 'philippines', 'filipino_chinese', 'hokkien', 'diaspora']::text[],
  '{"priority_market":["Philippines"],"lead_question":"Does your family identify with Hokkien, Fujian, Minnan, or a specific ancestral county?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:market_profile:quanzhou-for-malaysian-and-singaporean-chinese-travelers',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou for Malaysian and Singaporean Chinese travelers',
  'Malaysian and Singaporean Chinese travelers can read Quanzhou through Minnan language echoes, temple networks, clan memory, food similarities, and the feeling that Southeast Asian Chinese life has upstream roots here.',
  array['quanzhou', 'malaysia', 'singapore', 'hokkien', 'diaspora']::text[],
  '{"priority_market":["Malaysia","Singapore"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:market_profile:quanzhou-for-middle-eastern-heritage-travelers',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou for Middle Eastern heritage travelers',
  'Middle Eastern travelers interested in Islamic history, maritime trade, and Zayton can be introduced to Quanzhou through mosques, tombs, port memory, spice routes, and the idea of China as part of an Indian Ocean trade world.',
  array['quanzhou', 'middle_east', 'islamic_history', 'zayton', 'maritime_trade']::text[],
  '{"priority_market":["UAE","Oman","Saudi Arabia","Qatar"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:source_note:quanzhou-sales-message-by-ancestry-connection',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou sales message by ancestry connection',
  'If the traveler has Hokkien ancestry, sell origin and family memory. If not, sell Quanzhou as China''s outward-facing port city. For Muslim or Middle Eastern travelers, highlight maritime Islam and trade memory. For Europeans, highlight UNESCO and medieval world trade.',
  array['quanzhou', 'sales_message', 'diaspora', 'market_segmentation']::text[],
  '{"segmentation":["Hokkien diaspora","UNESCO traveler","Muslim heritage traveler","European maritime history traveler"],"detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:traveler_faq:is-quanzhou-meaningful-if-i-do-not-have-chinese-ancestry',
  'quanzhou',
  'Quanzhou',
  'en',
  'traveler_faq',
  'Is Quanzhou meaningful if I do not have Chinese ancestry?',
  'Yes. Without ancestry, Quanzhou still works as a rare way to understand China as a global maritime civilization with UNESCO heritage, religious coexistence, food, craft, and old-city life.',
  array['quanzhou', 'faq', 'non_diaspora', 'maritime_silk_road']::text[],
  '{"answer_style":"Separate diaspora value from global heritage value.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:market_profile:jingdezhen-for-european-design-travelers',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen for European design travelers',
  'European design travelers can be attracted through porcelain''s role in global taste, collecting, imitation, royal courts, trade, and modern craft practice. The route should connect historical porcelain to contemporary studios.',
  array['jingdezhen', 'europe', 'design_travel', 'porcelain']::text[],
  '{"priority_market":["France","Italy","United Kingdom","Germany","Netherlands"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:market_profile:jingdezhen-for-japanese-and-korean-craft-travelers',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen for Japanese and Korean craft travelers',
  'Japanese and Korean travelers with craft sensitivity may appreciate Jingdezhen through ceramic lineage, kiln culture, restraint, studio practice, material discipline, and the relationship between historical craft and contemporary making.',
  array['jingdezhen', 'japan', 'korea', 'craft_travel', 'ceramics']::text[],
  '{"priority_market":["Japan","South Korea"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:market_profile:jingdezhen-for-education-and-museum-groups',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen for education and museum groups',
  'Jingdezhen is strong for universities, museums, collectors'' circles, and design schools because it offers a coherent learning arc: material, production, labor, trade, taste, collecting, and contemporary practice.',
  array['jingdezhen', 'education', 'museum_group', 'design_school']::text[],
  '{"lead_question":"Is this a leisure trip, collector trip, or education-led group?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:source_note:jingdezhen-sales-message-by-craft-literacy',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen sales message by craft literacy',
  'For beginners, sell tactile discovery and hands-on making. For designers, sell process and studio access. For collectors, sell quality literacy. For museums and schools, sell the full porcelain world-system story.',
  array['jingdezhen', 'sales_message', 'craft_literacy', 'conversion']::text[],
  '{"segmentation":["beginner","designer","collector","education group"],"detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:traveler_faq:can-jingdezhen-work-for-people-who-do-not-collect-ceramics',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'traveler_faq',
  'Can Jingdezhen work for people who do not collect ceramics?',
  'Yes, if they are curious about how things are made. Jingdezhen is not only collecting; it is clay, fire, risk, labor, design, history, and the chance to understand culture through objects.',
  array['jingdezhen', 'faq', 'non_collector', 'craft_process']::text[],
  '{"answer_style":"Broaden from collecting to process and material culture.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:market_profile:jingmai-for-tea-travelers-in-asia',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai for tea travelers in Asia',
  'Tea travelers from Singapore, Malaysia, Thailand, Japan, Korea, and Taiwan-adjacent tea cultures may value Jingmai because tea appears as forest, village, hospitality, taste, ecology, and daily life rather than only a purchased product.',
  array['jingmai', 'asia', 'tea_travel', 'market_profile']::text[],
  '{"priority_market":["Singapore","Malaysia","Thailand","Japan","South Korea"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:market_profile:jingmai-for-western-slow-luxury-travelers',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai for Western slow-luxury travelers',
  'Western slow-luxury travelers may respond to Jingmai''s mist, tea forests, village rhythm, quiet mornings, ecology, and distance from mass tourism. The sell should be calm specificity, not generic wellness.',
  array['jingmai', 'western_markets', 'slow_luxury', 'tea_forest']::text[],
  '{"priority_market":["United States","Canada","Australia","United Kingdom","France","Germany"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:market_profile:jingmai-for-photographers',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai for photographers',
  'Photographers can be attracted by mist, tea terraces and forests, village roofs, morning light, textures, hands, cups, smoke, and the quiet rhythm of hospitality. The route should protect early and late light.',
  array['jingmai', 'photography', 'morning_light', 'aesthetic_travel']::text[],
  '{"lead_question":"Are you more interested in tea learning, photography, or quiet retreat time?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:source_note:jingmai-sales-message-by-patience-level',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai sales message by patience level',
  'For high-patience travelers, sell deep slowness and hosted tea time. For moderate travelers, pair Jingmai with a stronger city. For low-patience travelers, do not force it; they may be happier in Chengdu, Chongqing, or Beijing.',
  array['jingmai', 'sales_message', 'patience_level', 'conversion']::text[],
  '{"segmentation":["high patience","moderate patience","low patience"],"detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:traveler_faq:should-jingmai-be-included-on-a-first-china-trip',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'traveler_faq',
  'Should Jingmai be included on a first China trip?',
  'Usually only if the traveler strongly values tea, slow travel, photography, or quiet landscapes. For general first-timers, Jingmai is better as a second-China destination or as a deliberate retreat chapter after a major city.',
  array['jingmai', 'faq', 'first_time_china', 'slow_travel']::text[],
  '{"answer_style":"Filter carefully rather than over-selling.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:market_profile:wudang-for-western-wellness-adjacent-travelers',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang for Western wellness-adjacent travelers',
  'Western wellness-adjacent travelers may respond to Wudang if it is framed through real Taoist culture, breath, posture, mountain walking, and quiet rather than vague wellness language. The credibility comes from specificity.',
  array['wudang', 'western_markets', 'wellness_adjacent', 'taoism']::text[],
  '{"priority_market":["United States","Canada","Australia","United Kingdom","Germany"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:market_profile:wudang-for-martial-arts-and-taiji-learners',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang for martial arts and Taiji learners',
  'Martial arts and Taiji learners are natural Wudang candidates, but expectations must be managed. The premium travel product is not instant mastery; it is access to place, lineage atmosphere, embodied introduction, and philosophical context.',
  array['wudang', 'taiji', 'martial_arts', 'market_profile']::text[],
  '{"lead_question":"Do you want a cultural introduction, a practice session, or a more serious training arrangement?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:market_profile:wudang-for-repeat-china-visitors-seeking-meaning',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang for repeat China visitors seeking meaning',
  'Repeat China visitors who have already seen major cities may value Wudang because it changes the register of the trip: from sightseeing and food into mountain space, Taoist ideas, movement, silence, and reflection.',
  array['wudang', 'repeat_china', 'meaningful_travel', 'sacred_mountain']::text[],
  '{"priority_market":["repeat visitors","culture-led couples","solo reflective travelers"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:source_note:wudang-sales-message-by-practice-interest',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang sales message by practice interest',
  'For practice-minded guests, sell Taiji, breath, posture, and Taoist context. For atmosphere-minded guests, sell temples, mist, mountain paths, and quiet. For general tourists, keep Wudang short or suggest a better-fit city.',
  array['wudang', 'sales_message', 'practice_interest', 'conversion']::text[],
  '{"segmentation":["practice-minded","atmosphere-minded","general tourist"],"detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:traveler_faq:is-wudang-too-serious-for-casual-travelers',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'traveler_faq',
  'Is Wudang too serious for casual travelers?',
  'It can be, if sold as deep practice only. Casual travelers can still enjoy Wudang through mountain architecture, temple atmosphere, short Taiji introduction, and reflective walking, but the route should remain gentle and well explained.',
  array['wudang', 'faq', 'casual_traveler', 'taoist_mountain']::text[],
  '{"answer_style":"Make accessible without turning Wudang into entertainment.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-audiences.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:experience:read-the-central-axis-as-a-ritual-machine',
  'beijing',
  'Beijing',
  'en',
  'experience',
  'Read the Central Axis as a ritual machine',
  'For a culture-led Beijing route, the Central Axis should be explained as a designed sequence of gates, thresholds, courts, altars, and sightlines. The visitor is not only seeing famous buildings; they are learning how imperial China made power visible through symmetry, distance, approach, and ceremony.',
  array['beijing', 'central_axis', 'ritual_space', 'architecture']::text[],
  '{"why_it_matters":"Turns familiar monuments into an interpretive story about power and spatial order.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:experience:hutong-mornings-before-the-tourist-day-starts',
  'beijing',
  'Beijing',
  'en',
  'experience',
  'Hutong mornings before the tourist day starts',
  'The strongest hutong experience is early and slow: breakfast stalls, bicycle movement, school runs, market sounds, courtyard doorways, and small neighborhood rituals. This makes Beijing feel lived-in rather than reduced to palace history.',
  array['beijing', 'hutong', 'daily_life', 'slow_walk']::text[],
  '{"best_for":["return visitors","photographers","families"],"detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:food:beijing-food-as-northern-urban-memory',
  'beijing',
  'Beijing',
  'en',
  'food',
  'Beijing food as northern urban memory',
  'Instead of presenting Beijing food as a restaurant list, connect noodles, dumplings, hotpot, roast duck, breakfast breads, sesame paste, and seasonal snacks to migration, winter climate, imperial service economies, and neighborhood routines.',
  array['beijing', 'food', 'context', 'northern_china']::text[],
  '{"concierge_use":"Use when a traveler asks what to eat beyond Peking duck.","detail_type":"food_context"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:route_seed:do-not-overload-beijing-day-one',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Do not overload Beijing day one',
  'For foreign travelers arriving long-haul, Beijing works better with one anchoring site, one neighborhood walk, and one atmospheric meal. Saving the Forbidden City or Great Wall for a clearer morning often produces a better premium experience than forcing a checklist immediately.',
  array['beijing', 'arrival_day', 'pacing', 'route_design']::text[],
  '{"avoid":"Jet-lagged monument stacking.","detail_type":"route_design_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:market_profile:beijing-for-design-and-urban-planning-travelers',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing for design and urban planning travelers',
  'Design-minded travelers can read Beijing through axes, courtyard typologies, socialist boulevards, ring roads, hutong preservation, adaptive reuse, and the tension between planned order and everyday improvisation.',
  array['beijing', 'design_travel', 'urban_planning', 'architecture']::text[],
  '{"market_fit":["architects","design schools","museum patrons"],"detail_type":"audience_angle"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:source_note:why-book-a-beijing-expert',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Why book a Beijing expert',
  'Beijing is easy to visit but hard to read. A good expert adds value by explaining hierarchy, ritual, symbolism, neighborhood history, and pacing, so the traveler does not leave with only photos of large buildings.',
  array['beijing', 'expert', 'conversion', 'interpretation']::text[],
  '{"cta":"Offer a private route reading rather than generic guiding.","detail_type":"conversion_hook"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:experience:pandas-as-the-soft-entry-into-sichuan',
  'chengdu',
  'Chengdu',
  'en',
  'experience',
  'Pandas as the soft entry into Sichuan',
  'For most foreign travelers, pandas create immediate emotional desire. The route should use that attention as an opening, then move into Sichuan food, tea houses, parks, opera, and neighborhood life so Chengdu becomes more than a single animal encounter.',
  array['chengdu', 'pandas', 'family_travel', 'emotional_hook']::text[],
  '{"best_for":["families","couples","first-time China visitors"],"detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:food:sichuan-food-is-a-complete-travel-language',
  'chengdu',
  'Chengdu',
  'en',
  'food',
  'Sichuan food is a complete travel language',
  'Chengdu food should be explained through aroma, mouthfeel, peppercorn numbness, shared tables, late meals, snacks, markets, and the social confidence of local diners. The point is not only spice; it is how flavor organizes the day.',
  array['chengdu', 'sichuan_food', 'hotpot', 'street_food']::text[],
  '{"concierge_use":"Use when travelers ask whether Chengdu is too spicy.","detail_type":"food_context"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:experience:tea-houses-as-chengdu-s-social-engine',
  'chengdu',
  'Chengdu',
  'en',
  'experience',
  'Tea houses as Chengdu''s social engine',
  'A Chengdu tea house is not filler time. It shows the city''s pace: sitting, talking, watching, playing mahjong, listening, and letting the afternoon stretch. For foreigners, it is one of the easiest ways to feel local life without heavy explanation.',
  array['chengdu', 'tea_house', 'slow_travel', 'daily_life']::text[],
  '{"why_it_matters":"Converts comfort into cultural depth.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:route_seed:build-chengdu-around-appetite-and-rest',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Build Chengdu around appetite and rest',
  'Chengdu routes should leave enough space between meals. A premium route works better with fewer sites, stronger food choices, a tea-house pause, and one atmospheric evening than with a packed checklist.',
  array['chengdu', 'pacing', 'food_route', 'route_design']::text[],
  '{"avoid":"Over-scheduling before a serious dinner.","detail_type":"route_design_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:market_profile:chengdu-for-travelers-nervous-about-china',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu for travelers nervous about China',
  'Chengdu can make China feel approachable because the emotional hooks are clear: pandas, food, parks, tea, warmth, and a slower street rhythm. It is useful for guests who want culture without feeling constantly overwhelmed.',
  array['chengdu', 'first_time_china', 'comfort', 'soft_landing']::text[],
  '{"market_fit":["families","older couples","comfort-seeking premium guests"],"detail_type":"audience_angle"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:source_note:why-book-a-chengdu-food-expert',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Why book a Chengdu food expert',
  'A food expert prevents Chengdu from becoming random spicy meals. The value is ordering well, controlling heat level, explaining ingredients, choosing the right neighborhood, and connecting each meal to Sichuan social life.',
  array['chengdu', 'expert', 'food_expert', 'conversion']::text[],
  '{"cta":"Offer a curated flavor walk or private hotpot ordering session.","detail_type":"conversion_hook"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:experience:8d-navigation-as-the-attraction',
  'chongqing',
  'Chongqing',
  'en',
  'experience',
  '8D navigation as the attraction',
  'In Chongqing, movement itself is the experience. Elevators, stairs, ramps, monorails, bridges, tunnels, and layered roads make the city feel like a vertical puzzle. A good route should let travelers feel disoriented in a controlled and pleasurable way.',
  array['chongqing', '8d_city', 'urban_experience', 'navigation']::text[],
  '{"why_it_matters":"Makes the city memorable beyond individual photo spots.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:experience:cyberpunk-feeling-chongqing-after-dark',
  'chongqing',
  'Chongqing',
  'en',
  'experience',
  'Cyberpunk-feeling Chongqing after dark',
  'Chongqing''s strongest visual hours are often evening and night, when neon, fog, river reflections, bridges, hillside towers, and moving trains create a cinematic atmosphere. The route should prioritize transitions, viewpoints, and walking sequences rather than one static overlook.',
  array['chongqing', 'cyberpunk', 'night', 'photography']::text[],
  '{"best_for":["photographers","younger premium travelers","visual storytellers"],"detail_type":"photo_route"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:food:hotpot-as-mountain-city-temperament',
  'chongqing',
  'Chongqing',
  'en',
  'food',
  'Hotpot as mountain-city temperament',
  'Chongqing hotpot should be presented as part of the city''s intensity: heat, oil, steam, noise, late hours, shared risk, and appetite. It matches the geography rather than sitting apart from it.',
  array['chongqing', 'hotpot', 'food', 'nightlife']::text[],
  '{"concierge_use":"Use when comparing Chengdu and Chongqing food culture.","detail_type":"food_context"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:route_seed:chongqing-needs-night-routing',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing needs night routing',
  'A Chongqing itinerary that ends too early misses the city''s strongest identity. At least one evening should be designed around river movement, height changes, lit bridges, hotpot, and a final viewpoint or walk.',
  array['chongqing', 'night_route', 'route_design', 'river_city']::text[],
  '{"avoid":"Daytime-only sightseeing.","detail_type":"route_design_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:market_profile:chongqing-for-travelers-who-think-they-have-seen-china',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing for travelers who think they have seen China',
  'Chongqing works well for repeat visitors because it breaks expectations of what a Chinese city feels like. It is dense, vertical, humid, loud, cinematic, and emotionally different from capital, coastal, or garden-city narratives.',
  array['chongqing', 'repeat_china', 'visual_travel', 'city_contrast']::text[],
  '{"market_fit":["repeat visitors","Asia-savvy travelers","urban explorers"],"detail_type":"audience_angle"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:source_note:why-book-a-chongqing-route-designer',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Why book a Chongqing route designer',
  'Chongqing is easy to visit badly because navigation is confusing and viral stops can waste time. A route designer adds value by sequencing levels, transit, viewpoints, food, and night atmosphere into a coherent 8D experience.',
  array['chongqing', 'expert', 'route_design', 'conversion']::text[],
  '{"cta":"Offer a private 8D city walk and night route.","detail_type":"conversion_hook"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:experience:quanzhou-as-china-s-outward-facing-port-memory',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Quanzhou as China''s outward-facing port memory',
  'Quanzhou should be explained as a place where China met the wider world through trade, religion, migration, language, food, and craft. This is the opposite of a closed imperial narrative and makes the city especially legible for foreign visitors.',
  array['quanzhou', 'maritime_silk_road', 'world_heritage', 'port_city']::text[],
  '{"why_it_matters":"Differentiates Quanzhou from generic coastal tourism.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:market_profile:quanzhou-for-southeast-asian-hokkien-travelers',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou for Southeast Asian Hokkien travelers',
  'For travelers from the Philippines, Malaysia, Singapore, Indonesia, and Thailand, Quanzhou can connect family memory, temple practice, dialect, food, surnames, and ancestral geography. The emotional sell is origin, not only heritage.',
  array['quanzhou', 'hokkien', 'diaspora', 'southeast_asia']::text[],
  '{"market_fit":["Philippines","Malaysia","Singapore","Indonesia","Thailand"],"detail_type":"audience_angle"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:experience:plural-religion-as-a-walking-route',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Plural religion as a walking route',
  'Quanzhou''s religious landscape can be shaped as a walking story: temples, mosques, shrines, churches, ancestor halls, maritime gods, traders, and families all appear in a compact urban fabric. The point is coexistence through daily life, not only monuments.',
  array['quanzhou', 'religion', 'old_city', 'walking_route']::text[],
  '{"best_for":["religion scholars","UNESCO travelers","Southeast Asian diaspora guests"],"detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:food:quanzhou-food-as-diaspora-memory',
  'quanzhou',
  'Quanzhou',
  'en',
  'food',
  'Quanzhou food as diaspora memory',
  'Food in Quanzhou should be connected to Minnan taste, port life, family kitchens, temple neighborhoods, snacks, seafood, noodle textures, and Southeast Asian echoes. For many visitors, flavor may feel like recognition rather than novelty.',
  array['quanzhou', 'food', 'minnan', 'diaspora']::text[],
  '{"concierge_use":"Use for Hokkien and Southeast Asian market personalization.","detail_type":"food_context"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:experience:zanhua-incense-tea-porcelain-and-nanyin-as-living-culture',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Zanhua, incense, tea, porcelain, and Nanyin as living culture',
  'Quanzhou''s craft and performance appeal should be treated as living systems: zanhua photography, incense making, Anxi tea, Dehua white porcelain, and Nanyin can turn heritage into touch, sound, scent, and embodied memory.',
  array['quanzhou', 'zanhua', 'incense', 'tea', 'nanyin', 'craft']::text[],
  '{"route_use":"Good for 4-5 day routes that move beyond old-city walking.","detail_type":"craft_context"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:source_note:why-book-a-quanzhou-cultural-interpreter',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Why book a Quanzhou cultural interpreter',
  'Quanzhou contains layers that many visitors will miss alone: port history, clan memory, religious plurality, Minnan language, diaspora emotion, and craft meanings. The expert''s value is connecting fragments into a personal story.',
  array['quanzhou', 'expert', 'conversion', 'cultural_interpreter']::text[],
  '{"cta":"Offer a diaspora roots or Maritime Silk Road interpretation session.","detail_type":"conversion_hook"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:experience:porcelain-as-a-world-system-story',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Porcelain as a world-system story',
  'Jingdezhen is powerful because porcelain links local clay and kilns to global trade, royal collections, taste, imitation, technology, and design history. It lets foreign travelers understand China through objects that changed the world.',
  array['jingdezhen', 'porcelain', 'global_trade', 'design_history']::text[],
  '{"why_it_matters":"Connects craft to global cultural history.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:experience:studio-visits-over-shopping-stops',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Studio visits over shopping stops',
  'The premium Jingdezhen experience should prioritize studios, makers, materials, tools, firing, glazing, and failures. Shopping can happen, but it should follow understanding, not replace it.',
  array['jingdezhen', 'studio_visit', 'craft', 'maker_culture']::text[],
  '{"avoid":"Turning the city into a ceramics mall.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:experience:hands-on-clay-work-needs-context',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Hands-on clay work needs context',
  'A short making or glazing session is most valuable when framed by clay sourcing, wheel skill, kiln risk, glaze chemistry, and the difference between tourist activity and serious craft labor.',
  array['jingdezhen', 'hands_on', 'clay', 'glaze', 'craft_learning']::text[],
  '{"best_for":["families","designers","students","creative professionals"],"detail_type":"hands_on_experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:market_profile:jingdezhen-for-design-schools-and-collectors',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen for design schools and collectors',
  'Jingdezhen can support high-value groups because it offers museums, old kiln districts, working studios, contemporary makers, collecting conversations, and a clear bridge between historical craft and current design practice.',
  array['jingdezhen', 'design_school', 'collectors', 'creative_travel']::text[],
  '{"market_fit":["design schools","museum patrons","ceramics collectors"],"detail_type":"audience_angle"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:route_seed:pair-jingdezhen-with-beijing-or-jingmai',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Pair Jingdezhen with Beijing or Jingmai',
  'Jingdezhen pairs well with Beijing for power and taste, or with Jingmai for tea and porcelain as a material culture journey. These pairings help foreign travelers understand Chinese culture through use, ritual, and objects.',
  array['jingdezhen', 'route_pairing', 'beijing', 'jingmai', 'material_culture']::text[],
  '{"route_use":"Useful for 6-7 day premium routes.","detail_type":"route_design_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:source_note:why-book-a-jingdezhen-maker-connection',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Why book a Jingdezhen maker connection',
  'Jingdezhen''s best experiences are not always visible from public listings. A local maker connection can open studios, explain quality, avoid tourist traps, and help visitors understand what they are seeing or buying.',
  array['jingdezhen', 'expert', 'maker', 'conversion']::text[],
  '{"cta":"Offer a private studio-and-kiln route.","detail_type":"conversion_hook"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:experience:ancient-tea-forest-as-living-landscape',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'experience',
  'Ancient tea forest as living landscape',
  'Jingmai should be understood as tea, forest, village, ecology, and memory woven together. The strongest experience is not a quick tasting but walking through a landscape where tea trees, households, rituals, and seasons form a living system.',
  array['jingmai', 'tea_forest', 'ecology', 'slow_travel']::text[],
  '{"why_it_matters":"Frames tea as landscape rather than beverage.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:route_seed:jingmai-requires-slower-logistics',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai requires slower logistics',
  'Jingmai is not suited to rushed itineraries. The route needs buffer time for mountain roads, weather, village pacing, tea sessions, and quiet mornings. The premium value appears only when the schedule stops fighting the place.',
  array['jingmai', 'logistics', 'slow_travel', 'pacing']::text[],
  '{"avoid":"Treating Jingmai as a one-night checklist stop.","detail_type":"route_design_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:experience:tea-tasting-as-conversation-not-performance',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'experience',
  'Tea tasting as conversation, not performance',
  'A strong Jingmai tea session should connect leaf, age, forest, family practice, water, storage, taste, and hospitality. Foreign travelers need patient interpretation so tasting becomes cultural understanding rather than a confusing sequence of cups.',
  array['jingmai', 'tea', 'tasting', 'hospitality']::text[],
  '{"concierge_use":"Use when guests ask what they actually do in Jingmai.","detail_type":"tea_context"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:market_profile:jingmai-for-high-aesthetic-retreat-travelers',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai for high-aesthetic retreat travelers',
  'Jingmai fits travelers who want mist, texture, quiet, village time, tea, and a reflective break from urban China. It should not be sold as generic wellness; its retreat quality comes from real landscape and tea culture.',
  array['jingmai', 'retreat', 'wellness_adjacent', 'aesthetic_travel']::text[],
  '{"market_fit":["slow travelers","photographers","tea travelers","repeat China visitors"],"detail_type":"audience_angle"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:route_seed:jingmai-and-jingdezhen-as-tea-and-porcelain-journey',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai and Jingdezhen as tea-and-porcelain journey',
  'Pairing Jingmai with Jingdezhen creates a refined material culture route: tea forests, cups, clay, glaze, ritual, and the objects used to host people. It is a strong alternative to conventional city sightseeing.',
  array['jingmai', 'jingdezhen', 'tea', 'porcelain', 'material_culture']::text[],
  '{"duration":"7 days","detail_type":"route_pairing"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:source_note:why-book-a-jingmai-tea-host',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Why book a Jingmai tea host',
  'Without a host, Jingmai can feel beautiful but opaque. A good tea host explains village etiquette, tea choices, forest context, tasting language, and pacing, making the slow journey feel intentional.',
  array['jingmai', 'expert', 'tea_host', 'conversion']::text[],
  '{"cta":"Offer hosted tea forest days rather than generic sightseeing.","detail_type":"conversion_hook"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:experience:taoist-mountain-as-spatial-philosophy',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'experience',
  'Taoist mountain as spatial philosophy',
  'Wudang''s temples, paths, peaks, gates, courtyards, clouds, and ascent should be read as a philosophical landscape. The experience is strongest when architecture and movement are connected to Taoist ideas of balance, stillness, and cultivation.',
  array['wudang', 'taoism', 'sacred_mountain', 'architecture']::text[],
  '{"why_it_matters":"Prevents Wudang from becoming generic mountain scenery.","detail_type":"experience_cluster"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:experience:taiji-introduction-for-travelers-not-training-camp',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'experience',
  'Taiji introduction for travelers, not training camp',
  'A short Taiji session works best as embodied interpretation: posture, breath, weight shift, attention, and the idea of internal practice. Most visitors need a meaningful introduction, not an unrealistic martial arts promise.',
  array['wudang', 'taiji', 'body_practice', 'taoist_culture']::text[],
  '{"best_for":["wellness-adjacent travelers","philosophy travelers","families"],"detail_type":"hands_on_experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:route_seed:wudang-should-start-early',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang should start early',
  'Early light, quieter paths, thinner crowds, mountain air, and temple atmosphere are central to Wudang. A route that begins late loses much of the sacred-mountain feeling.',
  array['wudang', 'early_morning', 'pacing', 'mountain_route']::text[],
  '{"avoid":"Late-start checklist touring.","detail_type":"route_design_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:market_profile:wudang-for-philosophy-and-practice-travelers',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang for philosophy and practice travelers',
  'Wudang is especially strong for visitors who want culture through body and mind: Taoism, Taiji, breath, mountain walking, architecture, and reflective space. It is not only for martial arts fans.',
  array['wudang', 'philosophy', 'practice', 'reflective_travel']::text[],
  '{"market_fit":["Taoism learners","martial culture travelers","wellness-adjacent guests"],"detail_type":"audience_angle"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:route_seed:wudang-and-beijing-as-ritual-contrast',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang and Beijing as ritual contrast',
  'Beijing and Wudang make a strong contrast: state ritual and imperial order in the capital, then mountain spirituality and internal cultivation in Wudang. This pairing gives travelers two different models of Chinese order.',
  array['wudang', 'beijing', 'route_pairing', 'ritual_contrast']::text[],
  '{"duration":"6-7 days","detail_type":"route_pairing"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:source_note:why-book-a-wudang-practice-interpreter',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Why book a Wudang practice interpreter',
  'A Wudang interpreter adds value by connecting temples, stories, Taoist ideas, Taiji movement, and route pacing. Without that context, visitors may see scenery and performances but miss the internal logic of the place.',
  array['wudang', 'expert', 'taiji', 'conversion']::text[],
  '{"cta":"Offer a Taoist mountain and Taiji primer.","detail_type":"conversion_hook"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-details.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:source_note:beijing-overseas-content-hook',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing overseas content hook',
  'Beijing overseas content should not lead with a generic bucket list. Strong hooks include: how imperial power was staged through the Central Axis, why hutongs make the capital human, how to read ritual space, and why Beijing is the best first chapter for understanding China.',
  array['beijing', 'overseas_growth', 'content_hook', 'seo', 'social']::text[],
  '{"channels":["YouTube Shorts","TikTok","Instagram","Google Search"],"funnel_stage":"inspire","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:source_note:beijing-seo-cluster',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing SEO cluster',
  'Beijing SEO should target decision-stage queries such as refined Beijing itinerary, Beijing culture guide for first timers, Beijing hutong private walk, Central Axis Beijing guide, Beijing with expert guide, and how many days in Beijing for culture travel.',
  array['beijing', 'seo', 'keyword_cluster', 'search_intent']::text[],
  '{"intent":"route planning and expert-led culture travel","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:source_note:beijing-paid-acquisition-angle',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing paid acquisition angle',
  'Paid ads for Beijing should sell a calm first-China orientation: private cultural route, fewer tourist traps, expert interpretation, hutong life, palace order, and a route that prepares the traveler for deeper China cities.',
  array['beijing', 'paid_ads', 'google_ads', 'meta_ads', 'conversion']::text[],
  '{"landing_target":"/chat","cta":"Plan a refined first route into China","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:source_note:chengdu-overseas-content-hook',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu overseas content hook',
  'Chengdu content should lead with pandas and Sichuan food, then deepen into tea houses, parks, social rhythm, market flavors, and the feeling that China can be relaxed and appetite-led rather than overwhelming.',
  array['chengdu', 'overseas_growth', 'content_hook', 'pandas', 'food']::text[],
  '{"channels":["TikTok","Instagram Reels","YouTube Shorts","Pinterest"],"funnel_stage":"inspire","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:source_note:chengdu-seo-cluster',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu SEO cluster',
  'Chengdu SEO should target high-intent queries such as Chengdu panda and food itinerary, Chengdu food guide for foreigners, Chengdu tea house culture, how many days in Chengdu, Chengdu and Chongqing itinerary, and family trip Chengdu pandas.',
  array['chengdu', 'seo', 'keyword_cluster', 'food_travel']::text[],
  '{"intent":"family, food, and soft-landing China travel","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:source_note:chengdu-paid-acquisition-angle',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu paid acquisition angle',
  'Paid ads for Chengdu should combine emotional clarity and comfort: pandas, food without chaos, expert ordering help, tea-house afternoons, and a private route that makes Sichuan easy for families and first-time visitors.',
  array['chengdu', 'paid_ads', 'meta_ads', 'family_travel', 'conversion']::text[],
  '{"landing_target":"/chat","cta":"Design a panda and Sichuan food route","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:source_note:chongqing-overseas-content-hook',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing overseas content hook',
  'Chongqing content should be visual-first: China''s 8D mountain city, cyberpunk-feeling nights, monorails through levels, bridges, river fog, hotpot steam, and why movement through the city is the attraction.',
  array['chongqing', 'overseas_growth', 'content_hook', 'cyberpunk', '8d_city']::text[],
  '{"channels":["TikTok","YouTube Shorts","Instagram Reels"],"funnel_stage":"viral awareness","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:source_note:chongqing-seo-cluster',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing SEO cluster',
  'Chongqing SEO should target visual and itinerary queries such as Chongqing 8D city itinerary, cyberpunk Chongqing guide, Chongqing night view route, Chengdu and Chongqing itinerary, Chongqing hotpot guide for foreigners, and is Chongqing worth visiting.',
  array['chongqing', 'seo', 'keyword_cluster', 'visual_travel']::text[],
  '{"intent":"visual city break and Chengdu pairing","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:source_note:chongqing-paid-acquisition-angle',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing paid acquisition angle',
  'Paid ads for Chongqing should target atmosphere-led travelers with a promise of controlled intensity: the cinematic 8D city without wasting time on random viral stops, with night routing, hotpot, transit moments, and viewpoint sequencing.',
  array['chongqing', 'paid_ads', 'creator_travel', 'night_route', 'conversion']::text[],
  '{"landing_target":"/chat","cta":"Build a cinematic Chongqing route","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:source_note:quanzhou-overseas-content-hook',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou overseas content hook',
  'Quanzhou overseas content should speak to Maritime Silk Road, Hokkien roots, religious coexistence, old-city food, zanhua, Nanyin, incense, tea, and why this city explains China as a connected port civilization.',
  array['quanzhou', 'overseas_growth', 'content_hook', 'maritime_silk_road', 'diaspora']::text[],
  '{"channels":["YouTube","Facebook","Reddit","Google Search"],"funnel_stage":"heritage and depth","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:source_note:quanzhou-seo-cluster',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou SEO cluster',
  'Quanzhou SEO should target queries such as Quanzhou Maritime Silk Road itinerary, Hokkien roots travel, Quanzhou UNESCO guide, Quanzhou vs Xiamen, Quanzhou food for overseas Chinese, and Quanzhou religious heritage.',
  array['quanzhou', 'seo', 'keyword_cluster', 'hokkien', 'unesco']::text[],
  '{"intent":"diaspora roots and UNESCO cultural depth","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:source_note:quanzhou-paid-acquisition-angle',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou paid acquisition angle',
  'Paid ads for Quanzhou should segment by ancestry and curiosity. For Southeast Asian Chinese travelers, sell origin, temple memory, surname, food, and Hokkien culture. For non-diaspora travelers, sell UNESCO port history and religious plurality.',
  array['quanzhou', 'paid_ads', 'diaspora', 'southeast_asia', 'conversion']::text[],
  '{"landing_target":"/chat","cta":"Explore your Hokkien or Maritime Silk Road route","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:source_note:jingdezhen-overseas-content-hook',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen overseas content hook',
  'Jingdezhen content should show hands, clay, kilns, glaze, failure, studios, and the global story of porcelain. The strongest angle is not shopping but how one city shaped taste, trade, collecting, and design across the world.',
  array['jingdezhen', 'overseas_growth', 'content_hook', 'porcelain', 'craft']::text[],
  '{"channels":["Instagram","Pinterest","YouTube","Google Search"],"funnel_stage":"niche high intent","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:source_note:jingdezhen-seo-cluster',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen SEO cluster',
  'Jingdezhen SEO should target queries such as Jingdezhen porcelain itinerary, Jingdezhen ceramics studio visit, Jingdezhen for designers, China porcelain capital travel, Jingdezhen workshop for foreigners, and porcelain culture China trip.',
  array['jingdezhen', 'seo', 'keyword_cluster', 'design_travel']::text[],
  '{"intent":"craft, design, studio access, and collectors","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:source_note:jingdezhen-paid-acquisition-angle',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen paid acquisition angle',
  'Paid ads for Jingdezhen should target designers, collectors, museum audiences, and creative travelers with access language: private studio route, maker conversations, kiln context, and curated porcelain learning instead of generic souvenir shopping.',
  array['jingdezhen', 'paid_ads', 'design_travel', 'craft_access', 'conversion']::text[],
  '{"landing_target":"/chat","cta":"Plan a porcelain and studio access route","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:source_note:jingmai-overseas-content-hook',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai overseas content hook',
  'Jingmai content should be slow and sensory: ancient tea forests, mist, village hospitality, cups, hands, quiet mornings, ecology, and the idea of tea as a landscape rather than a product.',
  array['jingmai', 'overseas_growth', 'content_hook', 'tea', 'slow_travel']::text[],
  '{"channels":["YouTube","Instagram","Pinterest","newsletter"],"funnel_stage":"retreat and slow travel","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:source_note:jingmai-seo-cluster',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai SEO cluster',
  'Jingmai SEO should target queries such as Jingmai tea mountain itinerary, ancient tea forest China, Yunnan tea travel, slow travel China tea village, Jingmai Mountain guide, and China tea culture trip.',
  array['jingmai', 'seo', 'keyword_cluster', 'tea_travel']::text[],
  '{"intent":"tea, slow travel, photography, and retreat","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:source_note:jingmai-paid-acquisition-angle',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai paid acquisition angle',
  'Paid ads for Jingmai should be cautious and high-fit: target tea lovers, slow-luxury travelers, photographers, and repeat China visitors. The promise is hosted tea forest access and quiet, not fast sightseeing.',
  array['jingmai', 'paid_ads', 'slow_luxury', 'tea_host', 'conversion']::text[],
  '{"landing_target":"/chat","cta":"Design a hosted tea forest retreat","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:source_note:wudang-overseas-content-hook',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang overseas content hook',
  'Wudang content should lead with Taoist mountain atmosphere, Taiji, breath, posture, mist, temples, and the difference between real internal practice and kung-fu fantasy. The sell is spiritual weight with cultural specificity.',
  array['wudang', 'overseas_growth', 'content_hook', 'taoism', 'taiji']::text[],
  '{"channels":["YouTube","Instagram","Google Search","wellness newsletters"],"funnel_stage":"meaning and practice","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:source_note:wudang-seo-cluster',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang SEO cluster',
  'Wudang SEO should target queries such as Wudang Mountain Taoist itinerary, Taiji travel China, Wudang for beginners, Taoist mountain China guide, Wudang martial arts culture, and China spiritual travel.',
  array['wudang', 'seo', 'keyword_cluster', 'taiji', 'taoism']::text[],
  '{"intent":"practice, philosophy, and reflective mountain travel","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:source_note:wudang-paid-acquisition-angle',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang paid acquisition angle',
  'Paid ads for Wudang should target wellness-adjacent and martial-culture travelers with grounded claims: Taoist mountain route, short Taiji introduction, breath and posture, temple interpretation, and reflective pacing.',
  array['wudang', 'paid_ads', 'wellness_adjacent', 'taiji', 'conversion']::text[],
  '{"landing_target":"/chat","cta":"Plan a Taoist mountain and Taiji route","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-growth.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:route_seed:beijing-five-day-depth-route',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing five-day depth route',
  'A five-day Beijing route can slow the capital down: one day for the Central Axis and palace order, one for hutongs and courtyard life, one for temples or altars, one for a carefully paced Great Wall day, and one flexible day for museums, food, or contemporary neighborhood texture.',
  array['beijing', '5_day_route', 'depth_route', 'central_axis']::text[],
  '{"duration":"5 days","use_when":"Traveler wants Beijing without checklist pressure.","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:market_profile:who-should-not-over-invest-in-beijing',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Who should not over-invest in Beijing',
  'Travelers who mainly want craft studios, soft landscapes, tropical ease, or food-led social travel may need only a short Beijing prologue before moving to Jingdezhen, Jingmai, Chengdu, or Quanzhou.',
  array['beijing', 'audience_filter', 'route_design', 'not_best_for']::text[],
  '{"concierge_use":"Use to redirect guests toward better-fit cities without dismissing Beijing.","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:experience:beijing-winter-can-sharpen-the-capital-story',
  'beijing',
  'Beijing',
  'en',
  'experience',
  'Beijing winter can sharpen the capital story',
  'Cold weather can make Beijing''s northern identity clearer: heavy food, bare trees, grey walls, palace scale, hot tea, and quiet courtyards. It is not automatically a bad season if the traveler accepts atmosphere over comfort.',
  array['beijing', 'seasonality', 'winter', 'atmosphere']::text[],
  '{"season":"winter","positioning":"Austere, architectural, atmospheric.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:source_note:beijing-expert-matching-should-ask-about-history-tolerance',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing expert matching should ask about history tolerance',
  'Before matching a Beijing expert, ask whether the traveler wants deep historical interpretation, architecture and urban planning, food and neighborhoods, or a lighter family-friendly version. Beijing can become too lecture-heavy if this is not calibrated.',
  array['beijing', 'expert_matching', 'lead_question', 'personalization']::text[],
  '{"lead_question":"Do you prefer deep historical context or a lighter neighborhood-led route?","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:traveler_faq:should-i-do-beijing-if-i-have-already-visited-china',
  'beijing',
  'Beijing',
  'en',
  'traveler_faq',
  'Should I do Beijing if I have already visited China?',
  'Yes, if you have only seen Beijing as a checklist. A repeat route can focus on hutongs, temples, altar culture, food neighborhoods, architecture, and the contrast between state order and everyday life.',
  array['beijing', 'repeat_visitor', 'faq', 'route_redesign']::text[],
  '{"answer_style":"Encourage a deeper second reading, not repeated sightseeing.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:route_seed:chengdu-five-day-food-and-leisure-route',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu five-day food and leisure route',
  'A five-day Chengdu route can balance pandas, food markets, tea houses, Sichuan opera, a cooking or flavor session, neighborhood walks, and one countryside or craft extension. The extra days should deepen rhythm rather than add random attractions.',
  array['chengdu', '5_day_route', 'food', 'pandas', 'slow_city']::text[],
  '{"duration":"5 days","use_when":"Traveler wants Chengdu as a soft base, not a quick stop.","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:market_profile:who-should-not-make-chengdu-the-main-city',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Who should not make Chengdu the main city',
  'Travelers who want monumental history, dramatic urban visuals, or UNESCO port memory may find Chengdu too soft as the main anchor. It can still work as a comfort city when paired with Beijing, Chongqing, Quanzhou, or Wudang.',
  array['chengdu', 'audience_filter', 'not_best_for', 'route_pairing']::text[],
  '{"concierge_use":"Use when guest asks for the most historically intense city.","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:experience:rainy-chengdu-can-support-the-tea-house-mood',
  'chengdu',
  'Chengdu',
  'en',
  'experience',
  'Rainy Chengdu can support the tea-house mood',
  'Light rain does not necessarily weaken Chengdu. It can make tea houses, covered food streets, hotpot, parks, and slow afternoons feel more natural. The route should lean into indoor flavor and local rhythm.',
  array['chengdu', 'seasonality', 'rain', 'tea_house', 'food']::text[],
  '{"season":"rainy days","positioning":"Cozy, social, appetite-led.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:source_note:chengdu-expert-matching-should-ask-about-spice-and-animals',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu expert matching should ask about spice and animals',
  'Before matching a Chengdu expert, ask about spice tolerance, panda priority, interest in markets, willingness to eat communally, and whether the traveler wants a family-friendly or food-nerd version.',
  array['chengdu', 'expert_matching', 'lead_question', 'food_planning']::text[],
  '{"lead_question":"How spicy can your group eat, and how important are pandas compared with food?","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:traveler_faq:can-chengdu-work-for-travelers-who-do-not-eat-spicy-food',
  'chengdu',
  'Chengdu',
  'en',
  'traveler_faq',
  'Can Chengdu work for travelers who do not eat spicy food?',
  'Yes, if the route is curated carefully. Chengdu has many textures beyond extreme heat: noodles, snacks, broths, dumplings, tea, sweets, mild dishes, and controlled hotpot ordering.',
  array['chengdu', 'faq', 'spice_tolerance', 'food']::text[],
  '{"answer_style":"Reassure without pretending spice is irrelevant.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:route_seed:chongqing-three-night-visual-route',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing three-night visual route',
  'Chongqing is stronger with at least two nights, ideally three. This allows one orientation night, one intense 8D route with hotpot, and one slower river or neighborhood evening so the city does not collapse into a viral-photo sprint.',
  array['chongqing', '3_night_route', 'night_city', '8d_city']::text[],
  '{"duration":"3 nights","use_when":"Traveler is interested in photography, food, or atmosphere.","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:market_profile:who-may-struggle-with-chongqing',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Who may struggle with Chongqing',
  'Travelers who dislike stairs, crowds, humidity, late nights, confusing navigation, or intense food may struggle with Chongqing. The concierge should either soften the route or suggest Chengdu as the main Sichuan Basin base.',
  array['chongqing', 'audience_filter', 'mobility', 'not_best_for']::text[],
  '{"lead_question":"Are stairs, crowds, and late-night city walks comfortable for you?","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:experience:fog-and-humidity-strengthen-chongqing-s-cinematic-identity',
  'chongqing',
  'Chongqing',
  'en',
  'experience',
  'Fog and humidity strengthen Chongqing''s cinematic identity',
  'Chongqing does not need clear skies to work. Fog, humidity, reflections, neon blur, and river haze can make the city feel more cinematic, especially for night walks and photography.',
  array['chongqing', 'seasonality', 'fog', 'humidity', 'photography']::text[],
  '{"season":"foggy or humid days","positioning":"Cinematic rather than postcard-clear.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:source_note:chongqing-expert-matching-should-ask-about-visual-appetite',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing expert matching should ask about visual appetite',
  'Before matching a Chongqing expert, ask whether the traveler wants viral viewpoints, local stair neighborhoods, transit experiences, hotpot, photography timing, or a softer river-focused version.',
  array['chongqing', 'expert_matching', 'lead_question', 'visual_travel']::text[],
  '{"lead_question":"Do you want the most cinematic version, or a less intense introduction to Chongqing?","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:traveler_faq:is-chongqing-worth-it-if-i-do-not-care-about-museums',
  'chongqing',
  'Chongqing',
  'en',
  'traveler_faq',
  'Is Chongqing worth it if I do not care about museums?',
  'Yes. Chongqing''s value is experiential rather than museum-led: moving through stacked levels, eating hotpot, crossing rivers, watching neon and fog, and feeling a city shaped by mountains.',
  array['chongqing', 'faq', 'urban_experience', 'not_museum_led']::text[],
  '{"answer_style":"Position as atmosphere-led urban travel.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:route_seed:quanzhou-five-day-diaspora-and-craft-route',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou five-day diaspora and craft route',
  'A five-day Quanzhou route can move from old-city port memory and religious plurality into Hokkien roots, food, zanhua, Nanyin, incense, tea, or Dehua porcelain. The added time lets the city become personal rather than only historical.',
  array['quanzhou', '5_day_route', 'diaspora', 'craft', 'maritime_silk_road']::text[],
  '{"duration":"5 days","use_when":"Traveler has Hokkien roots or strong heritage interest.","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:market_profile:who-may-not-understand-quanzhou-immediately',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Who may not understand Quanzhou immediately',
  'Travelers looking for spectacle, luxury shopping, resort beaches, or obvious skyline drama may not understand Quanzhou at first. It needs storytelling, walking, food, family memory, and religious context to reveal its value.',
  array['quanzhou', 'audience_filter', 'not_best_for', 'interpretation_needed']::text[],
  '{"concierge_use":"Use when redirecting spectacle-led travelers to Chongqing or Beijing.","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:experience:quanzhou-evenings-should-be-intimate-not-spectacular',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Quanzhou evenings should be intimate, not spectacular',
  'Quanzhou''s evening value is old streets, food stalls, temple-adjacent atmosphere, conversation, Nanyin, and slow walking. It should not be judged by skyline spectacle.',
  array['quanzhou', 'evening', 'old_city', 'food', 'nanyin']::text[],
  '{"positioning":"Intimate evening culture.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:source_note:quanzhou-expert-matching-should-ask-about-ancestry',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou expert matching should ask about ancestry',
  'Before matching a Quanzhou expert, ask whether the traveler has Hokkien, Minnan, Filipino Chinese, Malaysian Chinese, Singaporean Chinese, Indonesian Chinese, or broader Maritime Silk Road interests.',
  array['quanzhou', 'expert_matching', 'lead_question', 'diaspora']::text[],
  '{"lead_question":"Do you have any family, surname, dialect, temple, or food memory connected to Fujian or Hokkien culture?","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:traveler_faq:is-quanzhou-better-than-xiamen-for-cultural-depth',
  'quanzhou',
  'Quanzhou',
  'en',
  'traveler_faq',
  'Is Quanzhou better than Xiamen for cultural depth?',
  'For many culture-led travelers, yes. Xiamen is easier and more polished, while Quanzhou is deeper for Maritime Silk Road history, religious coexistence, Minnan food, Hokkien roots, and old-city texture.',
  array['quanzhou', 'faq', 'xiamen_comparison', 'cultural_depth']::text[],
  '{"answer_style":"Differentiate without dismissing Xiamen.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:route_seed:jingdezhen-five-day-studio-immersion',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen five-day studio immersion',
  'A five-day Jingdezhen route can support historical kilns, museums, studio visits, a hands-on session, maker conversations, market time, and one quiet day for collecting or reflection. The fifth day matters because craft learning needs digestion.',
  array['jingdezhen', '5_day_route', 'studio_immersion', 'porcelain']::text[],
  '{"duration":"5 days","use_when":"Traveler is a designer, collector, artist, or serious craft guest.","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:market_profile:who-may-not-need-jingdezhen',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Who may not need Jingdezhen',
  'Travelers with no interest in objects, craft process, design, museums, or hands-on learning may not need Jingdezhen on a first China trip. The city is strongest when the traveler wants to understand how things are made.',
  array['jingdezhen', 'audience_filter', 'not_best_for', 'craft_travel']::text[],
  '{"concierge_use":"Use to prevent weak-fit itinerary padding.","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:experience:rain-can-support-jingdezhen-s-studio-rhythm',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Rain can support Jingdezhen''s studio rhythm',
  'Rainy weather does not ruin Jingdezhen if the route is studio-led. Workshops, kilns, museums, markets, and quiet object handling can make rainy days feel focused and intimate.',
  array['jingdezhen', 'seasonality', 'rain', 'studio_visit', 'craft']::text[],
  '{"season":"rainy days","positioning":"Indoor craft depth.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:source_note:jingdezhen-expert-matching-should-ask-about-craft-seriousness',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen expert matching should ask about craft seriousness',
  'Before matching a Jingdezhen expert, ask whether the traveler wants casual making, serious studio access, collecting advice, design history, academic context, or family-friendly craft exposure.',
  array['jingdezhen', 'expert_matching', 'lead_question', 'craft']::text[],
  '{"lead_question":"Are you looking for a light hands-on experience or serious studio and collecting access?","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:traveler_faq:is-jingdezhen-too-niche-for-a-first-china-trip',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'traveler_faq',
  'Is Jingdezhen too niche for a first China trip?',
  'It depends on the traveler. For craft, design, art, and museum audiences, Jingdezhen can be a highlight. For general first-timers, it works better after Beijing or Shanghai has provided broader context.',
  array['jingdezhen', 'faq', 'first_time_china', 'niche_destination']::text[],
  '{"answer_style":"Qualify by interest rather than saying yes or no.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:route_seed:jingmai-four-day-slow-tea-retreat',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai four-day slow tea retreat',
  'A four-day Jingmai route gives enough time for arrival, tea forest walking, hosted tastings, village meals, weather watching, and one unstructured day. Without unstructured time, Jingmai becomes weaker.',
  array['jingmai', '4_day_route', 'tea_retreat', 'slow_travel']::text[],
  '{"duration":"4 days","use_when":"Traveler wants tea, quiet, photography, or decompression.","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:market_profile:who-should-not-choose-jingmai',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Who should not choose Jingmai',
  'Travelers who want nightlife, luxury shopping, fast transfers, dense sightseeing, or guaranteed comfort may not be right for Jingmai. The destination asks for patience and acceptance of slower logistics.',
  array['jingmai', 'audience_filter', 'not_best_for', 'slow_travel']::text[],
  '{"concierge_use":"Use to filter before proposing remote Yunnan routing.","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:experience:jingmai-is-strongest-when-nothing-happens-quickly',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'experience',
  'Jingmai is strongest when nothing happens quickly',
  'The itinerary should make room for tea cooling, clouds moving, village sound, walking slowly, and conversations that do not fit a strict schedule. This is not inefficiency; it is the product.',
  array['jingmai', 'slow_travel', 'tea', 'village_life', 'pacing']::text[],
  '{"positioning":"Slowness as value.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:source_note:jingmai-expert-matching-should-ask-about-comfort-tradeoffs',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai expert matching should ask about comfort tradeoffs',
  'Before matching a Jingmai host, ask whether the traveler accepts mountain roads, simpler evenings, weather variability, limited nightlife, and a slower lodge or village rhythm.',
  array['jingmai', 'expert_matching', 'lead_question', 'comfort_filter']::text[],
  '{"lead_question":"Are you comfortable trading convenience for tea forest atmosphere and quiet?","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:traveler_faq:is-jingmai-only-for-tea-experts',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'traveler_faq',
  'Is Jingmai only for tea experts?',
  'No. Tea experts will appreciate it deeply, but non-experts can enjoy the landscape, village hospitality, forest walks, quiet mornings, and the way tea structures daily life.',
  array['jingmai', 'faq', 'tea_beginner', 'slow_travel']::text[],
  '{"answer_style":"Open the destination to non-specialists without diluting tea identity.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:route_seed:wudang-four-day-practice-and-mountain-route',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang four-day practice and mountain route',
  'A four-day Wudang route can include early temple movement, mountain paths, Taoist architectural context, one or two short practice sessions, and a slower final day for reflection. The extra day prevents the route from feeling like a scenic bus circuit.',
  array['wudang', '4_day_route', 'taoism', 'taiji', 'mountain']::text[],
  '{"duration":"4 days","use_when":"Traveler wants philosophy, practice, and mountain atmosphere.","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:market_profile:who-may-not-fit-wudang',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Who may not fit Wudang',
  'Travelers who want nightlife, shopping, food variety, or fast spectacle may not fit Wudang. It is best for people willing to walk, wake early, listen, practice gently, and accept quiet.',
  array['wudang', 'audience_filter', 'not_best_for', 'reflective_travel']::text[],
  '{"concierge_use":"Use to filter entertainment-led travelers.","detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:experience:clouds-and-imperfect-visibility-can-help-wudang',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'experience',
  'Clouds and imperfect visibility can help Wudang',
  'Wudang does not depend only on clear views. Clouds, mist, wet stone, temple roofs, and quiet paths can strengthen the sacred mountain mood if the itinerary is paced slowly.',
  array['wudang', 'seasonality', 'mist', 'sacred_mountain', 'atmosphere']::text[],
  '{"season":"misty days","positioning":"Atmospheric and reflective.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:source_note:wudang-expert-matching-should-ask-about-body-comfort',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang expert matching should ask about body comfort',
  'Before matching a Wudang expert, ask about stairs, knees, early starts, interest in Taiji, openness to philosophy, and whether the traveler wants real practice or mainly atmosphere.',
  array['wudang', 'expert_matching', 'lead_question', 'mobility']::text[],
  '{"lead_question":"Are stairs and early starts comfortable, and do you want a real Taiji introduction or mainly cultural atmosphere?","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:traveler_faq:can-wudang-work-without-martial-arts-training',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'traveler_faq',
  'Can Wudang work without martial arts training?',
  'Yes. Wudang can work as Taoist culture, architecture, mountain walking, breath, quiet, and philosophy. A short Taiji introduction can add meaning without making the trip a training camp.',
  array['wudang', 'faq', 'taiji_beginner', 'taoist_culture']::text[],
  '{"answer_style":"Make Wudang accessible while preserving cultural depth.","detail_type":"traveler_faq"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-planning.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:route_seed:beijing-72-hour-cultural-starter',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing 72-hour cultural starter',
  'A strong 72-hour Beijing route should avoid racing through every famous site. Day one can establish hutong texture and a calm northern meal; day two can focus on the Central Axis and palace order; day three can use the Great Wall or altar architecture to explain defense, ritual, and landscape.',
  array['beijing', '3_day_route', 'first_time_china', 'pacing']::text[],
  '{"duration":"3 days","best_for":["first-time visitors","culture-led couples"],"detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:attraction:temple-and-altar-culture-beyond-the-palace',
  'beijing',
  'Beijing',
  'en',
  'attraction',
  'Temple and altar culture beyond the palace',
  'Beijing''s altar and temple sites help foreign travelers understand state ritual, seasonal sacrifice, cosmology, and the relationship between imperial authority and the heavens. These places can make the capital feel intellectually richer than a palace-only route.',
  array['beijing', 'temples', 'altars', 'ritual', 'imperial_history']::text[],
  '{"why_it_matters":"Adds ritual grammar to the city narrative.","detail_type":"attraction"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:experience:a-courtyard-meal-as-soft-conversion-moment',
  'beijing',
  'Beijing',
  'en',
  'experience',
  'A courtyard meal as soft conversion moment',
  'A private or semi-private courtyard meal can turn Beijing from monumental to personal. It gives the concierge a natural moment to discuss family travel style, pace, onward cities, and whether the traveler wants expert-led interpretation.',
  array['beijing', 'courtyard', 'meal', 'conversion', 'private_experience']::text[],
  '{"cta":"Use after a hutong or Central Axis walk.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:transport:beijing-is-logistically-large-and-should-be-clustered',
  'beijing',
  'Beijing',
  'en',
  'transport',
  'Beijing is logistically large and should be clustered',
  'Beijing distances are often underestimated. A premium route should cluster sites by district and avoid cross-city zigzags. The itinerary should protect energy for interpretation rather than spending the day in traffic.',
  array['beijing', 'transport', 'logistics', 'route_design']::text[],
  '{"planning_rule":"Cluster by axis, hutong zone, museum zone, or Wall day.","detail_type":"transport"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:market_profile:beijing-is-the-strongest-city-for-china-beginners',
  'beijing',
  'Beijing',
  'en',
  'market_profile',
  'Beijing is the strongest city for China beginners',
  'For travelers who need a first framework for China, Beijing is the clearest opening city. It explains dynastic power, modern state space, urban scale, food, and neighborhood life before the trip moves into more specialized destinations.',
  array['beijing', 'market_profile', 'first_time_china', 'trip_start']::text[],
  '{"market_fit":["North America","Europe","Australia","first-time Asia travelers"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:source_note:beijing-content-should-not-sound-like-a-top-10-list',
  'beijing',
  'Beijing',
  'en',
  'source_note',
  'Beijing content should not sound like a Top 10 list',
  'Avoid generic phrasing such as must-see highlights and top attractions. Beijing''s premium content should speak in terms of order, ritual, axis, courtyard, power, neighborhood, and contrast.',
  array['beijing', 'editorial_rule', 'avoid_generic', 'brand_voice']::text[],
  '{"editorial_use":"Tone guardrail for site and concierge copy.","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'beijing:route_seed:beijing-as-gateway-to-wudang-or-jingdezhen',
  'beijing',
  'Beijing',
  'en',
  'route_seed',
  'Beijing as gateway to Wudang or Jingdezhen',
  'Beijing pairs well with Wudang for state ritual versus mountain Taoism, or with Jingdezhen for power, taste, and object culture. The pairing should be framed as a shift from capital order to embodied or material culture.',
  array['beijing', 'wudang', 'jingdezhen', 'route_pairing']::text[],
  '{"duration":"6-7 days","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:route_seed:chengdu-72-hour-food-and-panda-route',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu 72-hour food and panda route',
  'A strong short Chengdu route should place pandas early in the morning, then move into snacks, a tea-house pause, Sichuan opera or evening flavor, and one serious hotpot or regional meal. The route should feel generous, not over-packed.',
  array['chengdu', '3_day_route', 'pandas', 'food', 'tea_house']::text[],
  '{"duration":"3 days","best_for":["families","food-first travelers"],"detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:experience:market-led-flavor-walk',
  'chengdu',
  'Chengdu',
  'en',
  'experience',
  'Market-led flavor walk',
  'A Chengdu market walk can explain Sichuan through ingredients before the traveler reaches the restaurant table: pickles, chilies, peppercorns, noodles, greens, tofu, preserved goods, and breakfast rhythms make the cuisine easier to understand.',
  array['chengdu', 'market', 'food_walk', 'sichuan_food']::text[],
  '{"why_it_matters":"Moves food content beyond dish names.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:food:heat-level-should-be-curated-not-avoided',
  'chengdu',
  'Chengdu',
  'en',
  'food',
  'Heat level should be curated, not avoided',
  'Foreign travelers often worry that Sichuan food will be too spicy. The concierge should explain that heat can be managed by dish selection, broth choice, ordering strategy, and balancing snacks, noodles, vegetables, and tea.',
  array['chengdu', 'spice_level', 'food_planning', 'comfort']::text[],
  '{"concierge_use":"Useful for cautious eaters.","detail_type":"food"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:transport:chengdu-is-easier-when-meals-anchor-the-map',
  'chengdu',
  'Chengdu',
  'en',
  'transport',
  'Chengdu is easier when meals anchor the map',
  'Instead of planning Chengdu only by attractions, use meals and tea pauses as anchors. This avoids inefficient cross-city movement and makes the day feel aligned with the city''s appetite-led rhythm.',
  array['chengdu', 'transport', 'meal_anchoring', 'route_design']::text[],
  '{"planning_rule":"Anchor each half-day around food neighborhood plus one cultural stop.","detail_type":"transport"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:market_profile:chengdu-converts-families-better-than-most-culture-cities',
  'chengdu',
  'Chengdu',
  'en',
  'market_profile',
  'Chengdu converts families better than most culture cities',
  'Chengdu works well for family conversion because pandas create immediate child-friendly desire while food, parks, opera, and teahouses keep adults engaged. It can be positioned as the softest major-city landing in the portfolio.',
  array['chengdu', 'families', 'market_profile', 'conversion']::text[],
  '{"market_fit":["families","couples","first-time China travelers"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:source_note:chengdu-copy-should-not-stop-at-spicy-and-cute',
  'chengdu',
  'Chengdu',
  'en',
  'source_note',
  'Chengdu copy should not stop at spicy and cute',
  'Pandas and spice are powerful hooks, but the content should quickly deepen into ease, tea-house society, market flavor, and Sichuan confidence. Otherwise the city sounds shallow.',
  array['chengdu', 'editorial_rule', 'avoid_generic', 'brand_voice']::text[],
  '{"editorial_use":"Tone guardrail for homepage cards, destination page, and chat.","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chengdu:route_seed:chengdu-before-chongqing',
  'chengdu',
  'Chengdu',
  'en',
  'route_seed',
  'Chengdu before Chongqing',
  'Chengdu should usually come before Chongqing when pairing the two. Chengdu softens the traveler into Sichuan through pandas, food, and tea, while Chongqing then raises intensity through vertical geography, nightscape, and hotpot heat.',
  array['chengdu', 'chongqing', 'route_pairing', 'sichuan_basin']::text[],
  '{"duration":"5-6 days","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:route_seed:chongqing-48-hour-visual-impact-route',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing 48-hour visual impact route',
  'A compact Chongqing route should be built around vertical movement, river crossings, old stairs, monorail moments, night views, and a hotpot meal. The goal is not completeness; it is to make the traveler feel the 8D city physically.',
  array['chongqing', '2_day_route', '8d_city', 'night_route']::text[],
  '{"duration":"2 days","best_for":["photographers","urban explorers"],"detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:experience:transit-as-cinematic-experience',
  'chongqing',
  'Chongqing',
  'en',
  'experience',
  'Transit as cinematic experience',
  'In Chongqing, transit can be part of the cultural route. Monorails, escalators, bridges, ferries, and layered pedestrian paths show how daily life adapts to mountains and rivers.',
  array['chongqing', 'transit', 'monorail', 'urban_life', '8d_city']::text[],
  '{"why_it_matters":"Turns logistics into destination identity.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:food:hotpot-should-be-placed-after-physical-city-immersion',
  'chongqing',
  'Chongqing',
  'en',
  'food',
  'Hotpot should be placed after physical city immersion',
  'Chongqing hotpot works best after the traveler has already felt the city''s stairs, bridges, humidity, and density. Then the meal feels like an extension of the urban temperament rather than an isolated dinner.',
  array['chongqing', 'hotpot', 'route_sequence', 'food']::text[],
  '{"planning_rule":"Put hotpot after a vertical walk or river-night route.","detail_type":"food"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:transport:navigation-difficulty-is-part-of-chongqing-s-value',
  'chongqing',
  'Chongqing',
  'en',
  'transport',
  'Navigation difficulty is part of Chongqing''s value',
  'Chongqing can confuse visitors because ground level is not always obvious. The concierge should acknowledge this and sell curated routing as a way to enjoy the complexity without losing time.',
  array['chongqing', 'transport', 'navigation', '8d_city']::text[],
  '{"conversion_use":"Explains why a self-guided viral map may fail.","detail_type":"transport"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:market_profile:chongqing-is-strongest-for-atmosphere-led-travelers',
  'chongqing',
  'Chongqing',
  'en',
  'market_profile',
  'Chongqing is strongest for atmosphere-led travelers',
  'Chongqing is not the easiest city for museum-first travelers, but it is excellent for people who choose places by atmosphere: neon, fog, levels, food, noise, rivers, and cinematic urban pressure.',
  array['chongqing', 'market_profile', 'photography', 'urban_travel']::text[],
  '{"market_fit":["younger premium travelers","photographers","repeat China visitors"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:source_note:chongqing-content-should-avoid-viral-only-framing',
  'chongqing',
  'Chongqing',
  'en',
  'source_note',
  'Chongqing content should avoid viral-only framing',
  'The city should not be sold as a collection of internet photo spots. The stronger editorial frame is lived vertical geography, night movement, river scale, appetite, and controlled disorientation.',
  array['chongqing', 'editorial_rule', 'avoid_generic', 'brand_voice']::text[],
  '{"editorial_use":"Tone guardrail for destination and concierge copy.","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'chongqing:route_seed:chongqing-as-final-energy-city-after-chengdu',
  'chongqing',
  'Chongqing',
  'en',
  'route_seed',
  'Chongqing as final-energy city after Chengdu',
  'When paired with Chengdu, Chongqing should usually be the higher-energy finish. The contrast lets the traveler feel Sichuan Basin softness first, then the harder, hotter, more cinematic mountain city.',
  array['chongqing', 'chengdu', 'route_pairing', 'contrast']::text[],
  '{"duration":"5-6 days","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:route_seed:quanzhou-3-day-maritime-silk-road-route',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou 3-day Maritime Silk Road route',
  'A three-day Quanzhou route should combine old-city walking, religious plurality, port memory, food, and one craft or performance experience. The route should help the traveler understand China as connected to Southeast Asia, Arabia, and global trade.',
  array['quanzhou', '3_day_route', 'maritime_silk_road', 'unesco']::text[],
  '{"duration":"3 days","best_for":["UNESCO travelers","Southeast Asian diaspora guests"],"detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:experience:hokkien-roots-consultation',
  'quanzhou',
  'Quanzhou',
  'en',
  'experience',
  'Hokkien roots consultation',
  'For Southeast Asian Chinese travelers, a pre-trip roots consultation can collect surname, ancestral county, family food memories, temple affiliations, dialect terms, and emotional goals before designing a Quanzhou route.',
  array['quanzhou', 'hokkien', 'diaspora', 'roots_travel', 'consultation']::text[],
  '{"cta":"High-value lead capture before expert matching.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:food:minnan-flavors-need-memory-based-explanation',
  'quanzhou',
  'Quanzhou',
  'en',
  'food',
  'Minnan flavors need memory-based explanation',
  'For Hokkien and Southeast Asian travelers, Quanzhou food can trigger recognition. The guide should ask whether certain noodles, broths, seafood, sweets, or temple foods connect to family memory instead of only naming dishes.',
  array['quanzhou', 'minnan_food', 'diaspora', 'memory']::text[],
  '{"market_fit":["Philippines","Malaysia","Singapore","Indonesia"],"detail_type":"food"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:transport:quanzhou-works-best-as-a-slow-old-city-base',
  'quanzhou',
  'Quanzhou',
  'en',
  'transport',
  'Quanzhou works best as a slow old-city base',
  'Quanzhou should not be treated as a quick side trip if the traveler wants depth. The old city rewards walking, repeated food stops, evening atmosphere, and time to connect religious and maritime layers.',
  array['quanzhou', 'transport', 'old_city', 'pacing']::text[],
  '{"planning_rule":"Use a central base and avoid too many same-day extensions.","detail_type":"transport"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:market_profile:quanzhou-is-the-portfolio-s-strongest-diaspora-city',
  'quanzhou',
  'Quanzhou',
  'en',
  'market_profile',
  'Quanzhou is the portfolio''s strongest diaspora city',
  'Among the current destinations, Quanzhou has the clearest emotional bridge to Southeast Asian Chinese travelers. Its strongest sell is not visual spectacle but origin, worship, surnames, food, maritime memory, and cultural continuity.',
  array['quanzhou', 'market_profile', 'diaspora', 'southeast_asia']::text[],
  '{"priority_markets":["Philippines","Malaysia","Singapore","Indonesia","Thailand"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:source_note:quanzhou-content-should-not-sound-like-xiamen',
  'quanzhou',
  'Quanzhou',
  'en',
  'source_note',
  'Quanzhou content should not sound like Xiamen',
  'Do not sell Quanzhou as a pleasant coastal leisure city. Its premium identity is deeper and more specific: Maritime Silk Road, plural religion, Minnan/Hokkien memory, food, craft, and old-city ritual.',
  array['quanzhou', 'editorial_rule', 'avoid_generic', 'brand_voice']::text[],
  '{"editorial_use":"Differentiation guardrail.","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'quanzhou:route_seed:quanzhou-with-jingdezhen-as-craft-and-port-china',
  'quanzhou',
  'Quanzhou',
  'en',
  'route_seed',
  'Quanzhou with Jingdezhen as craft-and-port China',
  'Quanzhou and Jingdezhen can form a sophisticated route about trade, objects, craft, and global memory: port exchange and religious plurality in Quanzhou, then porcelain material culture in Jingdezhen.',
  array['quanzhou', 'jingdezhen', 'route_pairing', 'craft', 'trade']::text[],
  '{"duration":"6-7 days","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:route_seed:jingdezhen-3-day-maker-route',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen 3-day maker route',
  'A three-day Jingdezhen route should move from historical context to working studios, then to hands-on process and curated collecting. The traveler should understand clay, kiln, glaze, labor, taste, and global porcelain memory.',
  array['jingdezhen', '3_day_route', 'porcelain', 'maker_route']::text[],
  '{"duration":"3 days","best_for":["design travelers","collectors","creative professionals"],"detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:experience:kiln-risk-makes-porcelain-emotionally-legible',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'experience',
  'Kiln risk makes porcelain emotionally legible',
  'Foreign travelers often understand porcelain better when they learn that firing involves risk, timing, temperature, chemistry, and loss. This turns a beautiful object into a story of skill and uncertainty.',
  array['jingdezhen', 'kiln', 'craft', 'porcelain_process']::text[],
  '{"why_it_matters":"Adds emotional and technical depth to craft interpretation.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:food:food-should-support-studio-pacing-in-jingdezhen',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'food',
  'Food should support studio pacing in Jingdezhen',
  'Jingdezhen food is not the main international hook, so meals should be planned to support craft days: local comfort, maker hangouts, market texture, and enough rest between studio visits.',
  array['jingdezhen', 'food', 'studio_pacing', 'local_life']::text[],
  '{"planning_rule":"Do not make food carry the whole destination story.","detail_type":"food"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:transport:jingdezhen-routes-need-appointment-logic',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'transport',
  'Jingdezhen routes need appointment logic',
  'The best Jingdezhen experiences often depend on studio availability, maker schedules, kiln timing, and market days. The concierge should treat appointments as core route infrastructure, not optional extras.',
  array['jingdezhen', 'transport', 'appointments', 'studios']::text[],
  '{"conversion_use":"Explains why expert coordination matters.","detail_type":"transport"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:market_profile:jingdezhen-attracts-high-intent-niche-travelers',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'market_profile',
  'Jingdezhen attracts high-intent niche travelers',
  'Jingdezhen may not have the broadest mass-market pull, but it has high conversion potential among designers, collectors, artists, museum audiences, architecture travelers, and education groups.',
  array['jingdezhen', 'market_profile', 'design_travel', 'collector_travel']::text[],
  '{"market_fit":["Europe","North America","Japan","Korea","design schools"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:source_note:jingdezhen-content-should-avoid-shopping-first-language',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'source_note',
  'Jingdezhen content should avoid shopping-first language',
  'Shopping can be part of the trip, but the editorial voice should lead with process, makers, kiln history, global porcelain, taste, and material intelligence. Otherwise the city sounds transactional.',
  array['jingdezhen', 'editorial_rule', 'avoid_generic', 'brand_voice']::text[],
  '{"editorial_use":"Guardrail for destination and expert pages.","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingdezhen:route_seed:jingdezhen-as-a-premium-learning-retreat',
  'jingdezhen',
  'Jingdezhen',
  'en',
  'route_seed',
  'Jingdezhen as a premium learning retreat',
  'For creative professionals, Jingdezhen can be positioned as a short learning retreat: studio access, material process, object handling, maker conversation, and enough quiet time to absorb what was seen.',
  array['jingdezhen', 'learning_retreat', 'creative_travel', 'route_seed']::text[],
  '{"duration":"4 days","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:route_seed:jingmai-3-day-tea-forest-stay',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai 3-day tea forest stay',
  'A three-day Jingmai route should be simple: arrive slowly, settle into the village, walk the tea forest, taste with context, watch weather and morning light, and avoid over-planning. Its value comes from reduction.',
  array['jingmai', '3_day_route', 'tea_forest', 'slow_travel']::text[],
  '{"duration":"3 days","best_for":["tea travelers","slow travelers","photographers"],"detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:experience:morning-weather-is-part-of-the-jingmai-product',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'experience',
  'Morning weather is part of the Jingmai product',
  'Mist, humidity, light, birds, village sound, and tea forest texture are not background details in Jingmai. They are part of the experience and should shape the day''s pace.',
  array['jingmai', 'morning', 'weather', 'tea_forest', 'aesthetic_travel']::text[],
  '{"planning_rule":"Protect early mornings rather than filling them with transfers.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:food:meals-in-jingmai-should-feel-hosted',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'food',
  'Meals in Jingmai should feel hosted',
  'Food in Jingmai should be framed through hospitality, village rhythm, tea pairing, local ingredients, and the feeling of being hosted rather than restaurant choice. The meal is part of relationship-building.',
  array['jingmai', 'food', 'hospitality', 'village_life']::text[],
  '{"concierge_use":"Use when explaining why Jingmai differs from city food trips.","detail_type":"food"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:transport:jingmai-needs-buffer-time-for-mountain-roads',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'transport',
  'Jingmai needs buffer time for mountain roads',
  'Travelers should be warned that Jingmai is not a frictionless city extension. Mountain roads, weather, transfers, and slower village pacing require buffer time, but that friction is part of why it feels removed.',
  array['jingmai', 'transport', 'mountain_roads', 'buffer_time']::text[],
  '{"planning_rule":"Do not combine with tight same-day flight commitments.","detail_type":"transport"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:market_profile:jingmai-is-for-repeat-china-visitors-and-slow-luxury-guests',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'market_profile',
  'Jingmai is for repeat China visitors and slow-luxury guests',
  'Jingmai will not convert every traveler, but it can strongly convert people looking for quiet, tea, ecology, village texture, photography, and a feeling of distance from mass tourism.',
  array['jingmai', 'market_profile', 'slow_luxury', 'repeat_china']::text[],
  '{"market_fit":["tea enthusiasts","photographers","wellness-adjacent travelers","repeat visitors"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:source_note:jingmai-content-should-not-become-generic-wellness-copy',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'source_note',
  'Jingmai content should not become generic wellness copy',
  'Avoid vague wellness language. The stronger story is ancient tea forest, village hospitality, ecology, weather, ritual, and the discipline of slowing down.',
  array['jingmai', 'editorial_rule', 'avoid_generic', 'brand_voice']::text[],
  '{"editorial_use":"Guardrail for premium retreat positioning.","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'jingmai-mountain:route_seed:jingmai-as-decompression-after-major-cities',
  'jingmai_mountain',
  'Jingmai Mountain',
  'en',
  'route_seed',
  'Jingmai as decompression after major cities',
  'Jingmai works well after Beijing, Chengdu, or Chongqing because it gives the trip a strong emotional shift from scale and intensity into forest, village, tea, and quiet.',
  array['jingmai', 'route_pairing', 'decompression', 'slow_travel']::text[],
  '{"duration":"6-8 days with a city pairing","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:route_seed:wudang-3-day-taoist-mountain-primer',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang 3-day Taoist mountain primer',
  'A three-day Wudang route should include early temple movement, architectural context, mountain paths, one short Taiji or breath session, and enough silence for the place to feel different from a scenic area.',
  array['wudang', '3_day_route', 'taoism', 'taiji']::text[],
  '{"duration":"3 days","best_for":["philosophy travelers","martial culture travelers","reflective guests"],"detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:experience:breath-and-posture-make-taoism-tangible',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'experience',
  'Breath and posture make Taoism tangible',
  'Foreign travelers may not immediately understand Taoist philosophy through text alone. A short practice session using breath, posture, balance, and slow movement can make the ideas physically understandable.',
  array['wudang', 'taiji', 'breath', 'embodied_learning']::text[],
  '{"why_it_matters":"Turns philosophy into experience.","detail_type":"experience"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:food:wudang-meals-should-support-mountain-rhythm',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'food',
  'Wudang meals should support mountain rhythm',
  'Food in Wudang should be positioned as simple support for practice, walking, early starts, and temple atmosphere. It should not be forced into a major culinary sell.',
  array['wudang', 'food', 'mountain_pacing', 'simplicity']::text[],
  '{"planning_rule":"Let meals support the mountain route rather than dominate it.","detail_type":"food"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:transport:wudang-requires-careful-weather-and-energy-pacing',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'transport',
  'Wudang requires careful weather and energy pacing',
  'Mountain weather, stairs, transfers, and early starts matter in Wudang. The concierge should ask about mobility, energy, and interest in practice before designing the route.',
  array['wudang', 'transport', 'mobility', 'weather', 'pacing']::text[],
  '{"lead_question":"How comfortable are you with stairs, early starts, and mountain walking?","detail_type":"transport"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:market_profile:wudang-appeals-to-meaning-seeking-travelers',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'market_profile',
  'Wudang appeals to meaning-seeking travelers',
  'Wudang is strongest for travelers who want a trip to feel reflective: Taoism, martial culture, mountain architecture, breath, stillness, and embodied practice. It is weaker for visitors who only want spectacle.',
  array['wudang', 'market_profile', 'taoism', 'meaningful_travel']::text[],
  '{"market_fit":["wellness-adjacent travelers","martial arts learners","philosophy readers","repeat China visitors"],"detail_type":"market_profile"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:source_note:wudang-content-should-avoid-kung-fu-fantasy',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'source_note',
  'Wudang content should avoid kung-fu fantasy',
  'Do not overpromise martial arts transformation or performance spectacle. The premium Wudang frame is Taoist landscape, internal practice, architecture, mountain pacing, and philosophical depth.',
  array['wudang', 'editorial_rule', 'avoid_generic', 'brand_voice']::text[],
  '{"editorial_use":"Guardrail for expert and destination pages.","detail_type":"source_note"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
),
(
  'wudang-mountain:route_seed:wudang-as-a-reflective-middle-chapter',
  'wudang_mountain',
  'Wudang Mountain',
  'en',
  'route_seed',
  'Wudang as a reflective middle chapter',
  'Wudang can sit between Beijing and a craft or food city. It gives the route a spiritual middle chapter: from capital order, into mountain cultivation, then onward to material culture or appetite.',
  array['wudang', 'route_pairing', 'beijing', 'jingdezhen', 'chengdu']::text[],
  '{"duration":"7-9 days","detail_type":"route_seed"}'::jsonb,
  'a-deeper-china-redesign/content/rag/destination-knowledge-practical.json',
  null,
  'curated',
  'v1-curated-detail-cards'
)
on conflict (id) do update set
  destination_slug = excluded.destination_slug,
  destination_name = excluded.destination_name,
  language = excluded.language,
  content_type = excluded.content_type,
  title = excluded.title,
  body = excluded.body,
  tags = excluded.tags,
  metadata = excluded.metadata,
  source = excluded.source,
  source_url = excluded.source_url,
  source_confidence = excluded.source_confidence,
  content_version = excluded.content_version,
  updated_at = timezone('utc', now());
