# Ritah's Career Command Center

A private, single-file web dashboard that serves as the command center for Ritah Twasiima's career &amp; relocation strategy in the Netherlands. It tracks the path toward securing a **Highly Skilled Migrant (Kennismigrant)** visa before the current Exchange program ends on **October 31, 2026**.

## Goal

Secure a job offer of **€5,500+ gross/month** with an IND sponsor (directly or via a payroll / Employer of Record agency) in the Environmental / Natural Resources / Sustainability sector before the visa deadline.

## Features

The dashboard is a single `index.html` file with five tabs, all rendered from one
`DATA` object in JavaScript (the project's knowledge "database"):

- **Overview** — live countdown to the visa deadline, quick stats (derived from the data), next steps, weekly goals.
- **Action Plan** — phased timeline (June: Preparation → July/August: Recruitment → September: Visa/Payroll → October: buffer) with checkable tasks and per-phase progress.
- **Document Hub** — checklist with click-to-cycle statuses (To do → In progress → Done) for CV, LinkedIn, IDW/Nuffic, references, portfolio, residence docs.
- **Job Tracker** — table of target companies & applications (company, role, IND-sponsor / payroll / agency, status, notes) with click-to-advance status pills.
- **Knowledge Base** — IND rules & routes, vetted expat career agencies and IND-certified payroll sponsors (Together Abroad, Blue Lynx, Undutchables, All About Expats, Expat Republic, Noomii), target employers, and agency meeting-prep guidance.

### Data model & persistence

All content lives in a single `DATA` object near the top of the `<script>` in
`index.html`. To extend the knowledge base, add an entry there and every tab
updates automatically. Interactive state (checked tasks/goals, document and job
statuses) is saved to `localStorage` under the key `ritah-cc-v1`, so progress
survives reloads on the same browser.

> Note: IND salary figures are project targets — verify the current-year
> thresholds at [ind.nl](https://ind.nl) before filing.

## Tech stack

- HTML5 + vanilla JavaScript (tab switching, countdown, interactivity)
- Tailwind CSS (via CDN)
- FontAwesome icons (via CDN)

No build step — everything loads from CDNs and runs offline-friendly in any modern browser.

## Run locally

Open `index.html` in a browser, or serve the folder:

```bash
python -m http.server 8000
# then visit http://localhost:8000
```

## Deployment

The site is deployed to **GitHub Pages** automatically via GitHub Actions (`.github/workflows/deploy.yml`) on every push to `main`. To enable it, set **Settings → Pages → Build and deployment → Source → GitHub Actions** once.

## Conventions

All code and content are written in **English**. Project notes and chat may be in Polish.
