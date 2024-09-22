# Extend with Render

## Links

- [Blueprint YAML Reference](https://docs.render.com/blueprint-spec)

## Configuration

### Manual

1. [Dashboard](https://dashboard.render.com)
2. Getting started -> Service type -> Web Services -> New Web Service
3. Configure
   - Git Provider -> Select Repository -> Connect
   - Build Command: `corepack enable && pnpm install --frozen-lockfile && pnpm build`
   - Start Command: `pnpm start`

### Config. File

**Refer:** `./render.yaml`

```yml
---
services:
  - name: Web
    type: web
    runtime: node
    plan: free
    buildCommand: corepack enable && pnpm install --frozen-lockfile && pnpm build
    startCommand: pnpm start
    region: oregon
    repo: https://github.com/<owner>/<repo>
    branch: main
    domains:
      - example.com
      - www.example.com
    healthCheckPath: /healthz
```
