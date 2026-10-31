-- Quest Island: one-time database setup.
-- Paste all of this into Supabase > SQL Editor > New query, then press Run.

create table if not exists public.family_state (
  user_id    uuid primary key default auth.uid() references auth.users (id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

-- Only the signed-in family account can see or change its own row.
alter table public.family_state enable row level security;

drop policy if exists "family reads own data"   on public.family_state;
drop policy if exists "family inserts own data" on public.family_state;
drop policy if exists "family updates own data" on public.family_state;

create policy "family reads own data"   on public.family_state for select using (auth.uid() = user_id);
create policy "family inserts own data" on public.family_state for insert with check (auth.uid() = user_id);
create policy "family updates own data" on public.family_state for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Signed-in users may use the table (the rules above still limit them to their own row); anonymous visitors may not.
grant select, insert, update on public.family_state to authenticated;
revoke all on public.family_state from anon;
