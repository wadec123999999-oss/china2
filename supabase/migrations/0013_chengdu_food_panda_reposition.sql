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
    'chengdu',
    'cd-sichuan-flavor',
    'Sichuan Flavor and Food Capital',
    'food',
    'Food in Chengdu is not just a meal list; it is one of the clearest ways to understand daily life, appetite, and place.',
    'This is Chengdu''s strongest and easiest conversion hook for foreign visitors.',
    1
  ),
  (
    'chengdu',
    'cd-panda-entry',
    'Pandas and Soft-Entry Chengdu',
    'wildlife',
    'Pandas are one of Chengdu''s easiest global entry points and make the city instantly legible to first-time visitors.',
    'This is a powerful top-of-funnel hook, especially when it opens into a wider city experience.',
    2
  ),
  (
    'chengdu',
    'cd-teahouse-rhythm',
    'Tea-House Rhythm and Local Ease',
    'living_culture',
    'Chengdu''s deeper cultural logic comes from its urban pace: tea, conversation, return visits, and comfort.',
    'This is what keeps the city from becoming only a panda-and-food cliche.',
    3
  ),
  (
    'chengdu',
    'cd-city-life',
    'Neighborhood Life and Everyday Culture',
    'living_culture',
    'Markets, streets, parks, and social habits make Chengdu a city best read through lived texture rather than landmarks alone.',
    'This gives the concierge a second layer beyond pandas and food.',
    4
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
    'cd_food_culture',
    'chengdu',
    'cd-sichuan-flavor',
    'Sichuan Flavor and Food Capital',
    'food',
    'Food in Chengdu is one of the clearest ways to understand appetite, neighborhood life, and local social rhythm.',
    'Chengdu is easiest to love through flavor, markets, and the logic of Sichuan food.',
    'This is the most commercially accessible hook for the city.',
    '{food travelers,Southeast Asia,Japan,Korea,United States}',
    '{travelers who avoid local food exploration}',
    '{https://www.unesco.org/en/creative-cities/chengdu,https://unesdoc.unesco.org/ark:/48223/pf0000192047}',
    'unesco',
    5
  ),
  (
    'cd_panda_entry',
    'chengdu',
    'cd-panda-entry',
    'Pandas as the Soft Entry Into Chengdu',
    'wildlife',
    'Pandas make Chengdu instantly legible to foreign travelers, especially first-time visitors, families, and travelers who need an easy emotional reason to care.',
    'A globally understood entry point that can open into food, parks, and local pace.',
    'This gives Chengdu a mainstream hook without flattening the city into a zoo stop.',
    '{families,first-time visitors,Japan,Korea,Southeast Asia}',
    '{travelers seeking only hard-core history interpretation}',
    '{https://www.chengdu.gov.cn/2024/05/27/c_550617.htm}',
    'official',
    5
  ),
  (
    'cd_teahouse_city',
    'chengdu',
    'cd-teahouse-rhythm',
    'Tea-House Rhythm and Local Ease',
    'living_culture',
    'Chengdu helps foreign travelers understand that cultural depth can live in pace, tea, comfort, and repeatable daily rituals.',
    'A city where long afternoons and conversation are part of the attraction.',
    'This is Chengdu''s deeper differentiator once food and pandas get attention first.',
    '{slow travelers,food travelers,North America,Australia}',
    '{travelers wanting only blockbuster landmarks}',
    '{https://www.dolphinunion.com/post/authentic-chengdu-teahouse-experience-for-foreign-travelers-can-truly-taste-the-city-slow-life,https://www.nationalgeographic.com/travel/article/chengdu-ancient-teahouses-are-going-viral}',
    'mixed',
    4
  ),
  (
    'cd_gentle_city',
    'chengdu',
    'cd-city-life',
    'Gentle Urban Life Beyond the First Hook',
    'living_culture',
    'Chengdu is strongest when it is framed as a city of lived ease, not only panda tourism or hotpot hype.',
    'The deeper Chengdu is made of parks, neighborhoods, social habits, and the pleasure of staying longer.',
    'This avoids the most obvious travel cliche and aligns with your brand.',
    '{repeat China visitors,slow travelers,Australia,Europe}',
    '{travelers seeking only animal-related tourism}',
    '{https://www.dolphinunion.com/post/authentic-chengdu-teahouse-experience-for-foreign-travelers-can-truly-taste-the-city-slow-life,https://www.unesco.org/en/creative-cities/chengdu}',
    'mixed',
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
    'chengdu',
    null,
    'Why do foreign travelers choose Chengdu?',
    'Most travelers first choose Chengdu for Sichuan food and pandas. The better version of the trip then opens into tea-house rhythm, parks, neighborhood ease, and a city that feels good to inhabit.',
    '{positioning,chengdu}',
    '{cd_food_culture,cd_panda_entry,cd_teahouse_city}'
  ),
  (
    'chengdu',
    null,
    'What makes Chengdu more than a food-and-panda city?',
    'Chengdu''s real depth comes from local ease, tea-house rhythm, and a daily culture built around comfort, conversation, and return. Food and pandas are strong hooks, but they are part of a wider urban way of life.',
    '{positioning,chengdu}',
    '{cd_teahouse_city,cd_food_culture,cd_gentle_city}'
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
    'chengdu',
    'cd-food-panda-and-pace-day',
    'Food, Panda, and Local Pace Day',
    6,
    'balanced',
    'A city day that uses Chengdu''s two strongest hooks, food and pandas, to open into parks, tea-house rhythm, and local ease.',
    'This is the strongest mainstream Chengdu structure for foreign visitors before moving into deeper local texture.',
    '{families,first-time visitors,food travelers,Japan,Korea,Southeast Asia}',
    'Plan a Chengdu day around food, pandas, and local depth'
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
    ('cd-food-panda-and-pace-day', 'cd_food_culture', 1, 'core'),
    ('cd-food-panda-and-pace-day', 'cd_panda_entry', 2, 'core'),
    ('cd-food-panda-and-pace-day', 'cd_teahouse_city', 3, 'supporting')
) as c(module_slug, card_id, sort_order, role)
  on c.module_slug = m.slug
