# Ritah's Career Command Center

A private, single-file web dashboard that serves as the command center for Ritah Twasiima's career &amp; relocation strategy in the Netherlands. It tracks the path toward securing a **Highly Skilled Migrant (Kennismigrant)** visa before the current Exchange program ends on **October 31, 2026**.

## Goal

Secure a job offer of **€5,500+ gross/month** with an IND sponsor (directly or via a payroll / Employer of Record agency) in the Environmental / Natural Resources / Sustainability sector before the visa deadline.

## Features

The dashboard is a single `index.html` file with five tabs:

- **Overview** — live countdown to the visa deadline, quick stats, next steps, weekly goals.
- **Action Plan** — chronological timeline (June: Preparation → July/August: Recruitment → September: Visa / Payroll).
- **Document Hub** — checklist with statuses for CV, LinkedIn, IDW/Nuffic diploma evaluation, professor references.
- **Job Tracker** — table / Kanban of applications (company, role, IND-sponsor vs payroll, status, notes).
- **Knowledge Base** — IND salary thresholds, payroll agency contacts, Dutch job-market notes.

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
