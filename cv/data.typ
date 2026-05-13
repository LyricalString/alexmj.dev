// Source of truth for CV content. Mirrors src/pages/cv.astro and the vault,
// but trimmed and reframed for a printed one/two-page recruiter-facing CV.

#let person = (
  name: "Alejandro Martínez",
  role: "Software engineer",
  location: "Valencia, Spain",
  email: "alex@konar.es",
  site: "alexmj.dev",
  github: "github.com/lyricalstring",
  linkedin: "linkedin.com/in/lyricalstring",
)

#let summary = "Software engineer. I build and ship products end to end. Most of what I've worked on has been in places where mistakes cost money or trust: government-grade crypto custody, Bitcoin data infrastructure, AI products in production. Comfortable on my own, faster in a team."

#let experience = (
  (
    company: "Trilo",
    role: "Tech lead",
    dates: "2025 — present",
    body: "Tech lead on a two-person team. Own the technical build across web, backend, mobile, desktop and a voice agent. Co-shape product direction with the founder. Live at trilo.chat.",
    stack: "TypeScript · Rust · Python · Bun · Elysia · Supabase · Tauri · MCP · LiveKit",
  ),
  (
    company: "Satstream",
    role: "Sole engineer",
    dates: "2024 — 2025",
    body: "Built and ran the data infrastructure behind several Bitcoin analytics products. Four indexers and five client SDKs in production. Other teams used it so they didn't have to deal with chain-level complexity themselves.",
    stack: "Go · Rust · Python · ScyllaDB · MongoDB · Postgres · Redis · gRPC · AWS CDK",
  ),
  (
    company: "Asset Reality",
    role: "Lead engineer",
    dates: "Jul 2022 — Feb 2024",
    body: "Led two of the platform's main systems within a 3-person team: the multi-sig engine that signs off every withdrawal, and the 12-chain blockchain ingestion layer. AUM grew from $200M to $500M during my tenure ($1B+ today).",
    stack: "Go · TypeScript · React · MongoDB · Postgres · RabbitMQ · AWS · Terraform · Fireblocks",
  ),
  (
    company: "Konar Technologies",
    role: "Founder · sole engineer",
    dates: "2021 — present",
    body: "My independent engineering studio. Built and run tecpar.es, the B2B SaaS behind an electronics workshop with daily users. Also publish OSS and freelance.",
    stack: "TypeScript · Next.js · Prisma · Rust · Bun · Docker · Traefik",
  ),
)

#let projects = (
  (
    name: "Ley Abierta",
    year: "2026",
    body: "Made 190 years of Spanish law searchable in plain Spanish. 475,000 articles processed with AI summarisation and embeddings, query latency cut from minutes to under a second.",
    stack: "Python · Postgres · pgvector",
  ),
  (
    name: "Crossflow Network",
    year: "2023 — 2024",
    body: "Cross-chain DeFi lending protocol I designed and shipped at Hexmount. The kind of work institutional teams spend years trying to hire senior protocol engineers for.",
    stack: "Go · Cosmos SDK · CosmWasm · Solidity",
  ),
)

#let oss = (
  (name: "Node-Discord-Bot", desc: "Discord bot framework. 140★, 3M users across 28k servers. MIT."),
  (name: "Lovely-Logs", desc: "Type-safe logging library — Node, browser, Lambda. Zero deps. MIT."),
  (name: "Ley Abierta engine", desc: "Hybrid BM25 + RAG with custom int8 SIMD C kernel. AGPL-3.0."),
)

#let skills = (
  ("Code", "TypeScript · Go · Rust · Python · Solidity"),
  ("Backend & data", "Bun · Elysia · Go Chi · gRPC · RabbitMQ · PostgreSQL · MongoDB · ScyllaDB · Redis"),
  ("Frontend & infra", "Next.js · React · Astro · Tauri · Expo · AWS · Terraform · Docker · MCP"),
)

#let languages = (
  ("Spanish", "native"),
  ("English", "professional"),
  ("French", "A2"),
)

#let education = (
  (
    school: "Florida Universitària",
    degree: "Engineer's degree, Robotics",
    dates: "Jul 2022 — Jun 2024",
  ),
  (
    school: "IES L'OM",
    degree: "Middle School Diploma, Electrical & Electronics Engineering",
    dates: "",
  ),
)
