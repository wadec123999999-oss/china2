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
    'jingmai_mountain',
    'Jingmai Mountain',
    'jingmai_mountain',
    '{tea,photography}',
    'Ancient tea forests, village ritual, and one of the quietest ways into China''s mountain culture.',
    'Jingmai works best when it is framed as a tea landscape with human continuity rather than as a scenic mountain stop. The experience comes from ecology, ritual, village texture, and the slower time of tea.',
    '{Ancient tea forests,Village ritual,Mountain stillness}',
    '{slow,immersive}'
  ),
  (
    'wudang_mountain',
    'Wudang Mountain',
    'wudang_mountain',
    '{kung_fu,tcm,calligraphy}',
    'Taoist architecture, mountain paths, and a destination where internal practice matters as much as scenery.',
    'Wudang is strongest when handled as a philosophy-and-practice destination rather than only a mountain landmark. Taoist thought, temple space, bodily discipline, and mountain atmosphere need to be read together.',
    '{Taoist temples,Internal practice,Mountain quiet}',
    '{slow,immersive}'
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
    'jingmai-tea-forest-immersion',
    '3-Day Jingmai Tea Forest Immersion',
    'jingmai_mountain',
    'tea',
    3,
    'A slow route through ancient tea forests, village space, and tasting culture designed for travelers who want quiet, ecology, and tea logic together.',
    '{Ancient tea forest walks,Tea ritual,Village continuity}'
  ),
  (
    'wudang-taoist-mountain-days',
    '3-Day Wudang Taoist Mountain Days',
    'wudang_mountain',
    'kung_fu',
    3,
    'A contemplative route through temple architecture, Taoist rhythm, mountain walking, and light embodied practice rather than pure sightseeing.',
    '{Temple routes,Taoist framing,Internal practice}'
  )
on conflict (slug) do update set
  summary = excluded.summary,
  highlights = excluded.highlights,
  updated_at = timezone('utc', now());

insert into public.profiles (id, role, email, locale, timezone)
values
  ('66666666-6666-6666-6666-666666666666', 'expert', 'rui.he@china-insider.test', 'en', 'Asia/Shanghai'),
  ('77777777-7777-7777-7777-777777777777', 'expert', 'qing.mu@china-insider.test', 'en', 'Asia/Shanghai')
on conflict (id) do nothing;

insert into public.experts (
  id,
  profile_id,
  display_name,
  city,
  categories,
  headline,
  bio_en,
  hourly_rate_cents,
  half_day_rate_cents,
  full_day_rate_cents,
  min_booking_hours,
  languages,
  status,
  stripe_onboarded
)
values
  (
    'ffffffff-ffff-ffff-ffff-ffffffffffff',
    '66666666-6666-6666-6666-666666666666',
    'Rui He',
    'jingmai_mountain',
    '{tea,photography}',
    'Tea landscape interpreter and village-based slow travel guide',
    'Rui helps travelers understand Jingmai through ancient tea forests, village continuity, mountain atmosphere, and the quiet logic of tea practice.',
    17500,
    49000,
    86000,
    3,
    '{english,mandarin}',
    'active',
    false
  ),
  (
    '99999999-9999-9999-9999-999999999999',
    '77777777-7777-7777-7777-777777777777',
    'Qing Mu',
    'wudang_mountain',
    '{kung_fu,tcm,calligraphy}',
    'Taoist culture interpreter and mountain practice guide',
    'Qing frames Wudang through Taoist philosophy, temple architecture, mountain movement, and the reflective side of internal practice.',
    18500,
    51000,
    90000,
    3,
    '{english,mandarin}',
    'active',
    false
  )