on conflict (itinerary_module_id, knowledge_card_id) do nothing;

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
    'chengdu',
    'cd-panda-entry',
    'cd-panda-soft-entry',
    'Panda Soft-Entry Half Day',
    'wildlife_route',
    'A Chengdu half-day that uses pandas as the most accessible emotional entry point before widening into park culture and local pace.',
    '{families,first-time visitors,Japan,Korea,Southeast Asia}',
    '{travelers wanting only specialist history or craft interpretation}',
    true,
    240,
    'medium',
    'medium',
    'low',
    5,
    '{https://www.chengdu.gov.cn/2024/05/27/c_550617.htm}'
  )
on conflict (slug) do update set
  theme_slug = excluded.theme_slug,
  title = excluded.title,
  type = excluded.type,
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
    'chengdu',
    'destination',
    'chengdu',
    'pace_profile',
    'Chengdu is strongest when food and pandas act as the easy entry points, while the route still leaves room for sitting, tasting, and neighborhood drift.',
    'https://www.unesco.org/en/creative-cities/chengdu',
    0.85,
    '2026-05-02',
    false
  ),
  (
    'chengdu',
    'destination',
    'chengdu',
    'best_trip_length',
    'Two to four nights is the sweet spot because the city rewards repetition, not just first impressions, even when travelers first come for pandas and food.',
    'https://www.nationalgeographic.com/travel/article/chengdu-ancient-teahouses-are-going-viral',
    0.77,
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
    'chengdu',
    'cd-city-life',
    'repeat-China-traveler pattern',
    'delight',
    'Visitors often come for pandas or food, then realize Chengdu feels easier to inhabit than to simply tour, which is exactly why it needs slower route design.',
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
    'Some travelers are excited by Sichuan food and pandas but worry the city will become either one long spicy challenge or an overly shallow mainstream route.',
    'medium',
    'mixed',
    'food expectation setting',
    'https://unesdoc.unesco.org/ark:/48223/pf0000192047'
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
    'chengdu',
    'seasia_diaspora',
    'cd-seasia-food-culture-angle',
    'A food-and-panda city where daily rhythm matters as much as the headline attractions',
    'Chengdu feels warm and socially readable to travelers who first enter through food or pandas and then stay for pace, ease, and local life.',
    '{flavor logic,pandas,tea houses,neighborhood ease,shared-table culture}',
    '{panda-only framing,restaurant list without city reading}',
    'Prompt to build a food-and-pace Chengdu plan'
  )
on conflict (slug) do update set
  headline_angle = excluded.headline_angle,
  main_emotional_hook = excluded.main_emotional_hook,
  supporting_points = excluded.supporting_points,
  avoid_points = excluded.avoid_points,
  cta_style = excluded.cta_style,
  updated_at = timezone('utc', now());

update public.destination_audience_fits
set
  rationale = 'Chengdu is a strong city for travelers who want food, pandas, and a more inhabitable urban China.',
  best_entry_angle = 'Lead with Sichuan flavor, pandas, and then open into tea-house rhythm and neighborhood pace.',
  updated_at = timezone('utc', now())
where destination_slug = 'chengdu' and audience_slug = 'north_america_cultural';

update public.destination_audience_fits
set
  rationale = 'The city works especially well for longer-stay travelers who value ease, sociability, food, and approachable major hooks like pandas.',
  best_entry_angle = 'Sell Chengdu as food-and-panda access that opens into lived culture rather than attraction count.',
  updated_at = timezone('utc', now())
where destination_slug = 'chengdu' and audience_slug = 'australia_cultural';

update public.destination_audience_fits
set
  rationale = 'Food, shared-table culture, pandas, and approachable urban rhythm make Chengdu an easy emotional entry point.',
  best_entry_angle = 'Emphasize flavor logic, panda appeal, and neighborhood warmth over restaurant listicles.',
  caution_note = 'Do not reduce the city to pandas or spicy-food dare culture.',
  updated_at = timezone('utc', now())
where destination_slug = 'chengdu' and audience_slug = 'seasia_diaspora';

update public.destination_comparisons
set
  why_left = 'Choose Chengdu if the traveler wants a city they can inhabit comfortably through food, pandas, tea, and local pace.',
  updated_at = timezone('utc', now())
where slug = 'compare-chengdu-chongqing-younger-traveler';

update public.destination_comparisons
set
  why_left = 'Choose Chengdu for food, pandas, neighborhood life, and a gentler city that opens up over time.',
  updated_at = timezone('utc', now())
where slug = 'compare-chengdu-beijing-repeat-visitor';
