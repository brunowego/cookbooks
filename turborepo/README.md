# Turborepo

<!--
https://github.com/sorensenNiels/turborepo-tutorial
-->

<!--
npx @turbo/codemod add-package-manager --force
-->

<!--
apps
packages
tooling
-->

**Keywords:** Monorepo

## Links

- [Code Repository](https://github.com/vercel/turborepo)
- [Main Website](https://turborepo.org)
- [Examples](https://github.com/vercel/turborepo/tree/main/examples)

## Guides

- [Getting Started with Turborepo](https://turborepo.org/docs/getting-started)
- [Turborepo Codemods](https://turborepo.org/docs/reference/codemods)

## Library

### Installation

```sh
# Using Bun
bun add turbo -D
```

### Configuration

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    "clean": "turbo clean",
    "dev": "turbo dev",
    "lint": "turbo lint",
    "build": "turbo build",
    "start": "turbo start"
  }
  // ...
}
```

**Refer:** `./turbo.json`

```json
{
  "$schema": "https://turbo.build/schema.json",
  "globalDependencies": ["**/.env.*local"],
  "pipeline": {
    "clean": {
      "cache": false
    },
    "dev": {
      "cache": false,
      "persistent": true
    },
    "lint": {
      "dependsOn": ["^lint"]
    },
    "build": {
      "dependsOn": ["^build"]
    },
    "start": {
      "cache": false
    }
  }
}
```

**Refer:** `./apps/web/turbo.json`

```json
{
  "$schema": "https://turbo.build/schema.json",
  "extends": ["//"]
  // "pipeline": {
  //   "build": {
  //     "outputs": ["dist/**"]
  //   }
  // }
}
```

### Usage

```sh
#
bunx turbo telemetry status
bunx turbo telemetry disable

#
bunx turbo build --filter <pkg-name>
```

### Tips

#### VS Code Files Exclude

```sh
jq '."search.exclude"."**/.turbo" |= true' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

### Issues

#### Locked stdin

<!--
https://github.com/vercel/turbo/issues/1235
https://github.com/vercel/turbo/discussions/7802
-->

```sh
( cd ./packages/db; npx drizzle-kit generate:pg )
```

#### TBD

```log
× Invalid package dependency graph: cyclic dependency detected:
```

<!--
https://github.com/vercel/turbo/discussions/1752
https://github.com/vercel/turbo/issues/1480
-->

TODO

#### TBD

```log
EPERM: Operation not permitted
```

TODO

#### TBD

```log
Error: '@acme/web' should be listed in the project's dependencies. Run 'npm i -S @acme/web' to add it  import/no-extraneous-dependencies
```

TODO

#### Missing Global Env

```log
 25:12  high  NODE_ENV is not listed as a dependency in turbo.json  eslint/turbo/no-undeclared-env-vars
```

**Refer:** `./turbo.json`

```json
{
  // ...
  "globalEnv": ["NODE_ENV"]
  // ...
}
```

#### TBD

```log
ERROR  run failed: Failed to add workspace "@org/ui" from apps/storybook, it already exists at packages/user-interface
```

TODO

#### TBD

```log
[ERROR] invalid scope: No packages found matching the provided scope pattern.
```

TODO

#### Run Without Daemon

```log
WARNING  failed to contact turbod. Continuing in standalone mode: connection to turbo daemon process failed. Please ensure the following: ...
You can also run without the daemon process by passing --no-daemon
```

```sh
yarn turbo daemon status
```

Add `--no-daemon` parameter to `turbo run`.

#### Missing Package Manager

```log
[WARNING] Did not find "packageManager" in your package.json. Please run "npx @turbo/codemod add-package-manager"
```

```sh
npx @turbo/codemod add-package-manager
```

## CLI

### Installation

```sh
# Using NPM
npm install turbo -g

# Using Yarn 1.x
yarn global add turbo

# Using Bun
bun install turbo -g
```

### Commands

```sh
# Using NPX
npx turbo -h

# Using pnpm
pnpm dlx turbo -h

# Using Local
turbo -h
```

### Usage

```sh
#
npx turbo login

#
npx turbo link
npx turbo unlink

#
turbo run build
turbo run build --force
turbo run build --graph
turbo run build --scope <@package/name>

#
yarn run build --filter @medusajs/dashboard
```

### Issues

#### Failed to Contact Turbo Daemon

```log
WARNING  Failed to check if we can skip restoring outputs for @acme/api#build: GrpcFailure(DeadlineExceeded). Proceeding to check cache

WARNING  Failed to mark outputs as cached for @acme/api#build: Error with daemon: server is unavailable
```

<!--
https://github.com/vercel/turbo/issues/2034
https://github.com/vercel/turbo/issues/2790
https://github.com/vercel/turbo/issues/3800
https://github.com/vercel/turbo/issues/4608
-->

TODO

```sh
#
./node_modules/.bin/turbo daemon status

#
./node_modules/.bin/turbo daemon start
```

#### Unsupported Lockfile Version

```log
Turbo error: Failed to encode pruned lockfile: Unable to generate pnpm-lock.yaml with lockfileVersion: 6.1. Supported lockfile versions are [5.3 5.4 6.0]
```

<!--
https://github.com/vercel/turbo/issues/5117
-->

Pump `turbo` to `>=1.10.3`.

<!-- ## Dockerfile

https://turbo.build/repo/docs/handbook/deploying-with-docker -->
