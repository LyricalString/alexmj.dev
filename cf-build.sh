#!/usr/bin/env bash
# Cloudflare Pages build entrypoint.
# Installs a pinned typst, regenerates the CV PDF from cv/cv.typ, then runs Astro build.
set -euo pipefail

TYPST_VERSION="v0.14.2"
TYPST_TARGET="x86_64-unknown-linux-musl"
TYPST_URL="https://github.com/typst/typst/releases/download/${TYPST_VERSION}/typst-${TYPST_TARGET}.tar.xz"

echo "→ Installing typst ${TYPST_VERSION}"
curl -fsSL "$TYPST_URL" | tar -xJ
export PATH="$PWD/typst-${TYPST_TARGET}:$PATH"
typst --version

echo "→ Compiling CV"
bash cv/build.sh

echo "→ Astro build"
npx astro build
