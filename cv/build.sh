#!/usr/bin/env bash
# Compile cv/cv.typ → public/cv.pdf using local Geist fonts.
set -euo pipefail
cd "$(dirname "$0")/.."
typst compile cv/cv.typ public/cv.pdf --font-path cv/fonts
echo "→ public/cv.pdf ($(du -h public/cv.pdf | cut -f1))"
