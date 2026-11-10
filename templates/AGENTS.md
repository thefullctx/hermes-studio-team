# AGENTS.md — <project name>

Project rules for every agent on the team. Hermes loads this file automatically when it works in this folder. Owner: **Lead**.

## Project

- **Client / owner:** <name>
- **Type:** website / web app / mobile app
- **Repo:** <url>
- **Preview:** <url>
- **Production:** <url> (deploys need the founder's approval)

## Stack

<!-- Studio defaults. Change per project and record why in DECISIONS.md. -->
- Framework: <e.g. Next.js / Astro / Expo>
- Styling: <e.g. Tailwind with tokens from DESIGN.md>
- Data: <e.g. Postgres / SQLite / none>
- Hosting: <e.g. Vercel / Cloudflare / self-hosted>
- Package manager: <pnpm / npm / bun>

## Commands

```bash
<install command>
<dev command>
<test command>
<build command>
```

## Folder layout

```
/            project docs (BRIEF, PLAN, DESIGN, STATUS, QA, DECISIONS)
/design      Designer's assets
/src         application code
```

## Conventions

- Small commits with clear messages; the app runs after every commit.
- Secrets live in `.env` (never committed). `.env.example` lists the names.
- Placeholder content is marked `[PLACEHOLDER]` so it never ships by accident.

## Approvals

Checkpoints are defined in each agent's SOUL.md. Approvals are logged in `DECISIONS.md`. When in doubt, ask.
