# Hermes Studio Team

A ready-to-use AI build team for [Hermes Agent](https://github.com/NousResearch/hermes-agent): four agents that work together to design and ship websites, web apps and mobile apps, with human approval at every step that matters.

| Agent | Owns | Speaks up when |
|---|---|---|
| **Lead** | Brief, plan, decisions, final review | Anything not addressed to someone else |
| **Designer** | UX, design system, screens, copy | Addressed, or the topic is visual, UX or copy |
| **Engineer** | Code, tests, preview deploys, status | Addressed, or the topic is technical |
| **QA** *(optional 4th)* | Independent testing and a ready / not-ready verdict | Something is marked ready for review |

Start with Lead, Designer and Engineer. Until QA joins, the Lead does the review.

## How the team works

```
You ──▶ Lead ──▶ BRIEF.md + PLAN.md ──▶ ✋ approval 1
                                          │
               Designer ──▶ DESIGN.md ──▶ ✋ approval 2
                                          │
               Engineer ──▶ code + STATUS.md
                                          │
               QA (or Lead) ──▶ QA.md verdict ──▶ ✋ approval 5 (delivery)
```

Each Hermes profile has its own memory, so agents can't read each other's minds. They hand work over through files in a shared project folder. That's what `templates/` is for.

## Approval checkpoints

Every soul has the same rules: **silence is not approval, a teammate's approval doesn't count, and one approval covers one step.**

1. **Brief and plan** before any design or code
2. **Design direction** before full screens or UI code
3. **Scope, timeline or stack changes** after the plan is approved
4. **Anything outside the studio**: production deploys, domains, paid services, real accounts and APIs, deleting data, anything sent to a client (one at a time)
5. **Delivery** before anything is called finished

The Lead enforces these and logs every approval in `DECISIONS.md`.

The souls are behavioral rules. Back them up with Hermes's own controls; see [`config/`](config/).

## Install

Create one Hermes profile per agent (the Hermes desktop app does this when you create a bot, or use `hermes profile create <name>`), then:

```bash
git clone https://github.com/thefullctx/hermes-studio-team.git
cd hermes-studio-team
./install.sh                     # installs into profiles named lead, designer, engineer, qa
./install.sh --dry-run           # shows what it would do
```

If your profiles have other names, map them:

```bash
./install.sh lead=atlas designer=iris engineer=forge qa=sentinel
```

The script backs up any existing `SOUL.md` as `SOUL.md.bak-<timestamp>` and skips profiles that don't exist. **Start a new session for each agent afterward**: Hermes reads SOUL.md at session start.

To install by hand, copy each file in `souls/` to `~/.hermes/profiles/<profile>/SOUL.md`.

## Start a project

```bash
mkdir -p ~/studio/projects/acme-site
cp templates/*.md ~/studio/projects/acme-site/
```

Point every agent at the same projects folder, then tell the Lead what you want to build in the group chat.

| File | Owner | Purpose |
|---|---|---|
| `AGENTS.md` | Lead | Project rules Hermes loads automatically: stack, commands, layout |
| `BRIEF.md` | Lead | Goal, audience, scope, constraints, success criteria |
| `PLAN.md` | Lead | Stack, architecture, tasks with owners and status |
| `DECISIONS.md` | Lead | Dated log of decisions and approvals |
| `DESIGN.md` | Designer | Direction, tokens, components, screens, copy |
| `STATUS.md` | Engineer | What's built, how to run it, known issues |
| `QA.md` | QA | Test runs, issues by severity, verdict |

## Customize

- **Names.** Rename the agents if you like. Change the role names consistently in all four souls so they can address each other.
- **Your defaults.** Put your usual stack, hosting and conventions in `templates/AGENTS.md` so every project starts with them.
- **Keep it separate.** SOUL.md is who the agent is everywhere. Anything project-specific goes in that project's `AGENTS.md`.

## License

[MIT](LICENSE) © The Full Context
