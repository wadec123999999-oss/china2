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
    'wudang_mountain',
    'wd-taoist-mountain',
    'Taoist Culture and Sacred Mountain',
    'heritage',
    'Wudang is strongest when framed through Taoist culture, sacred mountain space, temple architecture, and the idea that landscape itself can shape spiritual practice.',
    'This gives foreign travelers a clear reason to visit Wudang beyond scenery or martial-arts performance.',
    1
  ),
  (
    'wudang_mountain',
    'wd-internal-practice',
    'Taiji and Internal Practice',
    'practice',
    'Taiji and internal practice make Wudang experiential: travelers can understand the mountain through breath, posture, slowness, and disciplined movement.',
    'This turns Wudang from a site to look at into a place to feel through the body.',
    2
  ),
  (
    'wudang_mountain',
    'wd-reflective-china',
    'Reflective China: Philosophy, Breath, and Pace',
    'wellness',
    'Wudang is one of the best places to present a reflective, restrained, interior side of China to foreign visitors.',
    'This is valuable for premium, spiritually curious, and wellness-oriented travelers.',
    3
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
    'wd_taoist_mountain',
    'wudang_mountain',
    'wd-taoist-mountain',
    'Taoist Culture and Sacred Mountain',
    'heritage',
    'Wudang is best explained as a Taoist sacred mountain where architecture, landscape, ritual order, and mountain paths belong to one cultural system.',
    'A mountain where Taoist thought is made visible through architecture and route.',
    'This is the strongest reason to come to Wudang if the traveler wants meaning rather than only scenery.',
    '{philosophy travelers,academic groups,Europe,United States,heritage travelers}',
    '{travelers seeking only casual mountain views}',
    '{https://whc.unesco.org/en/list/705/,https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html}',
    'mixed',
    5
  ),
  (
    'wd_internal_practice',
    'wudang_mountain',
    'wd-internal-practice',
    'Taiji and Internal Practice',
    'practice',
    'Taiji and Wudang internal practice give travelers a direct way to experience breath, posture, slowness, and the disciplined side of Taoist culture.',
    'The body becomes part of the interpretation, not just the camera.',
    'This is the practical experiential layer that makes Wudang different from a normal heritage mountain.',
    '{martial arts travelers,wellness travelers,North America,Europe,entry-level cultural travelers}',
    '{travelers expecting only performance-style martial arts entertainment}',
    '{https://www.globaltimes.cn/page/202306/1291971.shtml,https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html}',
    'mixed',
    5
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
    'wudang_mountain',
    null,
    'Why should I visit Wudang Mountain?',
    'Come to Wudang for Taoist culture, sacred mountain architecture, and Taiji or internal practice. The strongest version of Wudang is not a performance stop; it is a reflective mountain journey where philosophy, movement, and place belong together.',
    '{positioning,wudang,taiji}',
    '{wd_taoist_mountain,wd_internal_practice}'
  ),
  (
    'wudang_mountain',
    null,
    'Is Wudang about kung fu or Taiji?',
    'For this product, Wudang should be framed through Taoist culture and Taiji-style internal practice rather than show-style kung fu. Beginners can still appreciate it if the experience is explained through breath, posture, and mountain rhythm.',
    '{wudang,taiji,entry-level}',
    '{wd_internal_practice,wd_reflective_china}'
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
    'wudang_mountain',
    'wd-taoist-taiji-day',
    'Taoist Culture and Taiji Day',
    8,
    'immersive',
    'A route that links Taoist sacred architecture, mountain rhythm, and a beginner-friendly Taiji or internal-practice session.',
    'Wudang works best when travelers first understand the sacred mountain frame, then experience movement as part of that frame.',
    '{philosophy travelers,wellness travelers,martial arts travelers,Europe,United States}',
    'Build a Wudang route around Taoist culture and Taiji'
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
    ('wd-taoist-taiji-day', 'wd_taoist_mountain', 1, 'core'),
    ('wd-taoist-taiji-day', 'wd_internal_practice', 2, 'core'),
    ('wd-taoist-taiji-day', 'wd_reflective_china', 3, 'supporting')
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
    'wudang_mountain',
    'wd-internal-practice',
    'wd-beginner-taiji-session',
    'Beginner Taiji and Internal Practice Session',
    'practice_session',
    'A beginner-friendly session that introduces Wudang through Taiji, breath, posture, and internal rhythm rather than performance spectacle.',
    '{wellness travelers,martial arts travelers,North America,Europe,entry-level cultural travelers}',
    '{travelers expecting high-intensity combat training or stage performance}',
    true,
    90,
    'medium',
    'high',
    'medium',
    3,
    '{https://www.globaltimes.cn/page/202306/1291971.shtml,https://www.fohb.gov.cn/info/2022-08/20220817112700_299.html}'
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
    'wudang_mountain',
    'north_america_cultural',
    'wd-north-america-taiji-angle',
    'A Taoist sacred mountain where Taiji, architecture, and reflective pace belong together',
    'Wudang offers a way into China through embodied practice and Taoist atmosphere rather than pure sightseeing.',
    '{Taoist culture,Taiji,internal practice,sacred architecture,mountain atmosphere}',
    '{kung-fu-show framing,generic mountain tourism,spiritual cliche}',
    'Invitation to request a Wudang Taoist culture and Taiji route'
  )
on conflict (slug) do update set
  headline_angle = excluded.headline_angle,
  main_emotional_hook = excluded.main_emotional_hook,
  supporting_points = excluded.supporting_points,
  avoid_points = excluded.avoid_points,
  cta_style = excluded.cta_style,
  updated_at = timezone('utc', now());

update public.destination_positioning_briefs
set
  signature_hook = 'A Taoist sacred mountain for architecture, Taiji, and internal practice',
  why_visit = 'Travelers should come to Wudang because it gives access to a quieter and more interior side of China through Taoist culture, sacred mountain architecture, Taiji, internal practice, and a pace that feels reflective rather than performative.',
  sell_points = '{Taoist culture and sacred architecture,Taiji and internal practice,mountain atmosphere,reflective pace}',
  conversion_pitch = 'Sell Wudang as a place to experience Taoist culture and Taiji in a sacred mountain setting, not just to watch a martial-arts performance.',
  updated_at = timezone('utc', now())
where destination_slug = 'wudang_mountain';
