insert into public.profiles (id, role, email, locale, timezone)
values
  ('11111111-1111-1111-1111-111111111111', 'expert', 'wei.chen@china-insider.test', 'en', 'Asia/Shanghai'),
  ('22222222-2222-2222-2222-222222222222', 'expert', 'mei.zhang@china-insider.test', 'en', 'Asia/Shanghai'),
  ('33333333-3333-3333-3333-333333333333', 'expert', 'lin.qiu@china-insider.test', 'en', 'Asia/Shanghai'),
  ('44444444-4444-4444-4444-444444444444', 'expert', 'yan.luo@china-insider.test', 'en', 'Asia/Shanghai'),
  ('55555555-5555-5555-5555-555555555555', 'expert', 'hao.tang@china-insider.test', 'en', 'Asia/Shanghai')
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
    'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa',
    '11111111-1111-1111-1111-111111111111',
    'Wei Chen',
    'jingdezhen',
    '{porcelain}',
    'Ceramic historian and working porcelain maker',
    'Wei leads deep-dive porcelain experiences through kiln history, studio practice, and collecting culture in Jingdezhen.',
    18000,
    50000,
    90000,
    3,
    '{english,mandarin}',
    'active',
    false
  ),
  (
    'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb',
    '22222222-2222-2222-2222-222222222222',
    'Mei Zhang',
    'chengdu',
    '{tea,sichuan_food}',
    'Tea educator and Sichuan food culture guide',
    'Mei connects tea practice with Sichuan daily life, markets, and culinary traditions for curious travelers.',
    16000,
    46000,
    82000,
    3,
    '{english,mandarin}',
    'active',
    false
  ),
  (
    'cccccccc-cccc-cccc-cccc-cccccccccccc',
    '33333333-3333-3333-3333-333333333333',
    'Lin Qiu',
    'quanzhou',
    '{maritime_silk_road,photography}',
    'Historian of ports, trade, and living heritage',
    'Lin explores Quanzhou through maritime exchange, architecture, temples, and contemporary local memory.',
    17000,
    48000,
    85000,
    3,
    '{english,mandarin}',
    'active',
    false
  ),
  (
    'dddddddd-dddd-dddd-dddd-dddddddddddd',
    '44444444-4444-4444-4444-444444444444',
    'Yan Luo',
    'beijing',
    '{calligraphy,photography,tcm}',
    'Calligraphy instructor and Beijing culture researcher',
    'Yan designs intellectually rich sessions across calligraphy, urban memory, and traditional wellness culture.',
    19000,
    52000,
    94000,
    3,
    '{english,mandarin}',
    'active',
    false
  ),
  (
    'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee',
    '55555555-5555-5555-5555-555555555555',
    'Hao Tang',
    'chongqing',
    '{sichuan_food,photography}',
    'Mountain city photographer and food scene interpreter',
    'Hao helps travelers understand Chongqing through layered urban space, visual culture, and bold local flavors.',
    15500,
    43000,
    78000,
    3,
    '{english,mandarin}',
    'active',
    false
  )
on conflict (id) do nothing;
