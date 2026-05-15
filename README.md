# web_art_galery

Flutter Web gallery for the works of Belarusian artist Alexander Kishchenko
(1933–1997). Deployed at <https://kishchanka-art.by>.

## Getting started (local dev)

```bash
flutter pub get
flutter run -d chrome
```

For wider Flutter Web background see
[`agent_skills/flutter-web-environment/SKILL.md`](agent_skills/flutter-web-environment/SKILL.md).

## Production build (with SEO deep-link stubs)

The production pipeline runs the Flutter build, then enriches it with
per-painting and per-news HTML stubs and a deep-link sitemap. See
[`agent_skills/flutter-web-seo/SKILL.md`](agent_skills/flutter-web-seo/SKILL.md)
for the architecture and per-route conventions.

```bash
./scripts/build_web_seo.sh
```

What this does:

1. `flutter build web --release --pwa-strategy=none` — emits `build/web/`.
   PWA strategy is disabled on purpose: previous deploys registered a
   service worker that cached stale asset hashes and bricked the site for
   returning users. The `web/index.html` service-worker kill-switch
   unregisters any lingering registrations on page load.
2. `dart run tool/generate_seo.dart` — reads paintings (`Galery/.../GaleryItems`)
   and news (`News`) from Firestore via the public REST API and writes:
   - `build/web/catalog/<pictureId>/index.html` with `VisualArtwork` JSON-LD.
   - `build/web/news/<slug>/index.html` with `Article` JSON-LD.
   - Per-document `<url>` entries appended to `build/web/sitemap.xml`,
     including `<image:image>` blocks with real Firebase Storage URLs.

Environment variables (all optional, defaults match
`lib/src/shared/config/firebase/firebase_environment.dart`):

| Variable                | Default                                       |
|-------------------------|-----------------------------------------------|
| `FIREBASE_PROJECT_ID`   | `kishchenkoart-14257`                         |
| `FIREBASE_API_KEY`      | (web public key)                              |
| `SEO_BUILD_DIR`         | `build/web`                                   |
| `SEO_BASE_URL`          | `https://kishchanka-art.by`                   |

## Deployment

Upload `build/web/` to the Apache `www/` root **including hidden files**.
The `.htaccess` rewrite is what makes deep-link routing work for the SPA:

```bash
rsync -avz --delete build/web/ user@kishchanka-art.by:/var/www/kishchanka-art.by/
```

NGINX alternative is documented in [`deploy/nginx.conf`](deploy/nginx.conf).
