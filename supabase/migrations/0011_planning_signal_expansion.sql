create index if not exists idx_practical_facts_destination_entity
  on public.practical_facts(destination_slug, entity_type, entity_slug);

create index if not exists idx_practical_facts_fact_type
  on public.practical_facts(fact_type);

create index if not exists idx_ugc_signals_destination_theme
  on public.ugc_signals(destination_slug, theme_slug);

create index if not exists idx_content_angles_destination_audience
  on public.content_angles(destination_slug, audience_slug);

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
    'pace_profile',
    'Quanzhou works best when treated as a layered old-city destination with half-day thematic blocks rather than a rushed monument sweep.',
    'https://whc.unesco.org/en/list/1561/',
    0.83,
    '2026-05-02',
    false
  ),
  (
    'quanzhou',
    'destination',
    'quanzhou',
    'best_trip_length',
    'Two to three nights is the strongest minimum for combining maritime heritage, religious diversity, food life, and one extension theme such as Dehua or Anxi.',
    'https://www.unesco.org/en/creative-cities/quanzhou',
    0.8,
    '2026-05-02',
    false
  ),
  (
    'quanzhou',
    'theme',
    'qz-hokkien-roots',
    'interpretation_note',
    'Roots-oriented travelers need family-memory framing and Hokkien continuity explained early; otherwise the city can feel historically rich but personally distant.',
    null,
    0.74,
    '2026-05-02',
    false
  ),
  (
    'beijing',
    'destination',
    'beijing',
    'pace_profile',
    'Beijing converts best when large ceremonial spaces are balanced with slower hutong or courtyard texture on the same day.',
    'https://whc.unesco.org/en/list/1714/',
    0.84,
    '2026-05-02',
    false
  ),
  (
    'beijing',
    'destination',
    'beijing',
    'walking_load',
    'Capital-scale routes can feel physically and cognitively heavy. Premium itineraries should break the city into one big frame and one intimate frame per day.',
    'https://english.visitbeijing.com.cn/article/47OMs0rcAFo',
    0.79,
    '2026-05-02',
    false
  ),
  (
    'beijing',
    'theme',
    'bj-imperial-order',
    'misread_risk',
    'If Beijing is framed only as monument coverage, foreign travelers may miss why the capital feels conceptually different from other Chinese cities.',
    'https://whc.unesco.org/en/list/1714/',
    0.78,
    '2026-05-02',
    false
  ),
  (
    'jingdezhen',
    'destination',
    'jingdezhen',
    'pace_profile',
    'Jingdezhen works best through focused studio, kiln, and object-reading blocks, not through dense sightseeing volume.',
    'https://www.unesco.org/en/creative-cities/jingdezhen',
    0.84,
    '2026-05-02',
    false
  ),
  (
    'jingdezhen',
    'destination',
    'jingdezhen',
    'best_trip_length',
    'One full day is enough for an introduction, but two nights creates room for both historical context and live maker culture.',
    'https://whc.unesco.org/en/tentativelists/6265/',
    0.8,
    '2026-05-02',
    false
  ),
  (
    'jingdezhen',
    'theme',
    'jdz-studio-making',
    'english_support_level',
    'Workshop value rises sharply when a host or guide can explain process, firing logic, and object judgment in English.',
    'https://www.unesco.org/en/creative-cities/jingdezhen',
    0.76,
    '2026-05-02',
    false
  ),
  (
    'chengdu',
    'destination',
    'chengdu',
    'pace_profile',
    'Chengdu is strongest when the route leaves room for sitting, tasting, and neighborhood drift rather than trying to maximize landmark count.',
    'https://www.unesco.org/en/creative-cities/chengdu',
    0.85,
    '2026-05-02',
    false
  ),
  (
    'chengdu',
    'theme',
    'cd-sichuan-flavor',
    'food_sensitivity_note',
    'Food-led planning should separate curiosity about Sichuan flavor from actual spice tolerance so the route stays welcoming instead of performative.',
    'https://unesdoc.unesco.org/ark:/48223/pf0000192047',
    0.8,
    '2026-05-02',
    false
  ),
  (
    'chengdu',
    'destination',
    'chengdu',
    'best_trip_length',
    'Two to four nights is the sweet spot because the city rewards repetition, not just first impressions.',
    'https://www.nationalgeographic.com/travel/article/chengdu-ancient-teahouses-are-going-viral',
    0.77,
    '2026-05-02',
    false
  ),
  (
    'chongqing',
    'destination',
    'chongqing',
    'pace_profile',
    'Chongqing should be planned in shorter, more intense blocks because its 8D topography, density, and night movement consume energy faster than travelers expect.',
    'https://www.cnn.com/travel/chongqing-china-tourism-cyberpunk-city-intl-hnk',
    0.84,
    '2026-05-02',
    false
  ),
  (
    'chongqing',
    'destination',
    'chongqing',
    'walking_load',
    'Topography is part of the citys value but also part of its friction. Route design should account for stairs, slopes, and transfer fatigue.',
    'https://study.cqu.edu.cn/HOME/ADMISSION/Overview/About_Chongqing/History.htm',
    0.81,
    '2026-05-02',
    false
  ),
  (
    'chongqing',
    'theme',
    'cq-night-city',
    'best_time_of_day',
    'Night-city modules should start at dusk so travelers can read the terrain before the skyline becomes the main event.',
    'https://www.chinadaily.com.cn/a/202104/14/WS60762274a31024ad0bab54d3.html',
    0.8,
    '2026-05-02',
    false
  ),
  (
    'jingmai_mountain',
    'destination',
    'jingmai_mountain',
    'pace_profile',
    'Jingmai should be sold as a light-footed stay with long quiet intervals, not as a checklist destination.',
    'https://whc.unesco.org/en/list/1665/',
    0.85,
    '2026-05-02',
    false
  ),
  (
    'jingmai_mountain',
    'destination',
    'jingmai_mountain',
    'best_trip_length',
    'A one-night stop can introduce the tea landscape, but two nights is far better for village rhythm, tasting, and forest context.',
    'https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/',
    0.8,
    '2026-05-02',
    false
  ),
  (
    'jingmai_mountain',
    'theme',
    'jm-slow-retreat',
    'comfort_expectation_note',
    'Premium travelers should be prepared for a destination where atmosphere and continuity matter more than polished luxury infrastructure.',
    'https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/',
    0.76,
    '2026-05-02',
    false
  ),
  (
    'wudang_mountain',
    'destination',
    'wudang_mountain',
    'pace_profile',
    'Wudang is strongest when the trip protects quiet, mountain rhythm, and reflective time rather than treating the site as a fast scenic climb.',
    'https://whc.unesco.org/en/list/705/',
    0.85,
    '2026-05-02',
    false
  ),
  (
    'wudang_mountain',
    'destination',
    'wudang_mountain',
    'best_trip_length',
    'Two nights is the best minimum if the goal is to combine sacred architecture, movement practice, and mountain atmosphere without rushing.',
    'https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html',
    0.79,
    '2026-05-02',
    false
  ),
  (
    'wudang_mountain',
    'theme',
    'wd-internal-practice',
    'entry_requirement_note',
    'Beginner travelers do not need prior martial-arts training, but they do need expectation-setting so the experience is read as embodied culture, not spectacle.',
    'https://www.globaltimes.cn/page/202306/1291971.shtml',
    0.74,
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
    'qz-religious-diversity',
    'international cultural-travel inquiry pattern',
    'misunderstanding',
    'Travelers often know Quanzhou is a UNESCO site but do not realize the citys religious diversity is visible on the ground rather than only a historical footnote.',
    'high',
    'curious',
    'heritage explanation',
    'https://whc.unesco.org/en/list/1561/'
  ),
  (
    'quanzhou',
    'qz-food-life',
    'food-first traveler planning pattern',
    'planning_blocker',
    'People interested in Quanzhou food often do not know whether the city is best handled as a snack trail, a dinner city, or part of a deeper old-town route.',
    'medium',
    'curious',
    'food-route packaging',
    'https://www.unesco.org/en/creative-cities/quanzhou'
  ),
  (
    'beijing',
    'bj-imperial-order',
    'foreign first-trip planning pattern',
    'planning_blocker',
    'First-time visitors know the major names but often do not know how to combine imperial scale with livable city texture in one coherent route.',
    'high',
    'curious',
    'first-trip curation',
    'https://whc.unesco.org/en/list/1714/'
  ),
  (
    'beijing',
    'bj-literati-practice',
    'culture-traveler question pattern',
    'faq',
    'Is there a way to experience Beijing beyond palaces and the Great Wall if I care more about culture than checklists?',
    'medium',
    'curious',
    'alternative-beijing positioning',
    null
  ),
  (
    'jingdezhen',
    'jdz-imperial-kilns',
    'museum-minded traveler pattern',
    'faq',
    'Is Jingdezhen meaningful if I am interested in history and collecting, not in taking a basic pottery class?',
    'medium',
    'curious',
    'collector-facing copy',
    'https://whc.unesco.org/en/tentativelists/6265/'
  ),
  (
    'jingdezhen',
    'jdz-studio-making',
    'maker travel pattern',
    'planning_blocker',
    'Foreign travelers often struggle to tell the difference between serious studio visits and tourist workshop experiences.',
    'high',
    'mixed',
    'experience filtering',
    'https://www.unesco.org/en/creative-cities/jingdezhen'
  ),
  (
    'chengdu',
    'cd-city-life',
    'repeat-China-traveler pattern',
    'delight',
    'Visitors often say Chengdu feels easier to inhabit than to simply tour, which is exactly why it needs slower route design.',
    'medium',
    'positive',
    'stay-longer messaging',
    'https://www.dolphinunion.com/post/authentic-chengdu-teahouse-experience-for-foreign-travelers-can-truly-taste-the-city-slow-life'
  ),
  (
    'chengdu',
    'cd-sichuan-flavor',
    'food traveler concern pattern',
    'concern',
    'Some travelers are excited by Sichuan food but worry the city will become one long spicy challenge rather than a varied cultural experience.',
    'medium',
    'mixed',
    'food expectation setting',
    'https://unesdoc.unesco.org/ark:/48223/pf0000192047'
  ),
  (
    'chongqing',
    'cq-topography',
    'first-visit urban traveler pattern',
    'concern',
    'Travelers are drawn to Chongqing''s cyberpunk 8D visuals but worry the city may be too physically demanding or too chaotic to enjoy comfortably.',
    'high',
    'mixed',
    'pace and access qualification',
    'https://www.cnn.com/travel/chongqing-china-tourism-cyberpunk-city-intl-hnk'
  ),
  (
    'chongqing',
    'cq-food-and-wartime',
    'history-and-food traveler pattern',
    'faq',
    'Can Chongqing be explained through more than hotpot and skyline if I care about history too?',
    'medium',
    'curious',
    'deeper-city reframing',
    'http://www.chinadaily.com.cn/a/201710/23/WS5a0ced18a31061a738406ffb.html'
  ),
  (
    'jingmai_mountain',
    'jm-ancient-tea-forest',
    'tea traveler pattern',
    'faq',
    'What makes Jingmai different from just visiting a tea plantation or doing a tasting somewhere else in China?',
    'high',
    'curious',
    'UNESCO differentiation',
    'https://whc.unesco.org/en/list/1665/'
  ),
  (
    'jingmai_mountain',
    'jm-slow-retreat',
    'premium slow-travel pattern',
    'planning_blocker',
    'Travelers attracted to Jingmai often do not know whether the destination should be sold as tea, landscape, wellness, or anthropology.',
    'medium',
    'curious',
    'positioning clarity',
    'https://wildchina.com/2023/11/chinas-newest-unesco-site-jingmai-mountain/'
  ),
  (
    'wudang_mountain',
    'wd-taoist-mountain',
    'heritage traveler pattern',
    'misunderstanding',
    'Many foreign travelers assume Wudang is mainly a martial-arts performance destination and miss its architectural and Taoist significance.',
    'high',
    'mixed',
    'destination reframing',
    'https://whc.unesco.org/en/list/705/'
  ),
  (
    'wudang_mountain',
    'wd-internal-practice',
    'wellness traveler pattern',
    'planning_blocker',
    'Travelers interested in practice often do not know whether Wudang experiences are beginner-friendly, spiritual, physical, or performative.',
    'high',
    'curious',
    'expectation setting',
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
    'middle_east_heritage',
    'qz-middle-east-heritage-angle',
    'A maritime Muslim heritage route through one of East Asias great port cities',
    'Quanzhou offers a rare China entry point where Islamic memory, trade history, and port-city exchange can be read together.',
    '{religious diversity,port history,arab trade memory,incense and exchange}',
    '{generic old-town framing,photo-only heritage route}',
    'Invitation to request a faith-and-exchange route'
  ),
  (
    'beijing',
    'academic_museum',
    'bj-academic-museum-angle',
    'A capital of political space, ritual order, and urban memory',
    'Beijing rewards travelers who want a city to be explained, not just visited.',
    '{central axis,imperial structure,hutong continuity,curated interpretation}',
    '{capital checklist,high-speed monument hopping}',
    'Prompt to plan an interpretation-led capital program'
  ),
  (
    'jingdezhen',
    'academic_museum',
    'jdz-academic-museum-angle',
    'A working porcelain city where empire, trade, and material knowledge still meet',
    'Jingdezhen is unusually legible to museum, curatorial, and design-minded travelers because the object language is already global.',
    '{imperial kilns,collecting logic,material process,global decorative arts}',
    '{shopping town framing,craft-gimmick workshop pitch}',
    'Invitation to shape a curator-style craft route'
  ),
  (
    'chengdu',
    'seasia_diaspora',
    'cd-seasia-food-culture-angle',
    'A food-and-life city where daily rhythm matters as much as what is on the table',
    'Chengdu feels warm and socially readable to travelers who connect to food through family, repetition, and street-level life.',
    '{flavor logic,tea houses,neighborhood ease,shared-table culture}',
    '{panda-only framing,restaurant list without city reading}',
    'Prompt to build a food-and-pace Chengdu plan'
  ),
  (
    'chongqing',
    'north_america_cultural',
    'cq-north-america-urban-angle',
    'A cyberpunk-feeling mountain megacity where 8D geography, appetite, and twentieth-century history collide',
    'Chongqing becomes far more memorable when the city is read as an 8D urban structure with resilience and appetite, not only spectacle.',
    '{8D topography,wartime layers,night energy,local appetite}',
    '{skyline-only framing,viral-photo itinerary,empty cyberpunk cliche}',
    'Invitation to request a deeper city-night route'
  ),
  (
    'jingmai_mountain',
    'japan_culture',
    'jm-japan-tea-angle',
    'An ancient tea landscape for travelers who care about cultivation, ritual, and quiet continuity',
    'Jingmai speaks to travelers who want tea understood as ecology and lived culture, not as a retail category.',
    '{tea forests,village continuity,ritual culture,slow attention}',
    '{plantation-photo framing,rushed tasting stop}',
    'Prompt to plan a tea-and-village stay'
  ),
  (
    'wudang_mountain',
    'north_america_cultural',
    'wd-north-america-reflective-angle',
    'A sacred mountain for travelers seeking reflective China rather than spectacle China',
    'Wudang offers one of the clearest routes into Taoist atmosphere, embodied practice, and mountain architecture.',
    '{taoist pace,embodied culture,sacred architecture,reflective travel}',
    '{kung-fu-show framing,adrenaline-only mountain pitch}',
    'Invitation to request a reflective mountain itinerary'
  )
on conflict (slug) do update set
  headline_angle = excluded.headline_angle,
  main_emotional_hook = excluded.main_emotional_hook,
  supporting_points = excluded.supporting_points,
  avoid_points = excluded.avoid_points,
  cta_style = excluded.cta_style,
  updated_at = timezone('utc', now());
