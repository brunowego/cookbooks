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

### Commands

```sh
npx turbo -h
```

### Usage

```sh
#
npx turbo login

#
npx turbo link
npx turbo unlink

#
npx turbo run build
npx turbo run build --force
npx turbo run build --graph
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
