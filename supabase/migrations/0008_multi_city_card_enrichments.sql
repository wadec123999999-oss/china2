insert into public.knowledge_card_questions (knowledge_card_id, question, sort_order)
values
  ('bj_imperial_core', 'Why is Beijing still the clearest first-stop city for understanding imperial China?', 1),
  ('bj_imperial_core', 'How should I think about Beijing beyond just famous monuments?', 2),
  ('bj_hutong_life', 'Are hutongs still worth visiting, or are they just tourist streets now?', 1),
  ('bj_hutong_life', 'What do hutongs reveal about daily life in Beijing?', 2),
  ('bj_calligraphy_practice', 'Is calligraphy in Beijing worth trying even if I am a beginner?', 1),
  ('bj_calligraphy_practice', 'How does calligraphy help explain Beijing''s cultural life?', 2),

  ('jdz_global_porcelain', 'Why is Jingdezhen globally important, not just locally famous?', 1),
  ('jdz_global_porcelain', 'What makes Jingdezhen different from a normal craft town?', 2),
  ('jdz_workshop_access', 'Can visitors actually see makers and kilns in Jingdezhen?', 1),
  ('jdz_workshop_access', 'Is Jingdezhen better for buying ceramics or understanding how they are made?', 2),
  ('jdz_collecting_culture', 'Is Jingdezhen good for collectors, designers, and museum-minded travelers?', 1),
  ('jdz_collecting_culture', 'How can I avoid shallow souvenir shopping in Jingdezhen?', 2),

  ('cd_teahouse_city', 'Why are teahouses so central to understanding Chengdu?', 1),
  ('cd_teahouse_city', 'Is Chengdu really a slow city, or is that just a travel cliché?', 2),
  ('cd_food_culture', 'What makes Chengdu food culture deeper than just spicy dishes?', 1),
  ('cd_food_culture', 'How should a foreign traveler approach Chengdu through food?', 2),
  ('cd_gentle_city', 'What is the best way to experience Chengdu beyond pandas?', 1),
  ('cd_gentle_city', 'Why do so many travelers say Chengdu feels easy to stay longer in?', 2),

  ('cq_vertical_city', 'Why does Chongqing feel so different from other Chinese cities?', 1),
  ('cq_vertical_city', 'How should I understand Chongqing beyond the cyberpunk label?', 2),
  ('cq_neon_night', 'Is Chongqing mainly a night-view destination?', 1),
  ('cq_neon_night', 'Why does Chongqing become more compelling after dark?', 2),
  ('cq_hotpot_layers', 'How does hotpot connect to Chongqing''s city identity?', 1),
  ('cq_hotpot_layers', 'Does Chongqing have serious history beyond the internet-famous skyline?', 2),

  ('jm_tea_forest', 'Why is Jingmai Mountain a UNESCO site rather than just a tea area?', 1),
  ('jm_tea_forest', 'What makes the tea forests of Jingmai culturally important?', 2),
  ('jm_village_time', 'Is Jingmai mainly about scenery, or about village life too?', 1),
  ('jm_village_time', 'How important are Blang and Dai village traditions to the Jingmai experience?', 2),
  ('jm_contemplative_route', 'Who is Jingmai best for?', 1),
  ('jm_contemplative_route', 'Is Jingmai a good fit for slow and reflective travelers?', 2),

  ('wd_taoist_mountain', 'Why is Wudang culturally more important than a normal mountain destination?', 1),
  ('wd_taoist_mountain', 'What makes Wudang a Taoist mountain rather than just a scenic site?', 2),
  ('wd_internal_practice', 'Do I need martial arts experience to appreciate Wudang?', 1),
  ('wd_internal_practice', 'How does internal practice change the way Wudang should be experienced?', 2),
  ('wd_reflective_china', 'Is Wudang a good destination for travelers interested in philosophy and slower pace?', 1),
  ('wd_reflective_china', 'What kind of traveler gets the most out of Wudang?', 2)
on conflict do nothing;

