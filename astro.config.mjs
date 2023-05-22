import { defineConfig, sharpImageService } from "astro/config";

export default defineConfig({
  experimental: {
    assets: true,
  },
  image: {
    service: sharpImageService(),
  },
});