on conflict (id) do nothing;

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
  ('beijing', 'bj-imperial-order', 'Imperial Order and Political Space', 'heritage', 'Beijing''s strongest explanation starts with imperial scale, ceremonial order, and how power shaped space.', 'This gives first-time visitors a clear way to understand Beijing beyond famous monuments.', 1),
  ('beijing', 'bj-hutong-life', 'Hutong Life and Neighborhood Texture', 'living_culture', 'The intimate side of Beijing lives in hutong rhythms, courtyards, neighborhood memory, and daily pace.', 'This keeps Beijing from collapsing into a monument-only city.', 2),
  ('beijing', 'bj-literati-practice', 'Calligraphy, Thought, and Cultivated Practice', 'craft', 'Calligraphy and traditional disciplines help explain Beijing as a city of cultivation, learning, and refined repetition.', 'This supports higher-value cultural interpretation and specialist routes.', 3),

  ('jingdezhen', 'jdz-imperial-kilns', 'Imperial Kilns and Porcelain History', 'craft', 'Jingdezhen matters globally because porcelain history here shaped taste, trade, collecting, and making across centuries.', 'This is the clearest top-level reason foreign visitors should care about Jingdezhen.', 1),
  ('jingdezhen', 'jdz-studio-making', 'Studio Making and Contemporary Craft Life', 'craft', 'Jingdezhen is not a frozen museum city; it is still a place of active studios, firings, experiments, and material thinking.', 'This is what turns a visit from passive looking into meaningful cultural immersion.', 2),
  ('jingdezhen', 'jdz-material-culture', 'Material Knowledge and Collecting Culture', 'design', 'Clay, glaze, firing, and collecting logic make Jingdezhen especially strong for design-minded and museum-oriented visitors.', 'This adds premium depth and a stronger willingness-to-pay profile.', 3),

  ('chengdu', 'cd-teahouse-rhythm', 'Tea-House Rhythm and Local Ease', 'living_culture', 'Chengdu''s strongest cultural logic comes from its urban pace: tea, conversation, return visits, and comfort.', 'This is what makes Chengdu different from faster, more agenda-driven Chinese cities.', 1),
  ('chengdu', 'cd-sichuan-flavor', 'Sichuan Flavor and Food Culture', 'food', 'Food in Chengdu is not just a meal list; it is one of the clearest ways to understand daily life, appetite, and place.', 'This is Chengdu''s easiest conversion hook for foreign visitors.', 2),
  ('chengdu', 'cd-city-life', 'Neighborhood Life and Everyday Culture', 'living_culture', 'Markets, streets, parks, and social habits make Chengdu a city best read through lived texture rather than landmarks alone.', 'This prevents the city from becoming only a panda-and-hotpot cliché.', 3),

  ('chongqing', 'cq-topography', 'Cyberpunk 8D Mountain City', 'urban', 'Chongqing''s strongest differentiator is its surreal multi-level geography, where bridges, slopes, stairs, rail lines, and towers make the city feel like a real 8D maze.', 'This gives foreign visitors an immediate, memorable hook before deeper urban interpretation begins.', 1),
  ('chongqing', 'cq-night-city', 'Neon Night Energy and Urban Drama', 'urban', 'Bridges, river edges, neon, elevation, and night movement make Chongqing one of China''s most cinematic and cyberpunk-feeling cities.', 'This is the clearest acquisition hook, especially for visual-first travelers.', 2),
  ('chongqing', 'cq-food-and-wartime', 'Hotpot, Street Appetite, and Wartime Layers', 'food', 'The city becomes deeper when its visual intensity is tied to appetite, labor, resilience, and wartime memory.', 'This keeps Chongqing from collapsing into pure internet spectacle.', 3),

  ('beijing', 'bj-history-and-neighborhood', 'History and Neighborhood Reading', 'heritage', 'Beijing is strongest when imperial scale and neighborhood life are read together rather than separately.', 'This helps the concierge build routes that feel coherent and not overstuffed.', 4),

  ('jingmai_mountain', 'jm-ancient-tea-forest', 'Ancient Tea Forests and Ecological Continuity', 'tea', 'Jingmai''s core value is the living continuity between tea forest, people, and long memory.', 'This is the main reason the destination matters internationally.', 1),
  ('jingmai_mountain', 'jm-village-ritual', 'Village Ritual and Mountain Time', 'living_culture', 'Village life, ritual pace, and human continuity make Jingmai a strong answer to travelers seeking quiet depth.', 'This prevents Jingmai from being sold as scenery alone.', 2),
  ('jingmai_mountain', 'jm-slow-retreat', 'Tea Retreat and Contemplative Travel', 'wellness', 'Jingmai works especially well for travelers who want beauty, stillness, tea, and a reflective journey.', 'This supports premium, slower, higher-trust itinerary design.', 3),

  ('wudang_mountain', 'wd-taoist-mountain', 'Taoist Mountain and Sacred Architecture', 'heritage', 'Wudang''s strongest frame is the relationship between mountain space, Taoist architecture, and spiritual order.', 'This gives visitors a coherent reason to come that is deeper than scenery alone.', 1),
  ('wudang_mountain', 'wd-internal-practice', 'Internal Practice and Embodied Culture', 'practice', 'Wudang becomes more meaningful when travelers understand internal practice, bodily discipline, and quiet repetition.', 'This creates a differentiated experiential route instead of generic mountain walking.', 2),
  ('wudang_mountain', 'wd-reflective-china', 'Reflective China: Philosophy, Breath, and Pace', 'wellness', 'Wudang is one of the best places to present a reflective, restrained, interior side of China to foreign visitors.', 'This is valuable for premium and spiritually curious travelers.', 3)
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
  ('bj_imperial_core', 'beijing', 'bj-imperial-order', 'Beijing as Imperial Capital', 'heritage', 'Beijing is one of the clearest places to understand how imperial power shaped urban form, ceremonial order, and national imagination.', 'A city where scale, axis, gates, and ceremony still shape how history is felt.', 'This is Beijing''s most legible top-of-funnel story for first-time foreign visitors.', '{first-time visitors,Europe,United States,academic groups}', '{travelers wanting only nightlife or shopping}', '{https://whc.unesco.org/en/list/1714/,https://english.beijing.gov.cn/beijinginfo/culture/culturaltreasures/sevenculture/}', 'mixed', 5),
  ('bj_hutong_life', 'beijing', 'bj-hutong-life', 'Hutong Life and Courtyard Memory', 'living_culture', 'The hutongs show how daily life, neighborhood texture, and lived memory survive beside grand political space.', 'The most memorable Beijing is often found in narrow lanes rather than only at monumental sites.', 'This keeps Beijing intimate and human-scaled in the concierge narrative.', '{photography travelers,slow cultural travelers,repeat China visitors}', '{visitors expecting only headline monuments}', '{https://english.visitbeijing.com.cn/article/47OMs0rcAFo,https://english.beijing.gov.cn/beijinginfo/culture/culturecalendar/information/202401/t20240112_3534074.html}', 'mixed', 5),
  ('bj_calligraphy_practice', 'beijing', 'bj-literati-practice', 'Calligraphy and Cultivated Practice', 'craft', 'Calligraphy gives Beijing a strong route into patience, study, hand discipline, and cultured practice.', 'Brush, ink, and repetition offer a quieter way into Beijing''s intellectual life.', 'This supports premium specialist experiences and a more refined city reading.', '{Japan,academic groups,design travelers,slow cultural travelers}', '{travelers wanting only fast sightseeing}', '{https://www.dolphinunion.com/post/beijing-hutong-experiences-for-foreign-tourists,https://english.beijing.gov.cn/beijinginfo/culture/culturecalendar/information/202401/t20240112_3534074.html}', 'mixed', 4),

  ('jdz_global_porcelain', 'jingdezhen', 'jdz-imperial-kilns', 'Porcelain Capital of China', 'porcelain', 'Jingdezhen is globally important because porcelain here shaped imperial taste, trade routes, collecting, and craft knowledge across centuries.', 'A city where earth, fire, glaze, and history still feel active rather than finished.', 'This is the primary international explanation for why Jingdezhen matters.', '{Europe,United States,Japan,Korea,design travelers,academic groups}', '{travelers seeking only nightlife or fast urban entertainment}', '{https://www.unesco.org/en/creative-cities/jingdezhen,https://whc.unesco.org/en/tentativelists/6265/}', 'mixed', 5),
  ('jdz_workshop_access', 'jingdezhen', 'jdz-studio-making', 'Workshops, Kilns, and Living Craft', 'craft', 'Jingdezhen''s strongest contemporary appeal is that visitors can still encounter active workshops, kiln logic, and maker culture.', 'This is not only a museum city; it is a living making culture.', 'This is what turns interest into higher-value immersion.', '{design travelers,makers,collectors,United States,Europe}', '{travelers uninterested in process or craft}', '{https://www.unesco.org/en/creative-cities/jingdezhen,http://english.scio.gov.cn/internationalexchanges/2025-10/20/content_118132564.html}', 'mixed', 5),
  ('jdz_collecting_culture', 'jingdezhen', 'jdz-material-culture', 'Material Knowledge and Collecting Culture', 'design', 'Jingdezhen becomes especially rich when explained through material knowledge, glaze intelligence, object judgment, and collecting context.', 'A deeper route here is about learning how to look, not only what to buy.', 'This supports your highest-value interpretation-led routes.', '{collectors,academic groups,Japan,Europe}', '{casual tourists only seeking souvenir shopping}', '{https://whc.unesco.org/en/tentativelists/6265/,http://english.scio.gov.cn/internationalexchanges/2025-10/20/content_118132564.html}', 'mixed', 4),

  ('cd_teahouse_city', 'chengdu', 'cd-teahouse-rhythm', 'Tea-House Rhythm and Local Ease', 'living_culture', 'Chengdu helps foreign travelers understand that cultural depth can live in pace, tea, comfort, and repeatable daily rituals.', 'A city where long afternoons and conversation are part of the attraction.', 'This is Chengdu''s strongest differentiator from monument-first cities.', '{slow travelers,food travelers,North America,Australia}', '{travelers wanting only blockbuster landmarks}', '{https://www.dolphinunion.com/post/authentic-chengdu-teahouse-experience-for-foreign-travelers-can-truly-taste-the-city-slow-life,https://www.nationalgeographic.com/travel/article/chengdu-ancient-teahouses-are-going-viral}', 'mixed', 5),
  ('cd_food_culture', 'chengdu', 'cd-sichuan-flavor', 'Sichuan Flavor and Market Intelligence', 'food', 'Food in Chengdu is one of the clearest ways to understand appetite, neighborhood life, and local social rhythm.', 'Chengdu is easiest to love through tea, markets, and the logic of Sichuan flavor.', 'This is the most commercially accessible hook for the city.', '{food travelers,Southeast Asia,Japan,Korea,United States}', '{travelers who avoid local food exploration}', '{https://www.unesco.org/en/creative-cities/chengdu,https://unesdoc.unesco.org/ark:/48223/pf0000192047}', 'unesco', 5),
  ('cd_gentle_city', 'chengdu', 'cd-city-life', 'Gentle Urban Life Beyond Pandas', 'living_culture', 'Chengdu is strongest when it is framed as a city of lived ease, not only panda tourism.', 'The deeper Chengdu is made of parks, neighborhoods, social habits, and the pleasure of staying longer.', 'This avoids the most obvious travel cliché and aligns with your brand.', '{repeat China visitors,slow travelers,Australia,Europe}', '{travelers seeking only animal-related tourism}', '{https://www.dolphinunion.com/post/authentic-chengdu-teahouse-experience-for-foreign-travelers-can-truly-taste-the-city-slow-life,https://www.unesco.org/en/creative-cities/chengdu}', 'mixed', 4),

  ('cq_vertical_city', 'chongqing', 'cq-topography', 'Cyberpunk 8D Vertical City', 'urban', 'Chongqing''s physical structure is its main story: stairs, slopes, bridges, rails, river edges, and stacked elevations make the whole city feel surreal and maze-like.', 'One of the rare places where geography itself feels like urban science fiction.', 'This is the sharpest way to explain Chongqing to foreign visitors who are pulled in by the 8D city image.', '{photography travelers,urbanists,United States,Europe}', '{travelers wanting only calm resort pacing}', '{https://www.cnn.com/travel/chongqing-china-tourism-cyberpunk-city-intl-hnk,https://study.cqu.edu.cn/HOME/ADMISSION/Overview/About_Chongqing/History.htm}', 'mixed', 5),
  ('cq_neon_night', 'chongqing', 'cq-night-city', 'Neon Night Energy and 8D Urban Movement', 'urban', 'Chongqing is one of China''s strongest night cities, where neon, humidity, elevation, and dense movement create a cyberpunk-feeling atmosphere.', 'A city that becomes more itself after dark.', 'This is the strongest visual acquisition hook, but it can still support deeper explanation.', '{Korea,Japan,photography travelers,younger travelers}', '{travelers who avoid night movement or dense urban settings}', '{https://www.chinadaily.com.cn/a/202104/14/WS60762274a31024ad0bab54d3.html,https://english.news.cn/20241002/69fa3b2d18ba4c3fb5c1d97bdf6716f7/c.html}', 'mixed', 5),
  ('cq_hotpot_layers', 'chongqing', 'cq-food-and-wartime', 'Hotpot, Appetite, and Wartime Layers', 'food', 'Chongqing becomes more meaningful when its bold food culture is connected to dense urban life, labor, weather, and historical resilience.', 'The city''s appetite is part of its structure, not just its entertainment.', 'This keeps the food story from becoming a shallow checklist.', '{food travelers,urban culture travelers,North America,Southeast Asia}', '{travelers wanting only scenic daytime sightseeing}', '{http://www.chinadaily.com.cn/a/201710/23/WS5a0ced18a31061a738406ffb.html,https://study.cqu.edu.cn/HOME/ADMISSION/Overview/About_Chongqing/History.htm}', 'mixed', 4),

  ('jm_tea_forest', 'jingmai_mountain', 'jm-ancient-tea-forest', 'Ancient Tea Forest Landscape', 'tea', 'Jingmai''s strongest meaning comes from the continuity between forest ecology, tea, and long cultural memory.', 'A place where the tea landscape feels alive rather than staged.', 'This is the clearest reason the destination matters internationally.', '{tea travelers,slow travelers,Japan,Korea,Europe}', '{travelers seeking nightlife or dense city activity}', '{https://whc.unesco.org/en/list/1665/,https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/}', 'mixed', 5),
  ('jm_village_time', 'jingmai_mountain', 'jm-village-ritual', 'Village Time and Tea Ritual', 'living_culture', 'Village texture, ritual pace, and hospitality matter as much as the scenery in Jingmai.', 'Jingmai works because it slows the traveler down enough to notice continuity.', 'This keeps the destination human and not only scenic.', '{premium slow travelers,North America,Australia,wellness travelers}', '{travelers who dislike quiet or rural pacing}', '{https://whc.unesco.org/en/list/1665/,https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/}', 'mixed', 4),
  ('jm_contemplative_route', 'jingmai_mountain', 'jm-slow-retreat', 'Tea Retreat and Reflective Travel', 'wellness', 'Jingmai is one of the best places in this project to offer a contemplative, aesthetically coherent route built around tea and stillness.', 'Not a checklist trip, but a route for listening, tasting, and mountain air.', 'This supports high-trust, high-margin itinerary design.', '{wellness travelers,design travelers,tea travelers}', '{travelers seeking fast-paced city hopping}', '{https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/,https://whc.unesco.org/en/list/1665/}', 'mixed', 4),

  ('wd_taoist_mountain', 'wudang_mountain', 'wd-taoist-mountain', 'Taoist Mountain and Sacred Architecture', 'heritage', 'Wudang''s strongest explanation is the relationship between mountain form, Taoist architecture, and sacred order.', 'Cloud temples and mountain routes that feel philosophical rather than merely scenic.', 'This gives Wudang a coherent entry point for foreign visitors.', '{philosophy travelers,academic groups,Europe,United States}', '{travelers uninterested in spiritual or historical framing}', '{https://whc.unesco.org/en/list/705/,https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html}', 'mixed', 5),
  ('wd_internal_practice', 'wudang_mountain', 'wd-internal-practice', 'Internal Practice and Embodied Culture', 'practice', 'Internal practice gives Wudang a deeper experiential layer through breathing, movement, and disciplined quiet.', 'Wudang matters most when the body is part of the interpretation.', 'This is what makes the destination more than a temple-and-viewpoint trip.', '{martial arts travelers,wellness travelers,United States,Europe}', '{travelers seeking only quick photo stops}', '{https://www.globaltimes.cn/page/202306/1291971.shtml,https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html}', 'mixed', 4),
  ('wd_reflective_china', 'wudang_mountain', 'wd-reflective-china', 'Reflective China Through Taoist Pace', 'wellness', 'Wudang is one of the best places to present a reflective, restrained, interior side of China to foreign visitors.', 'A route through breath, silence, and mountain thought.', 'This aligns strongly with your differentiated premium positioning.', '{slow travelers,premium travelers,Japan,Europe}', '{travelers preferring energetic urban itineraries}', '{https://whc.unesco.org/en/list/705/,https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html}', 'mixed', 4)
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