insert into public.knowledge_card_audiences (knowledge_card_id, audience_slug, fit_score, rationale)
values
  ('bj_imperial_core', 'north_america_cultural', 5, 'Beijing''s imperial and political history is highly legible to travelers seeking a foundational China context.'),
  ('bj_imperial_core', 'europe_heritage', 5, 'Ceremonial urban form and world-heritage framing travel well in Europe.'),
  ('bj_imperial_core', 'academic_museum', 5, 'Strong fit for architecture, history, and political-space interpretation.'),
  ('bj_hutong_life', 'photography_style', 4, 'Hutongs offer strong visual texture but also support deeper neighborhood storytelling.'),
  ('bj_hutong_life', 'north_america_cultural', 4, 'This helps visitors experience Beijing at a human scale rather than only as a capital.'),
  ('bj_calligraphy_practice', 'japan_culture', 5, 'Brushwork, discipline, and cultivated practice are especially resonant here.'),
  ('bj_calligraphy_practice', 'academic_museum', 4, 'Useful for deeper interpretation-led and specialist cultural routes.'),

  ('jdz_global_porcelain', 'europe_heritage', 5, 'Porcelain is a globally legible material-culture story with deep European resonance.'),
  ('jdz_global_porcelain', 'japan_culture', 5, 'Ceramics culture and object sensitivity are a strong fit for Japan-facing products.'),
  ('jdz_global_porcelain', 'academic_museum', 5, 'Excellent for collections, design history, and museum-minded travelers.'),
  ('jdz_workshop_access', 'north_america_cultural', 4, 'Live workshop access makes the city feel experiential and not only historical.'),
  ('jdz_workshop_access', 'photography_style', 4, 'Studios and kilns are visually strong but still grounded in real process.'),
  ('jdz_collecting_culture', 'europe_heritage', 5, 'Supports a more refined route through collecting and material literacy.'),
  ('jdz_collecting_culture', 'academic_museum', 5, 'Especially valuable for serious object- and craft-oriented groups.'),

  ('cd_teahouse_city', 'north_america_cultural', 4, 'Chengdu''s ease and social rhythm make it a compelling alternative to monument-heavy routes.'),
  ('cd_teahouse_city', 'australia_cultural', 4, 'A slower pace and everyday cultural depth fit premium leisure travelers well.'),
  ('cd_food_culture', 'seasia_diaspora', 4, 'Food offers an immediate and familiar way into Chengdu''s local life.'),
  ('cd_food_culture', 'korea_visual_culture', 4, 'Strong fit for travelers who enter through atmosphere and taste.'),
  ('cd_food_culture', 'japan_culture', 4, 'Useful where food, daily life, and city rhythm matter more than landmarks.'),
  ('cd_gentle_city', 'north_america_cultural', 4, 'Helps frame Chengdu as a livable city rather than a single-attraction stop.'),
  ('cd_gentle_city', 'australia_cultural', 4, 'Good fit for travelers who prefer longer stays and cultural ease.'),

  ('cq_vertical_city', 'photography_style', 5, 'The city''s topography is one of the strongest visual hooks in the whole product set.'),
  ('cq_vertical_city', 'north_america_cultural', 4, 'Urban form and city intensity make Chongqing legible as a serious modern China destination.'),
  ('cq_neon_night', 'korea_visual_culture', 5, 'Night views, density, and motion align strongly with Korea-facing visual and urban appetite.'),
  ('cq_neon_night', 'japan_culture', 4, 'Strong fit for city-focused short-haul travelers who respond to atmosphere and night energy.'),
  ('cq_hotpot_layers', 'seasia_diaspora', 4, 'Food and street-level intensity are accessible hooks for regional travelers.'),
  ('cq_hotpot_layers', 'north_america_cultural', 4, 'The wartime and labor-history layer adds depth beyond visuals alone.'),

  ('jm_tea_forest', 'japan_culture', 5, 'Tea, ecology, and landscape continuity are especially strong market fits.'),
  ('jm_tea_forest', 'europe_heritage', 4, 'UNESCO cultural-landscape logic gives Jingmai strong European interpretive value.'),
  ('jm_village_time', 'north_america_cultural', 4, 'Village continuity and ritual pace support slower, explanation-led travel.'),
  ('jm_village_time', 'australia_cultural', 4, 'Strong fit for premium travelers seeking depth over speed.'),
  ('jm_contemplative_route', 'photography_style', 3, 'The destination is visually beautiful, but works best when travelers accept its quiet rhythm.'),
  ('jm_contemplative_route', 'australia_cultural', 5, 'Excellent fit for reflective, high-trust, high-aesthetic routes.'),

  ('wd_taoist_mountain', 'europe_heritage', 4, 'Wudang''s sacred architecture and philosophical framing travel well in Europe.'),
  ('wd_taoist_mountain', 'academic_museum', 4, 'Strong for religion, architecture, and intellectual-context groups.'),
  ('wd_internal_practice', 'north_america_cultural', 4, 'Embodied practice offers a compelling alternative to passive sightseeing.'),
  ('wd_internal_practice', 'australia_cultural', 4, 'Good fit for travelers who want guided practice and mountain depth together.'),
  ('wd_reflective_china', 'japan_culture', 4, 'Quiet, rhythm, and cultivated restraint are useful positioning angles here.'),
  ('wd_reflective_china', 'europe_heritage', 4, 'Reflective pacing helps Wudang stand apart from generic mountain tourism.')
on conflict (knowledge_card_id, audience_slug) do update set
  fit_score = excluded.fit_score,
  rationale = excluded.rationale;
