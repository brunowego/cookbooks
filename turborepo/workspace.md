# Workspaces

## Configuration

### Yarn

**Refer:** `./package.json`

```json
{
  // ...
  "workspaces": ["apps/*", "packages/*", "tooling/*"]
}
```

### pnpm

**Refer:** `./pnpm-workspace.yaml`

```yaml
---
packages:
  - apps/*
  - packages/*
  - tooling/*
```
