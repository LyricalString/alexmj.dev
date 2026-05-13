// @ts-check
import sitemap from "@astrojs/sitemap";
import { defineConfig } from "astro/config";

export default defineConfig({
  site: "https://alexmj.dev",
  output: "static",
  trailingSlash: "ignore",
  integrations: [sitemap()],
});
