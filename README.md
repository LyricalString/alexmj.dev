# Portfolio — Alejandro Martínez

Personal portfolio at [konar.es](https://konar.es).

Built with [Astro](https://astro.build), TypeScript and a deliberate terminal-flavored aesthetic — sans for headlines, mono for everything else, no JS framework.

## Structure

```
src/
├── components/      Link · Pulse · Section
├── layouts/         Base layout (HTML shell, fonts, theme)
├── pages/
│   ├── index.astro      Home — hero, selected work, other projects, contact
│   ├── about.astro      Bio, experience timeline, principles
│   ├── cv.astro         CV
│   ├── projects.astro   Full project grid
│   ├── oss.astro        Open-source work
│   └── cases/           Long-form case studies (Trilo, Satstream, …)
├── styles/          Global tokens
└── ...
```

## Develop

```bash
bun install
bun run dev      # http://localhost:4321
bun run build    # static output → dist/
```

Type-checking with [`tsgo`](https://github.com/microsoft/typescript-go):

```bash
bunx tsgo --noEmit
```

Linting/formatting with [Biome](https://biomejs.dev):

```bash
bunx biome check .
```

## Deployment

Static site, deploys anywhere that serves HTML. Currently on Cloudflare Pages.

## Contact

- alex@konar.es
- [github.com/lyricalstring](https://github.com/lyricalstring)
- [linkedin.com/in/lyricalstring](https://www.linkedin.com/in/lyricalstring/)
