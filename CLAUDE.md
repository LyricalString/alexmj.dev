# CLAUDE.md — Portfolio (alexmj.dev)

> Repo de código del portfolio personal de Alejandro Martínez. La fuente de verdad estratégica está en el vault Obsidian.

## Knowledge base canónico

@~/Documents/Obsidian Vault/10-Projects/Portfolio/CLAUDE.md

> **El archivo importado arriba contiene:** orden de lectura crítico (PROJECT-STATE → PRODUCT-PLAN → ROADMAP → decisions), estructura de la KB, convenciones de frontmatter, update protocol, definiciones del dominio. **Léelo siempre antes de actuar.**

## Qué es este repo (operacional)

Sitio estático Astro deployado en Cloudflare Pages. Contiene:

- `src/pages/` — `index.astro`, `about.astro`, `cv.astro`, `projects.astro`, `oss.astro`, `404.astro`, y `cases/*.astro` (7 case studies).
- `src/components/` — `Link.astro`, `Pulse.astro`, `Section.astro`.
- `src/layouts/Base.astro` — HTML shell, fuentes, meta tags.
- `src/styles/tokens.css` — design tokens (paleta paper).
- `audit/00-summary.md … 15-*.md` — extracción inicial de contenido desde repos locales (referencia histórica). Las observaciones vivas viven en el vault: ver `[[COPY-AUDIT]]`.
- `DESIGN.md` — brief original de diseño, paleta, layout, copy tone. Atemporal salvo pivote.

## Convenciones operacionales

Heredadas de `~/.claude-profiles/konar/CLAUDE.md`:

- `bun` y `bunx` por defecto. Nunca `npm`/`npx`.
- `tsgo --noEmit` para typecheck (instalado vía `@typescript/native-preview`).
- Biome como linter/formatter (`bunx biome check .`).
- `git push` sin nombre de rama explícito.

## Stack

- **Framework:** Astro 6.1 + TypeScript (sin JS framework adicional).
- **Build:** `bun run build` → `dist/` estático.
- **Deploy:** Cloudflare Pages.
- **Fuentes:** Geist + Geist Mono via Google Fonts (weights 400 y 500).
- **Paleta:** paper monocrómica (`#fafaf7` bg, `#1a1a1a` text). Sin color accent.

## Reglas de copy

Resumen de `DESIGN.md` y `feedback_portfolio_voice` (memory):

- **Voz = ventas, no confesión.** Frame outcomes alrededor de tecnología shipeada, nunca alrededor de fallos comerciales/distribución que no fueron responsabilidad técnica de Alex.
- **Especificidad sobre generalidad.** "Built X that did Y." Nada de "passionate about X."
- **Lowercase para chrome** (nav, labels, section headers, mono details). **Sentence case para contenido** (h1, body, project titles).
- **Pronoun-free** en section headers.
- **Honest numbers** — claims con caveats reales (ej. AUM platform-attributable, no personal). Pero "honest numbers" no significa "honest failures": no se mencionan proyectos que terminaron mal por razones no técnicas.

## Pendientes activos

Ver `[[PROJECT-STATE]]` §"Próximas acciones" en el vault. Resumen actual (2026-05-07):

- 3 links rotos por arreglar hoy.
- Numeración de los 7 case studies por unificar.
- ~10 inconsistencias de copy a propagar (naming, cifras Asset Reality, framing Crossflow).
- Documento maestro de issues: `[[COPY-AUDIT]]`.
