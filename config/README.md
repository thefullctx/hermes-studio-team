# Hermes config: the safety net behind the souls

The approval checkpoints in each SOUL.md are **behavioral**: the agent follows them because they're part of who it is. Hermes also has **mechanical** controls that work no matter what the soul says. Use both.

> Option names change between Hermes versions. Check them against the official docs for your version: <https://hermes-agent.nousresearch.com/docs/user-guide/security/>

## 1. Command approvals

Hermes can pause before running risky terminal commands and ask you to approve them. Its built-in list of dangerous commands doesn't cover everything (cloud CLIs, database tools, `kubectl` and similar may not be on it), which is why the souls also spell out what needs approval.

In each profile's `config.yaml` (`~/.hermes/profiles/<profile>/config.yaml`):

```yaml
approvals:
  mode: manual   # ask before risky commands; "smart" asks less often
```

Use `manual` while you're getting to know the team. Consider `smart` later for the Designer.

## 2. Checkpoints (snapshots)

Hermes can snapshot files before the agent changes them, so you can roll back a bad edit. They're **off by default** and kept in a separate git store, so your project's own `.git` isn't touched.

Turn them on per session with the `--checkpoints` flag, or in config if your version supports it. Inspect them with:

```bash
hermes checkpoints
```

## 3. Skill write approval

Hermes agents can write their own skills over time. If you want to review those before they're saved, enable `skills.write_approval` in each profile's config.

## Recommended starting point

| Profile | Command approvals | Checkpoints |
|---|---|---|
| lead | manual | on |
| designer | manual | on |
| engineer | manual | on |
| qa | manual | on |
