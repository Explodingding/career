-- ============================================================
-- Knowledge Base notes — run this in Supabase (SQL Editor > Run)
-- Adds an editable, synced "Our notes & findings" table.
-- ============================================================
create table if not exists public.kb_notes (
  id         uuid primary key default gen_random_uuid(),
  title      text not null,
  category   text default 'Other',   -- Visa/IND | Diploma | Payroll | Market | Employer | Other
  content    text,
  link       text,
  sort       int  default 0,
  created_at timestamptz default now()
);

alter table public.kb_notes enable row level security;

create policy "authenticated full access" on public.kb_notes
  for all to authenticated using (true) with check (true);
