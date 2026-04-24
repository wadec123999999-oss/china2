create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key,
  role text not null default 'traveler' check (role in ('traveler', 'expert', 'admin')),
  email text not null unique,
  locale text not null default 'en',
  timezone text not null default 'UTC',
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.experts (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null unique references public.profiles(id) on delete restrict,
  display_name text not null,
  city text not null,
  categories text[] not null default '{}',
  headline text not null,
  bio_en text not null,
  photo_url text,
  intro_video_url text,
  hourly_rate_cents bigint not null,
  half_day_rate_cents bigint,
  full_day_rate_cents bigint,
  min_booking_hours integer not null default 3,
  languages text[] not null default '{english}',
  status text not null default 'pending' check (status in ('pending', 'active', 'suspended')),
  stripe_account_id text unique,
  stripe_onboarded boolean not null default false,
  rating_avg numeric(3,2) not null default 0,
  rating_count integer not null default 0,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.expert_availability (
  id uuid primary key default gen_random_uuid(),
  expert_id uuid not null references public.experts(id) on delete restrict,
  starts_at timestamptz not null,
  ends_at timestamptz not null,
  status text not null default 'open' check (status in ('open', 'held', 'booked')),
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  constraint expert_availability_time_check check (ends_at > starts_at)
);

create table if not exists public.conversations (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.profiles(id) on delete restrict,
  anonymous_id text,
  brief jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now()),
  constraint conversations_owner_check check (user_id is not null or anonymous_id is not null)
);

create table if not exists public.bookings (
  id uuid primary key default gen_random_uuid(),
  traveler_id uuid not null references public.profiles(id) on delete restrict,
  expert_id uuid not null references public.experts(id) on delete restrict,
  conversation_id uuid references public.conversations(id) on delete restrict,
  starts_at timestamptz not null,
  duration_hours integer not null,
  meeting_point text,
  notes text,
  amount_total_cents bigint not null,
  amount_platform_cents bigint not null,
  amount_expert_cents bigint not null,
  currency text not null default 'usd',
  status text not null default 'pending_payment' check (status in ('pending_payment', 'paid', 'in_progress', 'completed', 'cancelled', 'refunded', 'disputed')),
  stripe_payment_intent_id text unique,
  stripe_checkout_session_id text unique,
  payout_released_at timestamptz,
  cancelled_at timestamptz,
  cancelled_by uuid references public.profiles(id) on delete restrict,
  refund_amount_cents bigint not null default 0,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.reviews (
  id uuid primary key default gen_random_uuid(),
  booking_id uuid not null unique references public.bookings(id) on delete restrict,
  traveler_id uuid not null references public.profiles(id) on delete restrict,
  expert_id uuid not null references public.experts(id) on delete restrict,
  rating integer not null check (rating between 1 and 5),
  comment text,
  created_at timestamptz not null default timezone('utc', now())
);

create table if not exists public.audit_log (
  id uuid primary key default gen_random_uuid(),
  actor_id uuid references public.profiles(id) on delete restrict,
  action text not null,
  entity_type text not null,
  entity_id uuid,
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default timezone('utc', now())
);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = timezone('utc', now());
  return new;
end;
$$;

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  insert into public.profiles (id, email)
  values (new.id, coalesce(new.email, ''))
  on conflict (id) do nothing;

  return new;
end;
$$;

drop trigger if exists set_profiles_updated_at on public.profiles;
create trigger set_profiles_updated_at
before update on public.profiles
for each row execute function public.set_updated_at();

drop trigger if exists set_experts_updated_at on public.experts;
create trigger set_experts_updated_at
before update on public.experts
for each row execute function public.set_updated_at();

drop trigger if exists set_expert_availability_updated_at on public.expert_availability;
create trigger set_expert_availability_updated_at
before update on public.expert_availability
for each row execute function public.set_updated_at();

drop trigger if exists set_conversations_updated_at on public.conversations;
create trigger set_conversations_updated_at
before update on public.conversations
for each row execute function public.set_updated_at();

drop trigger if exists set_bookings_updated_at on public.bookings;
create trigger set_bookings_updated_at
before update on public.bookings
for each row execute function public.set_updated_at();

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute function public.handle_new_user();
