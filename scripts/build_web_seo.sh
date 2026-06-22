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

# --no-tree-shake-icons: the icon subsetter (const_finder) silently drops icons
# that reach an `Icon(...)` only through a field/variable rather than a direct
# `Icon(Icons.x)` literal — e.g. the Guinness/UN stat rows on the about-author
# page (icon passed via _StatItem.icon). That shipped a 12 KB subset font with
# those glyphs missing → blank icons. Bundling the full MaterialIcons font
# guarantees every icon renders; it gzips small and is cached for a year.
echo "==> flutter build web --release --pwa-strategy=none --no-tree-shake-icons"
flutter build web --release --pwa-strategy=none --no-tree-shake-icons

echo "==> dart run tool/generate_seo.dart"
dart run tool/generate_seo.dart

echo "==> Build complete: build/web/"
echo "    Upload with hidden files (.htaccess), e.g.:"
echo "    rsync -avz --delete build/web/ user@kishchanka-art.by:/var/www/kishchanka-art.by/"
