#!/usr/bin/env bash
# Regenerate all web brand icons from the canonical source painting.
#
# Output:
#   web/favicon.png               64 × 64
#   web/icons/Icon-192.png        192 × 192
#   web/icons/Icon-512.png        512 × 512
#   web/icons/Icon-maskable-192.png  192 × 192 (80% safe zone)
#   web/icons/Icon-maskable-512.png  512 × 512 (80% safe zone)
#
# All variants letterbox the portrait source on cream #F5F0E8 (matches
# `theme_color` in web/manifest.json and web/index.html, so PWA install /
# splash blends seamlessly). Maskable variants reserve the outer 20% as a
# safe-zone padding so Android adaptive icons never crop content.
#
# Source: assets/branding/logo_sunflowers.png (kept in repo).
# Runner: macOS `sips` (system-bundled; no Homebrew/imagemagick required).
#
# Re-run any time the source painting changes.

set -euo pipefail
cd "$(dirname "$0")/.."

SRC="assets/branding/logo_sunflowers.png"
PAD="F5F0E8"

if [[ ! -f "$SRC" ]]; then
  echo "ERROR: $SRC not found" >&2
  exit 1
fi

mkdir -p web/icons

regen_letterbox() {
  local size="$1"
  local out="$2"
  sips -s format png -Z "$size" "$SRC" --out "$out" >/dev/null
  sips -p "$size" "$size" --padColor "$PAD" "$out" --out "$out" >/dev/null
  echo "  ${out}: ${size}x${size}"
}

regen_maskable() {
  local size="$1"
  local out="$2"
  local safe=$(( size * 8 / 10 ))
  sips -s format png -Z "$safe" "$SRC" --out "$out" >/dev/null
  sips -p "$size" "$size" --padColor "$PAD" "$out" --out "$out" >/dev/null
  echo "  ${out}: ${size}x${size} (safe ${safe}px)"
}

echo "==> regenerating web icons from $SRC"
regen_letterbox 64  web/favicon.png
regen_letterbox 192 web/icons/Icon-192.png
regen_letterbox 512 web/icons/Icon-512.png
regen_maskable  192 web/icons/Icon-maskable-192.png
regen_maskable  512 web/icons/Icon-maskable-512.png
echo "done"
