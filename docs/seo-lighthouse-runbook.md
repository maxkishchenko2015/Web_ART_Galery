# Lighthouse measurement runbook

Track Core Web Vitals after each SEO phase. The goal is a documented
baseline → improvement curve, not a one-shot score.

## Targets

| Metric                              | Mobile target | Desktop target |
| ----------------------------------- | ------------- | -------------- |
| LCP (Largest Contentful Paint)      | < 2.5 s       | < 1.8 s        |
| FCP (First Contentful Paint)        | < 1.8 s       | < 1.2 s        |
| TBT (Total Blocking Time)           | < 200 ms      | < 100 ms       |
| CLS (Cumulative Layout Shift)       | < 0.10        | < 0.05         |
| SEO score                           | 100           | 100            |
| Total transfer size, initial route  | < 2.5 MB      | < 4 MB         |

These are Google's "good" thresholds; Yandex weights similar signals and
will follow the same scores closely.

## One-shot run

Requires Node 18+ and Chrome:

```bash
npm install -g lighthouse
lighthouse https://kishchanka-art.by \
  --preset=desktop \
  --output html --output-path ./lh-desktop-baseline.html

lighthouse https://kishchanka-art.by \
  --emulated-form-factor=mobile \
  --output html --output-path ./lh-mobile-baseline.html
```

Run once before any changes are deployed (`baseline`), then once after
each phase deploy. Keep the HTML files in `docs/lighthouse/` for history.

## Per-route runs

Lighthouse only measures one URL at a time. Run against each route stub
to confirm Phase 2 lands cleanly:

```bash
for route in about-author catalog news films archive contacts; do
  lighthouse "https://kishchanka-art.by/$route" \
    --preset=desktop \
    --output html --output-path "./lh-desktop-$route.html"
done
```

Look for: unique `<title>` per route, unique `<meta description>`, JSON-LD
present, no duplicate `BreadcrumbList` warnings.

## Verifying the Phase 4 wins

### LCP / FCP improvement

Diff the "Network → Resources" Lighthouse panel between baseline and
post-Phase-4 runs. Expect:

- `flutter_bootstrap.js` start time earlier (preload effect).
- `canvaskit.wasm` no longer the LCP-blocking critical resource.
- `mixpanel.js` moves from `<head>` (synchronous) to "after first frame".
- A new sub-chunk per deferred screen (`films`, `archive`, etc.) loaded
  only when its route is visited.

### Bundle size

```bash
ls -lh build/web/main.dart.js build/web/main.dart.js_*.part.js
```

After Phase 4.1, the main bundle should drop noticeably and several `.part.js`
chunks should appear (one per `deferred as` library).

### WebP / AVIF delivery

In Chrome DevTools → Network tab → filter by image, click any catalog work
image, check `Response Headers → content-type`. Should be `image/avif` (Chrome)
or `image/webp` (Safari) after Phase 4.4.

## Rich Results / structured data checks

Independent of Lighthouse, run after each phase:

- <https://search.google.com/test/rich-results> — paste a deep URL (e.g.
  `https://kishchanka-art.by/about-author`) and confirm `Person`,
  `BreadcrumbList`, `AboutPage` all parse without warnings.
- <https://validator.schema.org> — same input, validates the full graph.
- Yandex.Webmaster → "Site Tools → Structured data validator" —
  paste the page source for the same URLs.

## Search Console / Webmaster setup

After Phase 1–2 are deployed:

1. <https://search.google.com/search-console> → add property
   `https://kishchanka-art.by` → verify via DNS TXT.
2. Submit `https://kishchanka-art.by/sitemap.xml`.
3. <https://webmaster.yandex.com> → add site → verify → submit sitemap.
4. Wait 1–2 weeks for first indexation pass before comparing rankings.

## Phase progression log

Maintain a short table in this file as each phase ships:

| Phase | Deployed (UTC) | LCP mobile | TBT mobile | CLS | SEO score | Notes                |
| ----- | -------------- | ---------- | ---------- | --- | --------- | -------------------- |
| 0     | —              |            |            |     |           | baseline             |
| 1     |                |            |            |     |           | JSON-LD + sitemap    |
| 2     |                |            |            |     |           | per-route stubs      |
| 3     |                |            |            |     |           | deep-link stubs      |
| 4     |                |            |            |     |           | code-split + preload |