insert into public.faq_items (
  destination_slug,
  audience_slug,
  question,
  answer,
  tags,
  source_card_ids
)
values
  ('beijing', null, 'What is the right way to experience Beijing?', 'The best version of Beijing balances imperial scale with hutong intimacy. You should not treat it only as a monument checklist; it works best when grand history and daily neighborhood life are read together.', '{positioning,beijing}', '{bj_imperial_core,bj_hutong_life}'),
  ('beijing', 'academic_museum', 'Is Beijing suitable for deeper cultural study, not only sightseeing?', 'Yes. Beijing is especially strong for travelers who care about political space, calligraphy, historical layering, and how urban form expresses ideas of order and memory.', '{specialist,beijing}', '{bj_imperial_core,bj_calligraphy_practice}'),

  ('jingdezhen', null, 'Why is Jingdezhen worth visiting if I am not a ceramist?', 'Jingdezhen is not only for specialists. It is one of the clearest ways to understand how making, material knowledge, beauty, and daily life can shape an entire city.', '{positioning,jingdezhen}', '{jdz_global_porcelain,jdz_workshop_access}'),
  ('jingdezhen', 'academic_museum', 'Can Jingdezhen support a collector, museum, or design-focused trip?', 'Very much so. The city is especially strong when framed through porcelain history, workshop access, material knowledge, and collecting culture rather than simple souvenir shopping.', '{design,jingdezhen}', '{jdz_global_porcelain,jdz_collecting_culture}'),

  ('chengdu', null, 'What makes Chengdu more than a food city?', 'Chengdu''s real depth comes from local ease, tea-house rhythm, and a daily culture built around comfort, conversation, and return. Food is important, but it is part of a wider urban way of life.', '{positioning,chengdu}', '{cd_teahouse_city,cd_food_culture,cd_gentle_city}'),
  ('chengdu', null, 'Is Chengdu good for a slower first trip in China?', 'Yes. Chengdu is one of the best cities for travelers who want to understand China through pace, appetite, and neighborhood life rather than only monuments or rush.', '{first-time,chengdu}', '{cd_teahouse_city,cd_gentle_city}'),

  ('chongqing', null, 'What is the right way to experience Chongqing?', 'Chongqing should first hit as a cyberpunk-feeling 8D mountain city, then open up into topography, night movement, appetite, and local urban life. It should not be reduced to a list of viewpoints.', '{positioning,chongqing}', '{cq_vertical_city,cq_neon_night}'),
  ('chongqing', 'photography_style', 'Is Chongqing mainly a photo city?', 'It is one of China''s strongest photo cities, but its real value comes from how geography, neon, food, movement, and local life all reinforce one another. The best routes explain the city rather than only chase images.', '{photography,chongqing}', '{cq_vertical_city,cq_neon_night,cq_hotpot_layers}'),

  ('jingmai_mountain', null, 'Who is Jingmai best for?', 'Jingmai is best for travelers who want tea, mountain stillness, village texture, and a slower, more contemplative route. It is not a fast destination and should not be sold that way.', '{positioning,jingmai}', '{jm_tea_forest,jm_village_time,jm_contemplative_route}'),
  ('jingmai_mountain', null, 'Is Jingmai mainly scenic, or is it cultural?', 'It is both, but the real value comes from the relationship between tea forest, village continuity, ritual pace, and the human side of the landscape.', '{jingmai,culture}', '{jm_tea_forest,jm_village_time}'),

  ('wudang_mountain', null, 'What makes Wudang different from a normal mountain destination?', 'Wudang is strongest when understood as a Taoist mountain rather than only a scenic one. Architecture, philosophy, internal practice, and mountain pace all belong to the same experience.', '{positioning,wudang}', '{wd_taoist_mountain,wd_internal_practice}'),
  ('wudang_mountain', null, 'Do I need martial arts experience to appreciate Wudang?', 'No. Wudang is valuable even for travelers with no prior practice, as long as they are interested in mountain atmosphere, Taoist thought, and slower embodied culture.', '{wudang,entry-level}', '{wd_internal_practice,wd_reflective_china}')
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
  ('beijing', 'bj-imperial-and-hutong-day', 'Imperial Order and Hutong Texture Day', 6, 'balanced', 'A day that moves from ceremonial scale to neighborhood intimacy so Beijing feels coherent rather than overwhelming.', 'This should anchor most first-time Beijing routes because it bridges grand history with lived urban texture.', '{first-time visitors,Europe,United States,academic groups}', 'Request a curated Beijing cultural day'),
  ('jingdezhen', 'jdz-kiln-and-studio-day', 'Kiln History and Studio Practice Day', 7, 'immersive', 'A material-led day through porcelain history, working studios, and the logic of making.', 'This sequence helps travelers feel process before they think about shopping or collecting.', '{design travelers,makers,collectors,Japan,Europe}', 'Build a Jingdezhen craft immersion'),
  ('chengdu', 'cd-tea-and-flavor-day', 'Tea-House Rhythm and Flavor Day', 6, 'slow', 'A city day built around tea, markets, local pace, and food as a way into everyday life.', 'This is the most approachable Chengdu structure for foreign visitors and converts broad curiosity into place understanding.', '{food travelers,slow travelers,North America,Southeast Asia}', 'Plan a slow Chengdu day with local depth'),
  ('chongqing', 'cq-vertical-city-night-route', 'Cyberpunk 8D City and Night Route', 6, 'immersive', 'A route that explains Chongqing through elevation, stacked movement, neon, river drama, and appetite.', 'The city reads best when its daytime 8D structure and nighttime intensity are tied together.', '{photography travelers,urbanists,younger travelers,Korea,Japan}', 'Design a Chongqing urban drama route'),
  ('jingmai_mountain', 'jm-tea-forest-day', 'Tea Forest and Village Continuity Day', 8, 'slow', 'A slow mountain day through tea forest, village texture, and tasting logic.', 'This protects Jingmai from becoming a rushed scenic stop and keeps the route contemplative.', '{tea travelers,wellness travelers,Japan,Europe,Australia}', 'Request a Jingmai tea retreat route'),
  ('wudang_mountain', 'wd-taoist-mountain-day', 'Taoist Mountain and Practice Day', 8, 'immersive', 'A route through temples, mountain pace, and light internal practice framed by Taoist thought.', 'This keeps Wudang coherent by linking architecture, movement, and reflection.', '{philosophy travelers,wellness travelers,Europe,United States}', 'Build a reflective Wudang journey')
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
    ('bj-imperial-and-hutong-day', 'bj_imperial_core', 1, 'core'),
    ('bj-imperial-and-hutong-day', 'bj_hutong_life', 2, 'core'),
    ('bj-imperial-and-hutong-day', 'bj_calligraphy_practice', 3, 'optional'),
    ('jdz-kiln-and-studio-day', 'jdz_global_porcelain', 1, 'core'),
    ('jdz-kiln-and-studio-day', 'jdz_workshop_access', 2, 'core'),
    ('jdz-kiln-and-studio-day', 'jdz_collecting_culture', 3, 'supporting'),
    ('cd-tea-and-flavor-day', 'cd_teahouse_city', 1, 'core'),
    ('cd-tea-and-flavor-day', 'cd_food_culture', 2, 'core'),
    ('cd-tea-and-flavor-day', 'cd_gentle_city', 3, 'supporting'),
    ('cq-vertical-city-night-route', 'cq_vertical_city', 1, 'core'),
    ('cq-vertical-city-night-route', 'cq_neon_night', 2, 'core'),
    ('cq-vertical-city-night-route', 'cq_hotpot_layers', 3, 'supporting'),
    ('jm-tea-forest-day', 'jm_tea_forest', 1, 'core'),
    ('jm-tea-forest-day', 'jm_village_time', 2, 'core'),
    ('jm-tea-forest-day', 'jm_contemplative_route', 3, 'supporting'),
    ('wd-taoist-mountain-day', 'wd_taoist_mountain', 1, 'core'),
    ('wd-taoist-mountain-day', 'wd_internal_practice', 2, 'core'),
    ('wd-taoist-mountain-day', 'wd_reflective_china', 3, 'supporting')
) as c(module_slug, card_id, sort_order, role)
  on c.module_slug = m.slug
on conflict (itinerary_module_id, knowledge_card_id) do nothing;
