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

#let summary = "Software engineer. I build production systems end to end, often as the only engineer: Bitcoin indexing, crypto custody for law enforcement, and applied AI for industrial companies. I measure before shipping and self-host when the data can't leave."

#let experience = (
  (
    company: "Freelance",
    role: "Engineer · consultant",
    dates: "2021 — present",
    body: "ERP-style operations software and AI systems for industrial SMEs. In production: invoice extraction with a self-hosted 8B vision model (99.2% of fields correct, 1–2 s per document) and on-premise meeting transcription at 5.2× real time on CPU, with diarization. Also visual defect detection and consulting.",
    stack: "Python · TypeScript · FastAPI · Next.js · vLLM · faster-whisper · pyannote · Postgres · Docker",
  ),
  (
    company: "Trilo",
    role: "Sole engineer",
    dates: "2025 — present",
    body: "AI workspace where AI coworkers edit docs alongside people. One monorepo ships web, iOS, Android, desktop and a 77-tool MCP server.",
    stack: "TypeScript · Rust · Python · Bun · Elysia · Supabase · Tauri · MCP · LiveKit",
  ),
  (
    company: "Satstream",
    role: "Sole engineer",
    dates: "2024 — 2025",
    body: "Bitcoin indexing API for inscriptions, BRC-20, Runes and Charms: four indexers, sub-second queries, five SDKs, an MCP server and a block explorer. 8 repos.",
    stack: "Go · Rust · Python · ScyllaDB · MongoDB · Postgres · Redis · gRPC · AWS CDK",
  ),
  (
    company: "Asset Reality",
    role: "Engineer",
    dates: "Jul 2022 — Feb 2024",
    body: "Crypto custody for law enforcement. Primary author of the withdrawal-approval engine and the chain-monitoring service. Platform AUM went from $200M to $500M over my 19 months.",
    stack: "Go · TypeScript · React · MongoDB · Postgres · AWS",
  ),
)

#let projects = (
  (
    name: "Ley Abierta",
    year: "2026",
    body: "Spanish law since 1835 as Git. Hybrid BM25 + vector search with reranking, scored on 678 questions (recall@10 0.76); QLoRA fine-tune of Qwen3-Embedding-8B.",
  ),
  (
    name: "CompoundFox + Autowealth",
    year: "2025 — now",
    body: "Live trading strategy with a public dashboard: +4.89% average monthly since Nov 2025.",
  ),
  (
    name: "Copy Trader",
    year: "2024 — 2026",
    body: "Rust copy-trading across Bybit, Binance and Hyperliquid. Copy cycle 20 s → 4 s.",
  ),
  (
    name: "Crossflow Network",
    year: "2023 — 2024",
    body: "Cross-chain lending on a Cosmos SDK L1 with threshold signatures.",
  ),
)

#let oss = (
  (name: "Node-Discord-Bot", desc: "Discord bot framework. 140★, 3M users across 28k servers. MIT."),
  (name: "Lovely-Logs", desc: "Type-safe logging for Node, browser and Lambda. Zero deps. MIT."),
  (name: "Ley Abierta", desc: "Spanish law as Git, with its search engine. AGPL-3.0."),
)

#let skills = (
  ("Code", "TypeScript · Go · Rust · Python · Solidity · SQL"),
  ("AI / ML", "LLM extraction · RAG · evals · QLoRA / PEFT · vLLM · Ollama · MLX · faster-whisper · pyannote · docling · anomalib · ONNX"),
  ("Backend & data", "Bun · Elysia · Go (chi) · FastAPI · gRPC · RabbitMQ · PostgreSQL · MongoDB · ScyllaDB · Redis"),
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
