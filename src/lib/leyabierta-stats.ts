const FALLBACK = { norms: 12272, reforms: 43883 };

export interface LeyAbiertaStats {
  laws: string;
  commits: string;
  raw: { norms: number; reforms: number };
}

let cached: Promise<LeyAbiertaStats> | null = null;

export function getLeyAbiertaStats(): Promise<LeyAbiertaStats> {
  if (!cached) cached = fetchOnce();
  return cached;
}

async function fetchOnce(): Promise<LeyAbiertaStats> {
  let stats = FALLBACK;
  try {
    const res = await fetch("https://api.leyabierta.es/v1/stats", {
      signal: AbortSignal.timeout(5000),
    });
    if (res.ok) {
      const data = await res.json();
      if (typeof data?.norms === "number" && typeof data?.reforms === "number") {
        stats = { norms: data.norms, reforms: data.reforms };
      }
    }
  } catch {
    // network/timeout/parse failure — keep fallback
  }
  return {
    laws: stats.norms.toLocaleString("en-US"),
    commits: stats.reforms.toLocaleString("en-US"),
    raw: stats,
  };
}
