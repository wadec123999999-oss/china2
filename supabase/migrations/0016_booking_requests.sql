create table if not exists public.booking_requests (
  id uuid primary key default gen_random_uuid(),
  traveler_id uuid references public.profiles(id) on delete set null,
  traveler_email text,
  expert_slug text,
  expert_city text,
  expert_type text,
  duration_hours integer not null default 3,
  preferred_date date,
  time_window text not null default 'flexible' check (time_window in ('morning', 'afternoon', 'evening', 'flexible')),
  notes text,
  amount_total_cents bigint,
  currency text not null default 'usd',
  status text not null default 'draft' check (status in ('draft', 'submitted', 'pending_payment', 'paid', 'confirmed', 'cancelled')),
  identity_release_status text not null default 'locked' check (identity_release_status in ('locked', 'released')),
  source text not null default 'booking_preview',
  metadata jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default timezone('utc', now()),
  updated_at timestamptz not null default timezone('utc', now())
);

drop trigger if exists set_booking_requests_updated_at on public.booking_requests;
create trigger set_booking_requests_updated_at
before update on public.booking_requests
for each row execute function public.set_updated_at();

alter table public.booking_requests enable row level security;

drop policy if exists "booking_requests_traveler_read" on public.booking_requests;
create policy "booking_requests_traveler_read"
on public.booking_requests
for select
using (traveler_id = auth.uid());

drop policy if exists "booking_requests_traveler_insert" on public.booking_requests;
create policy "booking_requests_traveler_insert"
on public.booking_requests
for insert
with check (traveler_id = auth.uid());
