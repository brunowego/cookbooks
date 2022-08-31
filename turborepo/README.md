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

# Using Yarn
yarn global add turbo
```

### Commands

```sh
# Using NPX
npx turbo -h

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
turbo run build --scope [@package/name]
```

### Bootstrap

Use [create-turbo](/turborepo/create-turbo.md) to bootstrap an application.

### Configuration

#### Vercel

1. Project -> Settings
2. General
   - Build & Development Settings
     - Build Command:
       - Using NPM: `cd ../../ && npx turbo run build --scope=[@package/name] --include-dependencies --no-deps`
       <!-- - Using Yarn: `cd ../../ && yarn turbo run build --scope=web --include-dependencies --no-deps` -->
     - Install Command:
       - Using NPM: `npm install --prefix ../../`
       - Using Yarn: `yarn install --cwd ../../`
   - Root Directory: `apps/web`
3. Environment Variables -> Add New
   - Name: `ENABLE_ROOT_PATH_BUILD_CACHE`
   - Value: `1`
   - Add

## Issues

### TBD

```log
[ERROR] invalid scope: No packages found matching the provided scope pattern.
```

TODO

### Missing Package Manager

```log
[WARNING] Did not find "packageManager" in your package.json. Please run "npx @turbo/codemod add-package-manager"
```

```sh
npx @turbo/codemod add-package-manager
```
