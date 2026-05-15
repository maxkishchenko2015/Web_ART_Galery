#!/usr/bin/env bash
# Production build + SEO generation pipeline for kishchanka-art.by.
#
# Order:
#   1. flutter build web --release --pwa-strategy=none   → emits build/web/
#   2. dart run tool/generate_seo.dart                   → writes per-painting
#      and per-news index.html stubs into build/web/, plus deep-link <url>
#      entries into build/web/sitemap.xml.
#
# After this script, build/web/ is ready to upload to www/ on Apache. Make
# sure the upload includes hidden files (.htaccess) — that's the single
# biggest deploy footgun on this project.

set -euo pipefail

cd "$(dirname "$0")/.."

echo "==> flutter build web --release --pwa-strategy=none"
flutter build web --release --pwa-strategy=none

echo "==> dart run tool/generate_seo.dart"
dart run tool/generate_seo.dart

echo "==> Build complete: build/web/"
echo "    Upload with hidden files (.htaccess), e.g.:"
echo "    rsync -avz --delete build/web/ user@kishchanka-art.by:/var/www/kishchanka-art.by/"
