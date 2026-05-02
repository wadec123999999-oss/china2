create table if not exists public.destination_positioning_briefs (
  id uuid primary key default gen_random_uuid(),
  destination_slug text not null references public.destinations(slug) on delete cascade,
  signature_hook text not null,
  why_visit text not null,
  sell_points text[] not null default '{}',
  best_for text[] not null default '{}',
  avoid_framing text[] not null default '{}',
  conversion_pitch text not null,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  unique (destination_slug)
);

drop trigger if exists set_destination_positioning_briefs_updated_at on public.destination_positioning_briefs;
create trigger set_destination_positioning_briefs_updated_at
before update on public.destination_positioning_briefs
for each row execute function public.set_updated_at();

insert into public.destination_positioning_briefs (
  destination_slug,
  signature_hook,
  why_visit,
  sell_points,
  best_for,
  avoid_framing,
  conversion_pitch
)
values
  (
    'quanzhou',
    'A Maritime Silk Road world-port city with religious diversity and Hokkien memory',
    'Travelers should come to Quanzhou because it offers one of the rarest combinations in China: UNESCO-level port history, visible multi-faith heritage, Minnan diaspora roots, and a lived old-city food culture that still feels grounded rather than over-packaged.',
    '{Maritime Silk Road and UNESCO,visible religious diversity,Hokkien roots and diaspora memory,food as daily life,tea porcelain and incense extensions}',
    '{Southeast Asian diaspora,Middle East heritage,Europe heritage,academic groups,slow cultural travelers}',
    '{generic beach city,cheap hidden gem,old-town without explanation}',
    'Sell Quanzhou as a selective, high-context city for travelers who want exchange history, identity, and lived texture rather than a generic China checklist.'
  ),
  (
    'beijing',
    'The clearest first-stop city for understanding China through capital order and neighborhood life',
    'Travelers should come to Beijing because no other city in the project explains China so clearly through imperial scale, political space, urban order, and the contrast between ceremonial history and intimate hutong life.',
    '{imperial order and political space,Central Axis and capital structure,hutong texture and courtyard life,calligraphy and cultivated practice}',
    '{first-time China visitors,North America cultural,Europe heritage,academic and museum groups}',
    '{monument checklist,rushed capital day trip,Great Wall only}',
    'Sell Beijing as the city that gives structure to a first China journey, not as a pile of landmarks.'
  ),
  (
    'jingdezhen',
    'A global porcelain city where craft, kilns, and material knowledge still feel alive',
    'Travelers should come to Jingdezhen because porcelain is already a global language, and this is one of the few places in China where imperial craft history, living studios, and object culture still connect in a way foreign visitors can quickly understand.',
    '{porcelain capital,imperial kiln history,living workshops and studios,material knowledge and collecting culture}',
    '{Japan culture,Europe heritage,design travelers,makers,collectors,academic groups}',
    '{souvenir town,one-hour pottery gimmick,shopping-led destination}',
    'Sell Jingdezhen as an object-and-process city for travelers who want to understand beauty through making.'
  ),
  (
    'chengdu',
    'A food-and-panda city that opens into tea-house rhythm and easy urban life',
    'Travelers should come to Chengdu because it offers two instant hooks that travel well globally, Sichuan food and pandas, and then deepens into one of the most comfortable, socially readable, and repeatable city experiences in China.',
    '{Sichuan food,pandas,tea-house rhythm,neighborhood ease,slow urban pleasure}',
    '{food travelers,families,first-time visitors,repeat China visitors,travelers who like atmosphere over monuments}',
    '{panda-only tourism,spicy-food dare culture,restaurant list without interpretation}',
    'Sell Chengdu as an easy city to love first and a deeper city to stay with longer.'
  ),
  (
    'chongqing',
    'A cyberpunk-feeling 8D mountain city with neon night drama and real urban depth',
    'Travelers should come to Chongqing because few cities in the world deliver this level of surreal topography, stacked movement, river drama, and night intensity, while still offering enough appetite, labor, and historical layers to become more than pure spectacle.',
    '{8D mountain-city structure,neon night energy,hotpot and dense local appetite,wartime resilience and urban drama}',
    '{photography travelers,younger travelers,urbanists,Korea visual culture,travelers who want bold contemporary China}',
    '{empty cyberpunk cliche,viewpoint-only city,hotpot-only gimmick}',
    'Sell Chongqing as a visually overwhelming city that becomes more valuable once the geography and local life are explained.'
  ),
  (
    'jingmai_mountain',
    'An ancient tea landscape for slow, reflective, ecology-minded travel',
    'Travelers should come to Jingmai because it is one of the strongest destinations in the project for tea, stillness, village continuity, and cultural atmosphere, especially for people who want quiet depth instead of checklist movement.',
    '{ancient tea forests,village continuity,tea ritual and ecology,contemplative retreat pacing}',
    '{tea travelers,wellness slow travel,Australia cultural,Japan culture,premium slow travelers}',
    '{generic mountain escape,scenic drive only,fast day trip}',
    'Sell Jingmai as a destination for travelers who want to slow down enough to feel place, not just see it.'
  ),
  (
    'wudang_mountain',
    'A Taoist sacred mountain for architecture, internal practice, and Taiji culture',
    'Travelers should come to Wudang because it gives access to a quieter and more interior side of China through Taoist culture, mountain architecture, Taiji and internal practice, and a pace that feels reflective rather than performative.',
    '{Taoist culture and sacred architecture,Taiji and internal practice,mountain atmosphere,reflective pace}',
    '{philosophy travelers,martial arts and movement travelers,wellness slow travel,Europe heritage,North America cultural}',
    '{kung fu show only,generic mountain tourism,spiritual cliche}',
    'Sell Wudang as a place to experience Taoist pace and embodied culture, not just to watch performance.'
  )
on conflict (destination_slug) do update set
  signature_hook = excluded.signature_hook,
  why_visit = excluded.why_visit,
  sell_points = excluded.sell_points,
  best_for = excluded.best_for,
  avoid_framing = excluded.avoid_framing,
  conversion_pitch = excluded.conversion_pitch,
  updated_at = timezone('utc', now());
