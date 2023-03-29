# Turborepo

<!--
https://github.com/sorensenNiels/turborepo-tutorial
-->

<!--
npx @turbo/codemod add-package-manager --force
-->

## Alternatives

- [Monorepo Tools](/monorepo.md#tools)

## Links

- [Code Repository](https://github.com/vercel/turborepo)
- [Main Website](https://turborepo.org/)
- [Examples](https://github.com/vercel/turborepo/tree/main/examples)

## Guides

- [Getting Started with Turborepo](https://turborepo.org/docs/getting-started)
- [Turborepo Codemods](https://turborepo.org/docs/reference/codemods)

## CLI

### Installation

```sh
# Using NPM
npm install turbo -g

# Using Yarn 1.x
yarn global add turbo

# Using Yarn >= 2.x
yarn dlx turbo

# Using pnpm
pnpm add turbo -D
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
turbo login

#
turbo link
turbo unlink

#
turbo run build
turbo run build --force
turbo run build --graph
turbo run build --scope <@package/name>
```

## Library

### Installation

```sh
# Using Yarn
yarn add turbo --dev
```

### Bootstrap

#### Automatically

Use [create-turbo](/turborepo/create-turbo.md) to bootstrap an application.

#### Manually

```sh
#
mkdir -p ./{apps/landing,packages}
```

**Refer:** `./package.json`

```json
{
  // ...
  "workspaces": ["./apps/*", "./packages/*"],
  "scripts": {
    // ...
    "dev": "turbo run dev --parallel",
    "build": "turbo run build",
    "start": "turbo run start",
    "lint": "turbo run lint",
    "test": "turbo run test"
  }
}
```

**Refer:** `./turbo.json`

```json
{
  "$schema": "https://turborepo.org/schema.json",
  "pipeline": {
    "dev": {
      "cache": false
    },
    "lint": {
      "outputs": []
    },
    "test": {
      "outputs": []
    },
    "build": {
      "outputs": []
    },
    "start": {
      "outputs": []
    }
  }
}
```

## Issues

### TBD

```log
ERROR  run failed: Failed to add workspace "@org/ui" from apps/storybook, it already exists at packages/user-interface
```

TODO

### TBD

```log
[ERROR] invalid scope: No packages found matching the provided scope pattern.
```

TODO

### Run Without Daemon

```log
WARNING  failed to contact turbod. Continuing in standalone mode: connection to turbo daemon process failed. Please ensure the following: ...
You can also run without the daemon process by passing --no-daemon
```

```sh
yarn turbo daemon status
```

Add `--no-daemon` parameter to `turbo run`.

### Missing Package Manager

```log
[WARNING] Did not find "packageManager" in your package.json. Please run "npx @turbo/codemod add-package-manager"
```

```sh
npx @turbo/codemod add-package-manager
```

<!-- ## Dockerfile

https://turbo.build/repo/docs/handbook/deploying-with-docker -->
