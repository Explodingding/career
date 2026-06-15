-- ============================================================
-- Rita's Career Command Center — Supabase schema
-- How to use:
--   1. In your Supabase project, open: SQL Editor > New query
--   2. Paste this whole file and click "Run".
-- ============================================================

-- 1) ACTION PLAN -------------------------------------------------
create table if not exists public.action_items (
  id         uuid primary key default gen_random_uuid(),
  task       text not null,
  phase      text,                       -- e.g. 'June – Preparation'
  due_date   date,
  status     text not null default 'todo',   -- todo | in_progress | done
  notes      text,
  sort       int  default 0,
  created_at timestamptz default now()
);

-- 2) DOCUMENT HUB ------------------------------------------------
create table if not exists public.documents (
  id         uuid primary key default gen_random_uuid(),
  name       text not null,
  status     text not null default 'todo',   -- todo | in_progress | done
  owner      text,
  due_date   date,
  link       text,
  notes      text,
  sort       int  default 0,
  created_at timestamptz default now()
);

-- 3) JOB TRACKER -------------------------------------------------
create table if not exists public.jobs (
  id         uuid primary key default gen_random_uuid(),
  company    text not null,
  role       text,
  type       text,                        -- 'IND sponsor' | 'Payroll'
  status     text not null default 'researching', -- researching | applied | interview | offer | rejected
  salary     text,
  contact    text,
  notes      text,
  sort       int  default 0,
  created_at timestamptz default now()
);

-- ============================================================
-- Row Level Security: only logged-in (authenticated) users
-- can read or write. The public "anon" key alone sees nothing.
-- ============================================================
alter table public.action_items enable row level security;
alter table public.documents    enable row level security;
alter table public.jobs         enable row level security;

create policy "authenticated full access" on public.action_items
  for all to authenticated using (true) with check (true);

create policy "authenticated full access" on public.documents
  for all to authenticated using (true) with check (true);

create policy "authenticated full access" on public.jobs
  for all to authenticated using (true) with check (true);

-- ============================================================
-- Optional seed data (the items we already drafted).
-- Safe to delete this block if you prefer to start empty.
-- ============================================================
insert into public.documents (name, status, owner, notes, sort) values
  ('Expert CV (Dutch corporate version)', 'in_progress', 'Łukasz', 'Draft built; pending phone/LinkedIn/MSc details', 1),
  ('LinkedIn profile optimisation',       'todo',        'Ritah',  'Sustainability / ESG keywords', 2),
  ('IDW / Nuffic diploma evaluation',     'todo',        'Ritah',  'Critical for IND; evaluate BA + MSc', 3),
  ('References from Dutch professors',    'todo',        'Ritah',  'Strengthen local credibility', 4);

insert into public.action_items (task, phase, status, notes, sort) values
  ('Rebuild CV to expert (Mid/Senior) version', 'June – Preparation', 'in_progress', 'Justify €5,500 threshold', 1),
  ('Submit IDW/Nuffic diploma evaluation',      'June – Preparation', 'todo',        'Confirm cost & requirements', 2),
  ('Optimise LinkedIn for Sustainability',      'June – Preparation', 'todo',        'Arcadis, RHDHV, Sweco, Tauw', 3),
  ('Shortlist 10 target companies + payroll',   'July/Aug – Recruitment', 'todo',     'IND sponsors & EoR agencies', 4);
