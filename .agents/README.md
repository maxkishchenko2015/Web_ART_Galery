# `.agents/` — vendor-agnostic agent configuration

Single source of truth for every AI coding agent (Claude Code, Cursor, Codex, …).
Each vendor wants its own folder (`.claude/`, `.cursor/`, …); instead of
maintaining each by hand, we keep one universal config here and **generate** the
vendor folders from it.

## Layout

```
.agents/
  setup                     # generator: mirrors this dir into vendor folders
  skills/                   # universal agent skills (SKILL.md per dir)
  vendors/
    claude/settings.json    # Claude permissions + SessionStart hook (source)
AGENTS.md                   # the agnostic context file (root) — all vendors read it
```

## Rules

- **Vendor folders are READ-ONLY and git-ignored.** `.claude/`, `.cursor/`,
  `CLAUDE.md`, etc. are generated artifacts. Never edit them by hand — changes
  are wiped on the next run.
- **To change agent config, edit `.agents/` (or root `AGENTS.md`) and re-run
  `bash .agents/setup`.**
- `AGENTS.md` holds all real content. `CLAUDE.md` is just a generated shim
  (`@AGENTS.md`) because Claude only auto-loads `CLAUDE.md`.

## How it propagates

`.claude/settings.json` carries a `SessionStart` hook that runs `.agents/setup
--quiet`, so any edit to `.agents/` reaches every new session of every vendor
automatically. After a fresh clone, bootstrap once:

```bash
bash .agents/setup
```

## Adding a vendor

Add a `gen_<vendor>` function in `.agents/setup`, call it at the bottom, and add
the vendor's folder to `.gitignore`.
