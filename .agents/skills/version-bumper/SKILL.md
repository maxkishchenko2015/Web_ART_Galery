---
name: Version Bumper
description: Date-based version convention for kishchanka-art.by Flutter Web. Apply before every production build.
---

# Version Bumper

The project uses a **calendar version** with the format `YY.M.D+B`. Agents and
humans MUST update `pubspec.yaml` before every production build (manually or
via `scripts/build_web_seo.sh`).

## Format

```
version: <YY>.<M>.<D>+<B>
```

- `YY` — last two digits of the year, **without** leading zero.
- `M`  — month, **1–12**, no leading zero.
- `D`  — day of month, **1–31**, no leading zero.
- `+B` — build number for the same calendar date, starts at `1`, increments
  by 1 every time you re-deploy on the same day.

Examples (all valid):

| Version    | Date            | Notes                  |
|------------|-----------------|------------------------|
| `26.5.15+1` | 2026-05-15      | First deploy that day. |
| `26.5.15+2` | 2026-05-15      | Same day, second deploy. |
| `26.5.16+1` | 2026-05-16      | First deploy next day.   |
| `26.12.1+1` | 2026-12-01      | One-digit month/day stay one-digit. |

## Bump rules

1. Read the current `version:` line in `pubspec.yaml`.
2. Compute today's calendar tag via `date +%y.%-n.%-e` (zsh / GNU date) or
   the equivalent in your runtime. On macOS prefer `date +%y.%-m.%-d` (the
   `%-` modifier strips the leading zero).
3. Compare today's tag to the date component of the current version
   (everything before `+`).
   - **Today > current date** → set version to `<today>+1`.
   - **Today == current date** → increment the build number (`+B → +B+1`).
   - **Today < current date** → **stop and ask**: clock is wrong, or the
     pubspec was manually set in the future. Never silently downgrade.
4. Write the result back into `pubspec.yaml` and continue with the build.

## When to apply

- **Always** before `flutter build web --release` for production.
- **Optional** for ad-hoc dev builds, but recommended so dev artefacts have
  monotonic versions.
- Skip during pure refactor/code-review sessions that do not result in a
  deploy.

## Suggested guard for build scripts

`scripts/build_web_seo.sh` is the natural enforcement point. A minimal
guard:

```bash
TODAY=$(date +%y.%-m.%-d)
CURRENT=$(awk -F'[: +]' '/^version:/{print $2}' pubspec.yaml)
if [[ "$CURRENT" != "$TODAY"* ]]; then
  echo "ERROR: pubspec version $CURRENT is not for today ($TODAY)." >&2
  echo "       Update version: line and re-run." >&2
  exit 1
fi
```

(Not yet wired in by default — add when the project gets a CI deploy.)

## Sanity checklist

- [ ] `version:` line still parses as `MAJOR.MINOR.PATCH+BUILD`
  (pub strictly requires this shape; `flutter pub get` will fail otherwise).
- [ ] No leading zero in month/day segments (`26.05.15+1` is **invalid**).
- [ ] Build number `+B` is strictly increasing for any given calendar date.
- [ ] No retroactive date stamps — never write a date older than `today`.

## Related files

- [`pubspec.yaml`](../../pubspec.yaml) — single source of truth.
- [`scripts/build_web_seo.sh`](../../scripts/build_web_seo.sh) — production
  build pipeline; bump version before invoking.
- [`AGENTS.md`](../../AGENTS.md) — index of all skills.
