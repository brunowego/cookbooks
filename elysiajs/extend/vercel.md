# Extend with Vercel

## Configuration

<!--
{
  "builds": [
    {
      "src": "dist/server.js",
      "use": "@vercel/node"
    }
  ],
  "rewrites": [{ "source": "/(.*)", "destination": "/dist/server.js" }]
}
-->

<!--
{
  "$schema": "https://openapi.vercel.sh/vercel.json",
  "installCommand": "bun install",
  "buildCommand": "bun run build",
  "outputDirectory": "dist",
  "devCommand": "bun dev"
}
-->

TODO

## Issues

### Missing fn

```log
error: Could not resolve: "@elysiajs/fn". Maybe you need to "bun install"?
```

```sh
bun add @elysiajs/fn
```

### Wrong Output Directory

```log
Error: No Output Directory named "public" found after the Build completed. You can configure the Output Directory in your Project Settings.
```

1. Settings -> General tab
2. Build & Development Settings -> Output Directory -> Override
3. Set to `dist` -> Save
4. Deployments -> Redeploy
