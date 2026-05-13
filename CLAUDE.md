# CLAUDE.md — Portfolio (alexmj.dev)

> Repo de código del portfolio personal de Alejandro Martínez. La fuente de verdad estratégica está en el vault Obsidian.

## Knowledge base canónico

@~/Documents/Obsidian Vault/10-Projects/Portfolio/CLAUDE.md

> **El archivo importado arriba contiene:** orden de lectura crítico (PROJECT-STATE → PRODUCT-PLAN → ROADMAP → decisions), estructura de la KB, convenciones de frontmatter, update protocol, definiciones del dominio. **Léelo siempre antes de actuar.**

## Qué es este repo (operacional)

Sitio estático Astro deployado en Cloudflare Pages (project `alexmj-dev`). Contiene:

- `src/pages/` — `index.astro`, `about.astro`, `cv.astro`, `projects.astro`, `oss.astro`, `404.astro`, y `cases/*.astro` (7 case studies).
- `src/components/` — `Brand.astro`, `Link.astro`, `Pulse.astro`, `Section.astro`.
- `src/layouts/Base.astro` — HTML shell (meta + OG + Twitter), Google Fonts non-blocking, Umami tracker en prod, motion-system GSAP+Lenis IIFE, pre-GSAP fallback CSS, `<main>` landmark.
- `src/styles/tokens.css` — design tokens (warm-ink dark palette + sage accent).
- `src/styles/case-study.css` — chrome compartido por las 7 case studies.
- `src/lib/leyabierta-stats.ts` — fetch memoizado de `api.leyabierta.es/v1/stats` al build, propagado a 6 páginas.
- `cv/` — fuente typst del CV (`cv.typ`, `data.typ`, `lib.typ` + Geist fonts) que compila a `public/cv.pdf`.
- `cf-build.sh` — script de build para Cloudflare Pages: descarga typst pinned, regenera CV, corre `astro build`.
- `audit/00-summary.md … 15-*.md` — extracción inicial de contenido desde repos locales (referencia histórica). Observaciones vivas en el vault: ver `[[COPY-AUDIT]]`.
- `DESIGN.md` — brief original de diseño. Nota: la paleta documentada ahí (paper) es histórica; el sitio pivoteó a dark mode (ver §Stack abajo).

## Convenciones operacionales

Heredadas de `~/.claude-profiles/konar/CLAUDE.md`:

- `bun` y `bunx` por defecto. Nunca `npm`/`npx`.
- `tsgo --noEmit` para typecheck (instalado vía `@typescript/native-preview`).
- Biome como linter/formatter (`bunx biome check .`).
- `git push` sin nombre de rama explícito.

## Stack

- **Framework:** Astro 6.1.9 + TypeScript, output `static`. Sin JS framework adicional.
- **Runtime:** Bun (lockfile `bun.lock`) — el script `bun run build` ejecuta `bun run cv && astro build`.
- **Build CI:** Cloudflare Pages corre `bash cf-build.sh` (descarga typst pinned + regenera PDF + `npx astro build`). Push-to-deploy desde `main`.
- **Sitemap:** `@astrojs/sitemap` genera `sitemap-index.xml` + `sitemap-0.xml` al build. `public/robots.txt` lo anuncia. Registrado en GSC como `sc-domain:alexmj.dev`.
- **Analytics:** Umami self-host en KonarServer, tracker servido desde `analytics.alexmj.dev/ley.js` (renamed para evitar adblock), cargado en prod-only.
- **Motion:** GSAP 3.15 + ScrollTrigger + Lenis 1.0.42 vía CDN con `is:raw defer`. Una IIFE vanilla en `Base.astro` orquesta hero animations, scroll reveals, magnetic hover. Respeta `prefers-reduced-motion`.
- **Fuentes:** Geist + Geist Mono via Google Fonts (weights 400 y 500), cargadas como `rel="preload" as="style"` + onload swap a `stylesheet` (non-blocking render).
- **Paleta:** warm-ink dark. `--bg #15171a`, `--fg #e8e8e6`, `--dim #a09e98`, `--faint #8e8d87`, `--rule #262830`. Accent `--accent #86b27a` (sage green) reservado para `Pulse` y hover interactivo.
- **Linter:** Biome (`bunx biome check .`). Typecheck: `bunx tsgo --noEmit`.
- **Domain:** `alexmj.dev` (canonical). `analytics.alexmj.dev` apunta vía Cloudflare Tunnel al Umami de KonarServer.

## Reglas de copy

Resumen de `DESIGN.md` y `feedback_portfolio_voice` (memory):

- **Voz = ventas, no confesión.** Frame outcomes alrededor de tecnología shipeada, nunca alrededor de fallos comerciales/distribución que no fueron responsabilidad técnica de Alex.
- **Especificidad sobre generalidad.** "Built X that did Y." Nada de "passionate about X."
- **Lowercase para chrome** (nav, labels, section headers, mono details). **Sentence case para contenido** (h1, body, project titles).
- **Pronoun-free** en section headers.
- **Honest numbers** — claims con caveats reales (ej. AUM platform-attributable, no personal). Pero "honest numbers" no significa "honest failures": no se mencionan proyectos que terminaron mal por razones no técnicas.

## Pendientes activos

Ver `[[PROJECT-STATE]]` §"Próximas acciones" en el vault. El sitio está live (`https://alexmj.dev`) y los grandes bloques de la roadmap están cerrados (deploy, analytics, a11y, perf, sitemap+GSC). Lo pendiente son polish + esperar data de search/analytics.
