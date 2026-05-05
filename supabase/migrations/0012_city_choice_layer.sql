create table if not exists public.destination_audience_fits (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  audience_slug text not null references public.traveler_audiences(slug) on delete cascade,
  fit_score integer not null check (fit_score between 1 and 5),
  rationale text not null,
  best_entry_angle text not null,
  trip_length_hint text,
  caution_note text,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  unique (destination_slug, audience_slug)
);

create table if not exists public.destination_comparisons (
  id uuid primary key default gen_random_uuid(),
  slug text not null unique,
  left_destination_slug text not null references public.destinations(slug) on delete cascade,
  right_destination_slug text not null references public.destinations(slug) on delete cascade,
  audience_slug text references public.traveler_audiences(slug) on delete set null,
  comparison_question text not null,
  short_answer text not null,
  why_left text not null,
  why_right text not null,
  deciding_factor text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

drop trigger if exists set_destination_audience_fits_updated_at on public.destination_audience_fits;
create trigger set_destination_audience_fits_updated_at
before update on public.destination_audience_fits
for each row execute function public.set_updated_at();

drop trigger if exists set_destination_comparisons_updated_at on public.destination_comparisons;
create trigger set_destination_comparisons_updated_at
before update on public.destination_comparisons
for each row execute function public.set_updated_at();

create index if not exists idx_destination_audience_fits_audience
  on public.destination_audience_fits(audience_slug, fit_score desc);

create index if not exists idx_destination_comparisons_pair
  on public.destination_comparisons(left_destination_slug, right_destination_slug);

insert into public.traveler_audiences (slug, name, market_scope, description, trip_motive)
values
  (
    'first_time_china',
    'First-time China Travelers',
    'global',
    'Travelers who need a clear first framework for understanding China before moving into more specialized destinations.',
    'orientation, iconic context, lower-friction planning, and confidence building'
  ),
  (
    'wellness_slow_travel',
    'Wellness and Slow Travel Guests',
    'global',
    'Travelers seeking restorative pace, embodied culture, nature, tea, movement, and reflective settings without generic wellness packaging.',
    'slow pace, mountain routes, tea, practice, quiet, and cultural substance'
  )
on conflict (slug) do update set
  name = excluded.name,
  market_scope = excluded.market_scope,
  description = excluded.description,
  trip_motive = excluded.trip_motive,
  updated_at = timezone('utc', now());

insert into public.destination_audience_fits (
  destination_slug,
  audience_slug,
  fit_score,
  rationale,
  best_entry_angle,
  trip_length_hint,
  caution_note
)
values
  (
    'quanzhou',
    'seasia_diaspora',
    5,
    'Quanzhou is one of the strongest cities in the project for Hokkien roots, temple continuity, and food-memory travel.',
    'Lead with Hokkien homeland, religious texture, and food memory rather than generic old-town sightseeing.',
    'Two to three nights is the strongest minimum.',
    'Weak if sold as a beach stop or generic hidden-gem city.'
  ),
  (
    'quanzhou',
    'middle_east_heritage',
    5,
    'The city offers an unusually strong China entry point through Islamic memory, port exchange, and multi-faith heritage.',
    'Lead with Quanzhou as a maritime exchange city rather than only as a Fujian old town.',
    'Two nights works; three allows incense or craft extension.',
    'Needs strong interpretation to avoid becoming abstract.'
  ),
  (
    'quanzhou',
    'family_roots',
    5,
    'Roots-oriented travelers can find unusual emotional value in the Hokkien and migration story.',
    'Frame the visit as identity and continuity, not just heritage.',
    'Two to three nights.',
    'Personal meaning falls if the trip is over-packed with unrelated attractions.'
  ),
  (
    'beijing',
    'north_america_cultural',
    5,
    'Beijing is still the clearest first-stop city for travelers who want a structured understanding of China through space, power, and history.',
    'Lead with Central Axis, imperial order, and hutong texture on the same trip.',
    'Three to four nights.',
    'Can feel too checklist-driven if not balanced with intimate neighborhood reading.'
  ),
  (
    'beijing',
    'academic_museum',
    5,
    'The capital has the highest interpretive density for state, ritual, architecture, and urban history.',
    'Position Beijing as a city to read, not just a list of landmarks.',
    'Three to five nights.',
    'Physical and cognitive overload rises fast if each day is oversized.'
  ),
  (
    'beijing',
    'first_time_china',
    5,
    'For many foreign travelers, Beijing gives the strongest conceptual entry into China before more specialized cities.',
    'Start with big civic order, then move quickly to livable texture and human scale.',
    'Three nights minimum.',
    'Not ideal if the traveler only wants soft pace and minimal historical framing.'
  ),
  (
    'jingdezhen',
    'japan_culture',
    5,
    'Jingdezhen is highly legible to Japan-facing craft and object-culture travelers.',
    'Lead with porcelain knowledge, form, material process, and studio continuity.',
    'One to two nights.',
    'Gets flattened if sold as a souvenir stop.'
  ),
  (
    'jingdezhen',
    'academic_museum',
    5,
    'The city is one of the strongest project destinations for material culture, collecting, and decorative-arts interpretation.',
    'Use kiln history and object judgment as the core frame.',
    'Two nights preferred.',
    'Needs good access filtering to separate serious studios from tourist workshops.'
  ),
  (
    'jingdezhen',
    'europe_heritage',
    4,
    'Blanc de Chine and porcelain trade history make the city legible to European decorative-arts and museum audiences.',
    'Frame the destination through global taste, craft history, and living production.',
    'One to two nights.',
    'Less effective for travelers who want broad city atmosphere over object culture.'
  ),
  (
    'chengdu',
    'north_america_cultural',
    4,
    'Chengdu is a strong city for travelers who want daily life, food culture, and a more inhabitable urban China.',
    'Lead with tea-house rhythm, neighborhood pace, and food as social culture.',
    'Two to four nights.',
    'Less suitable if the traveler wants strong monument or dynasty framing.'
  ),
  (
    'chengdu',
    'australia_cultural',
    5,
    'The city works especially well for longer-stay travelers who value ease, sociability, and local pace.',
    'Sell Chengdu as lived culture rather than attraction count.',
    'Three to four nights.',
    'Can sound too soft unless the route has enough structure.'
  ),
  (
    'chengdu',
    'seasia_diaspora',
    4,
    'Food, shared-table culture, and approachable urban rhythm make Chengdu an easy emotional entry point.',
    'Emphasize flavor logic and neighborhood warmth over restaurant listicles.',
    'Two to three nights.',
    'Do not reduce the city to pandas or spicy-food dare culture.'
  ),
  (
    'chongqing',
    'korea_visual_culture',
    5,
    'Chongqing has one of the strongest cyberpunk 8D visual hooks in the whole project for this audience.',
    'Lead with verticality, maze-like movement, neon, appetite, and night atmosphere.',
    'Two to three nights.',
    'Needs pace control so the trip does not become pure photo-chasing.'
  ),
  (
    'chongqing',
    'north_america_cultural',
    4,
    'The city becomes compelling when framed as 8D geography, resilience, and urban structure rather than only skyline spectacle.',
    'Use topography, neon night movement, wartime layers, and appetite as one story.',
    'Two to three nights.',
    'Can be too intense for travelers needing calm, low-friction pacing.'
  ),
  (
    'chongqing',
    'photography_style',
    5,
    'The mountain-city structure, river edges, neon, and night drama produce a very strong 8D visual route logic.',
    'Sell the city as a spatial experience, not just a set of angles or viewpoints.',
    'Two nights can work well.',
    'Without interpretation it collapses into internet-famous spots.'
  ),
  (
    'jingmai_mountain',
    'australia_cultural',
    5,
    'Jingmai is a very strong fit for slow, premium, ecology-minded travelers who want atmosphere over volume.',
    'Lead with ancient tea forests, village continuity, and quiet pacing.',
    'Two nights preferred.',
    'Not ideal for travelers expecting polished urban luxury.'
  ),
  (
    'jingmai_mountain',
    'japan_culture',
    4,
    'Tea ritual, cultivation logic, and quiet attentiveness make Jingmai relevant for Japan-facing cultural travel.',
    'Frame the trip through tea ecology and continuity rather than scenery.',
    'Two nights.',
    'Needs careful expectation-setting around rural comfort and access.'
  ),
  (
    'jingmai_mountain',
    'wellness_slow_travel',
    5,
    'This is one of the strongest cities in the project for quiet, restorative, slow-pace travel with cultural substance.',
    'Lead with stillness, tea, and light-footed immersion.',
    'Two to three nights.',
    'Fails if sold as a rushed day trip.'
  ),
  (
    'wudang_mountain',
    'europe_heritage',
    5,
    'Wudang is highly differentiated for sacred architecture, Taoist thought, and mountain atmosphere.',
    'Lead with Taoist sacred space and embodied reflection rather than martial display.',
    'Two nights preferred.',
    'Easy to mis-sell as a kung fu show destination.'
  ),
  (
    'wudang_mountain',
    'north_america_cultural',
    4,
    'The destination works well for reflective travelers who want a quieter route into China.',
    'Use mountain pace, internal practice, and sacred architecture as the frame.',
    'Two nights.',
    'Less suitable for travelers wanting dense city variety.'
  ),
  (
    'wudang_mountain',
    'wellness_slow_travel',
    5,
    'Wudang combines movement, philosophy, and sacred setting in a way that fits slow-travel and wellness products.',
    'Frame it as reflective embodied culture, not performance tourism.',
    'Two to three nights.',
    'Need to qualify physical mobility and mountain access clearly.'
  )
on conflict (destination_slug, audience_slug) do update set
  fit_score = excluded.fit_score,
  rationale = excluded.rationale,
  best_entry_angle = excluded.best_entry_angle,
  trip_length_hint = excluded.trip_length_hint,
  caution_note = excluded.caution_note,
  updated_at = timezone('utc', now());

insert into public.destination_comparisons (
  slug,
  left_destination_slug,
  right_destination_slug,
  audience_slug,
  comparison_question,
  short_answer,
  why_left,
  why_right,
  deciding_factor
)
values
  (
    'compare-quanzhou-beijing-first-time-china',
    'quanzhou',
    'beijing',
    'first_time_china',
    'Should a first-time foreign visitor choose Quanzhou or Beijing?',
    'Beijing is usually the stronger first-stop for a broad understanding of China, while Quanzhou is better for travelers already drawn to maritime history, religion, or Hokkien roots.',
    'Choose Quanzhou if the traveler already knows they want a quieter, more specialized heritage city with port-world and diaspora depth.',
    'Choose Beijing if the traveler wants the clearest large-frame introduction to China through capital history and urban order.',
    'The real question is whether the traveler needs a broad China introduction or a more selective cultural proposition.'
  ),
  (
    'compare-quanzhou-jingdezhen-craft',
    'quanzhou',
    'jingdezhen',
    'academic_museum',
    'For a craft- and heritage-minded traveler, Quanzhou or Jingdezhen?',
    'Jingdezhen is stronger if the traveler wants material process, objects, and live craft culture. Quanzhou is stronger if they want trade routes, religion, and a broader port-world story.',
    'Choose Quanzhou for exchange history, diaspora memory, and multi-faith urban texture.',
    'Choose Jingdezhen for porcelain knowledge, kiln history, and studio access.',
    'The deciding factor is whether the trip is object-led or exchange-led.'
  ),
  (
    'compare-chengdu-chongqing-younger-traveler',
    'chengdu',
    'chongqing',
    'korea_visual_culture',
    'For a younger visually driven traveler, Chengdu or Chongqing?',
    'Chongqing usually wins on cyberpunk 8D intensity and night drama. Chengdu wins on ease, social warmth, and a softer rhythm.',
    'Choose Chengdu if the traveler wants a city they can inhabit comfortably through tea, food, and local pace.',
    'Choose Chongqing if they want movement, density, neon skyline drama, and a stronger wow effect.',
    'The deciding factor is whether the traveler wants comfort and ease or intensity and spectacle.'
  ),
  (
    'compare-chengdu-beijing-repeat-visitor',
    'chengdu',
    'beijing',
    'north_america_cultural',
    'For a repeat China visitor who wants depth, Chengdu or Beijing?',
    'Beijing is stronger for structured historical interpretation. Chengdu is stronger for daily-life immersion and lived urban rhythm.',
    'Choose Chengdu for food, neighborhood life, and a gentler city that opens up over time.',
    'Choose Beijing for architecture, ceremonial order, and interpretive density.',
    'The deciding factor is whether the traveler wants capital-scale understanding or inhabitable local pace.'
  ),
  (
    'compare-jingmai-wudang-slow-travel',
    'jingmai_mountain',
    'wudang_mountain',
    'wellness_slow_travel',
    'For slow reflective travel, Jingmai or Wudang?',
    'Jingmai is stronger for tea, ecology, and village continuity. Wudang is stronger for sacred architecture, Taoist atmosphere, and embodied practice.',
    'Choose Jingmai if the traveler wants stillness through tea landscape and rural continuity.',
    'Choose Wudang if they want reflective pacing with stronger philosophical and architectural framing.',
    'The deciding factor is whether stillness should come from tea ecology or mountain spiritual culture.'
  ),
  (
    'compare-jingdezhen-quanzhou-japan-culture',
    'jingdezhen',
    'quanzhou',
    'japan_culture',
    'For a Japan-facing cultural traveler, Jingdezhen or Quanzhou?',
    'Jingdezhen is the stronger fit when the trip is led by craft, form, and material knowledge. Quanzhou is stronger when the trip is led by maritime exchange, religion, and Minnan cultural memory.',
    'Choose Jingdezhen for studio culture, kilns, and object attention.',
    'Choose Quanzhou for world-port history, food, and layered old-city texture.',
    'The deciding factor is whether the trip begins with objects or with historical-cultural exchange.'
  ),
  (
    'compare-beijing-wudang-reflective-china',
    'beijing',
    'wudang_mountain',
    'north_america_cultural',
    'For a traveler seeking a more reflective side of China, Beijing or Wudang?',
    'Beijing is better for understanding the structure of China. Wudang is better for feeling a quieter, interior, more contemplative China.',
    'Choose Beijing for historical scale, civic order, and deep interpretation.',
    'Choose Wudang for sacred mountain atmosphere, Taoist pace, and embodied reflection.',
    'The deciding factor is whether the traveler wants interpretive scale or reflective stillness.'
  )
on conflict (slug) do update set
  comparison_question = excluded.comparison_question,
  short_answer = excluded.short_answer,
  why_left = excluded.why_left,
  why_right = excluded.why_right,
  deciding_factor = excluded.deciding_factor,
  updated_at = timezone('utc', now());
