# Railway

<!--
https://youtube.com/watch?v=RdGxvYN82R4
-->

**Keywords:** Cloud Application Platform; PaaS

## Links

- [Main Website](https://railway.app)
- [Dashboard](https://railway.app/dashboard)
- [Templates](https://railway.app/templates)
- Docs
  - [Using Config as Code](https://docs.railway.app/guides/config-as-code)

## CLI

### Installation

#### Homebrew

```sh
brew install railway
```

### Commands

```sh
railway -h
```

### Configuration

```sh
#
railway login
```

### Usage

```sh
#
railway link <project>

#
railway up

#
railway run bun run ./src/index.ts
```

### Issues

<!-- #### Missing Port

```log

```

PORT -->

#### Monorepo Missing Workspace

```log
error: workspace dependency "@acme/eslint-config" not found
```

```sh
#
export NIXPACKS_CONFIG_FILE='./services/api/nixpacks.toml'
```

#### Bun Version Problem

```log
error: Workspace name "@acme/eslint-config" already exists
```

Problem with version `1.0.11` of bun. Try upgrade.

```sh
bun --version
```
