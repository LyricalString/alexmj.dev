# Portfolio design brief — konar.es

A handoff doc for Claude Design (build) and Claude Code (content extraction from local repos).

---

## Identity

- **Owner:** Alejandro Martinez (goes by "Alex" informally)
- **Brand wordmark:** Konar
- **Domain:** konar.es
- **Purpose:** Job-search portfolio, going live May–June 2026

Konar is a personal business/brand name that sits *above* Alejandro on the page — a quiet wrapper, not a competing identity. Alejandro is the human being hired; Konar is the chrome.

---

## Reference & philosophy

- **Structural reference:** [brittanychiang.com](https://brittanychiang.com) — sticky orientation + scroll-revealed sections.
- **Inversion:** light/paper palette instead of dark navy; stripped much further down on density.
- **Design philosophy:** minimal first, progressive disclosure, attention-driven layout.
- **Anti-pattern:** text walls. Treat the page like a CV — recruiters scan, they don't read.

For every section, ask: *what's the one thing this needs to communicate at first glance?* Everything else is earned by interaction (click, scroll, hover).

---

## Palette — paper (locked)

| Token | Hex | Use |
|---|---|---|
| Page bg | `#fafaf7` | Default canvas |
| Surface | `#f0eeea` | Status pills, hover bg, top tab strip |
| Divider | `#dadada` | Section borders, project row dividers |
| Text primary | `#1a1a1a` | Body text, names, headings |
| Text muted | `#5a5a5a` | Subtitles, metadata, nav labels |
| Mark fill | `#1a1a1a` on `#fafaf7` | Wordmark, CTA underlines |

**Fully monochromatic — no color accent.** The status pulse dot is dark gray (`#3a3a3a`), not green. This is deliberate: the discipline of one tonal range is the design.

Contrast check: `#1a1a1a` on `#fafaf7` ≈ 17:1 (well above WCAG AAA).

---

## Typography — shortlist (pick at build)

Three stacks, ranked. All free unless noted.

1. **Inter + JetBrains Mono** *(recommended — safest, most legible)*
   - Inter for h1/h2/body, JetBrains Mono for wordmark, nav, year stamps, labels
   - Free on Google Fonts; highly optimized for screen
2. **Geist + Geist Mono**
   - Vercel's stack; reads as very current/techy
   - Free; pairs sharper with the minimalist direction
3. **ABC Diatype + JetBrains Mono** *(paid)*
   - Slightly editorial, more design-forward
   - Only worth it if you want the site to feel curated/studio-grade

**Hierarchy (regardless of stack):**
- h1 (name): 30–36px, weight 500, `-0.02em` letter-spacing
- h2 (role/section): 14–18px, weight 400–500
- Body: 14–15px, weight 400, `1.55` line-height
- Mono chrome: 11–13px, weight 400–500, slight `0.04em` letter-spacing

Two weights only — 400 and 500. Never 600/700 (reads heavy).

---

## Layout — above the fold

```
┌───────────────────────────────────────────┐
│  konar             work · writing · contact│  ← top bar (mono, muted)
│  est. 2026                                 │
│                                            │
│                                            │
│  Alejandro Martinez                        │  ← (1) HOT — name, h1
│  Software engineer building reliable       │  ← (2) WARM — role + context
│  backend systems. Most recently at [co].   │
│                                            │
│  ● available from june                     │  ← (3) status pill
│                                            │
│  ↓ selected work                           │  ← (4) quiet scroll cue
└───────────────────────────────────────────┘
```

**Reading path & intent:**

| Zone | What | Intent |
|---|---|---|
| 1 | Name (h1) | Owns the page. Single biggest type on screen. |
| 2 | One-line role + context | The only above-fold sentence. Earns its place. |
| 3 | Availability pill | Recruiter hook — small but distinct (pulse dot pulls eye even at low priority). |
| 4 | Scroll cue | Quiet. Only registered by users still scanning. |

Page padding: ~32–40px on small screens, scales up. Hero starts ~64px below the top bar — generous whitespace is part of the design.

---

## Layout — selected work

Numbered rows. No descriptions in the default state.

```
selected work
─────────────────────────────────────
01  project name                  2025
    one-line outcome. specific.

02  project name                  2024
    one-line outcome.

03  project name                  2023
    one-line outcome.
```

**Disclosure pattern (locked):** hybrid.
- **Most projects:** click anywhere on the row → expand inline with short blurb (2–3 sentences), stack chips, and 1–2 links (live, repo). Collapse on second click.
- **1–2 flagship projects:** the row title is a link to a full case-study page. Mark these visually with a small "↗" or thicker title weight.

3–7 projects total. More than 7 looks like a CV dump.

---

## Layout — other sections (sketch only)

- **About:** short prose, max 3–4 sentences. Optional small portrait. Maybe a 3-row "currently / before / outside work" stack. No paragraphs of biography.
- **Writing:** only include if there are 3+ pieces worth featuring. Same row pattern as projects: title + date + one-liner.
- **Contact:** minimal — email link + 2–3 social/profile links (GitHub, LinkedIn, X). No form.

---

## Disclosure rules (apply everywhere)

1. Default visible state = the minimum that makes the section legible.
2. Reveal more on user signal: click (expand), hover (micro-detail), or navigation (deeper page).
3. Never default to multiple paragraphs of prose. If something needs paragraphs, it's a case-study page, not above-the-fold copy.
4. Mono labels for section headers, lowercase. Sentence case for content.

---

## Copy tone

- Direct, specific, outcome-focused.
- "Built X that did Y" — not "Passionate about X."
- No "I'm a creative problem-solver" filler. Specifics or nothing.
- Lowercase for chrome (nav, labels, section titles, mono details). Sentence case for content (h1, body, project titles).
- No pronouns in section headers.

---

## Content slots — to fill in Claude Code from repos

Claude Code should pull these from Alex's local repos / existing CV summary:

- **Role + context line** (one sentence, replaces "Software engineer building reliable backend systems. Most recently at [company].")
- **Selected projects (3–7):** for each — name, one-line outcome, year, stack chips, links (live + repo), and either short blurb (inline expand) OR full case-study draft (1–2 flagship)
- **About:** 3–4 sentence bio
- **Writing:** list of pieces (only if ≥3)
- **Contact:** email + 2–3 social/profile URLs
- **OG image / favicon:** any existing brand assets

---

## Build notes for Claude Design

- **Stack suggestion:** any modern static site framework (Astro, Next.js, etc). Static-first; the site is content-only.
- **Routing:** single-page primary (`/`), case-study pages at `/work/[slug]`. Optional `/writing/[slug]` and `/about` if needed.
- **Mobile:** status pill stays in hero. Top nav collapses to a single label or icon. Project rows stay full-width, year drops to a second line if needed.
- **Performance:** font subset; <100kb above the fold; no JS for interactions that can be CSS (`details`/`summary` for inline expand is enough).
- **Accessibility:** semantic HTML, `prefers-reduced-motion` respected on any scroll/expand transitions.
- **SEO:** title = "Alejandro Martinez — software engineer", meta description = the role line, OG image with name + Konar wordmark.

---

## Open questions (resolve before build)

- Exact role line copy (depends on most recent role + targeting)
- Which 3–7 projects make the cut
- Whether to include a portrait
- Whether to use `konar.es` (root) or `alex.konar.es` (subdomain) as the canonical URL
- Typography stack — pick from the shortlist when first type renders in the build environment

---

## Decisions log

- 2026-05-02 — Reference: Brittany Chiang structural DNA, inverted to light
- 2026-05-02 — Palette: paper (option A) — bg `#fafaf7`, monochromatic
- 2026-05-02 — Identity: Konar wordmark + Alejandro Martinez headline
- 2026-05-02 — Disclosure: hybrid (inline expand + flagship case-study pages)
- 2026-05-02 — Workflow: design brief in Cowork → content extraction in Claude Code → build in Claude Design
