alter table public.profiles enable row level security;
alter table public.experts enable row level security;
alter table public.expert_availability enable row level security;
alter table public.conversations enable row level security;
alter table public.bookings enable row level security;
alter table public.reviews enable row level security;
alter table public.audit_log enable row level security;

create policy "profiles_select_self"
on public.profiles
for select
using (auth.uid() = id);

create policy "profiles_update_self"
on public.profiles
for update
using (auth.uid() = id)
with check (auth.uid() = id);

create policy "experts_public_read_active"
on public.experts
for select
using (status = 'active');

create policy "experts_owner_update"
on public.experts
for update
using (profile_id = auth.uid())
with check (profile_id = auth.uid());

create policy "expert_availability_public_read_for_active_experts"
on public.expert_availability
for select
using (
  exists (
    select 1
    from public.experts
    where public.experts.id = expert_availability.expert_id
      and public.experts.status = 'active'
  )
);

create policy "expert_availability_owner_manage"
on public.expert_availability
for all
using (
  exists (
    select 1
    from public.experts
    where public.experts.id = expert_availability.expert_id
      and public.experts.profile_id = auth.uid()
  )
)
with check (
  exists (
    select 1
    from public.experts
    where public.experts.id = expert_availability.expert_id
      and public.experts.profile_id = auth.uid()
  )
);

create policy "conversations_owner_read"
on public.conversations
for select
using (user_id = auth.uid());

create policy "conversations_owner_insert"
on public.conversations
for insert
with check (user_id = auth.uid());

create policy "conversations_owner_update"
on public.conversations
for update
using (user_id = auth.uid())
with check (user_id = auth.uid());

create policy "bookings_traveler_read"
on public.bookings
for select
using (traveler_id = auth.uid());

create policy "bookings_traveler_insert"
on public.bookings
for insert
with check (traveler_id = auth.uid());

create policy "bookings_expert_read"
on public.bookings
for select
using (
  exists (
    select 1
    from public.experts
    where public.experts.id = bookings.expert_id
      and public.experts.profile_id = auth.uid()
  )
);

create policy "reviews_public_read"
on public.reviews
for select
using (true);

create policy "reviews_traveler_insert_own"
on public.reviews
for insert
with check (traveler_id = auth.uid());
