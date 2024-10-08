# TurboRepo

<!-- ##

```sh
npm init

npx create-turbo@latest
``` -->

## Library

### Structure

<!--
mobile
-->

```sh
#
mkdir -p {./apps/{api,app,assets,blog,bot,changelog,cms,console,docs,embed,landing,mail,og,relay,worker},./packages/{preset,tsconfig,ui}}

#
rm -fR ./.next

#
mv ./src ./apps/landing
mv ./test ./apps/landing
mv ./.eslintrc.{cjs,js} ./apps/landing
mv ./{.env,.example.env} ./apps/landing
mv ./next* ./apps/landing
mv ./package.json ./apps/landing
mv ./playwright.config.ts ./apps/landing
mv ./postcss.config.js ./apps/landing
mv ./tailwind.config.{cjs,js} ./apps/landing
mv ./tsconfig.json ./apps/landing
```

### Checklist

- Move general `devDependencies` and `scripts` from `./apps/landing/package.json` to `./package.json`.

### Configuration

```sh
#
sed -i '/\/.next/d' ./.gitignore
sed -i '1s;^;/.next\n;' ./apps/landing/.gitignore

#
echo '/.turbo' >> ./apps/landing/.gitignore

#
sed -i '/\/.env/d' ./.gitignore
echo '/.env*' >> ./apps/landing/.gitignore
```

**Refer:** `./package.json`

```json
{
  "private": true,
  "workspaces": ["./apps/*", "./packages/*"],
  "scripts": {
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
  "$schema": "https://turbo.build/schema.json",
  // "globalDependencies": ["./apps/landing/.env"],
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
      "dependsOn": ["^build"],
      "outputs": ["./.next/**"]
    },
    "start": {
      "outputs": []
    }
  }
}
```

<!-- **Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type { import('@types/eslint').Linter.Config }
 */
const eslintRC = {
  extends: 'eslint:recommended',
  parserOptions: {
    sourceType: 'module',
  },
  // ...
}

module.exports = eslintRC
``` -->

### Installation

```sh
# Using NPM
npm install turbo --save-dev

# Using Yarn
yarn add turbo --ignore-workspace-root-check --dev
```

### Issues

<!-- #### TBD

```env
TURBO_TELEMETRY_DISABLED=1
DO_NOT_TRACK=1
``` -->

#### TBD

```log
WARN! Missing required `build` task in turbo.json. Skipping automatic setting assignment.
```

**Refer:** `./turbo.json`

```json
{
  "$schema": "https://turbo.build/schema.json",
  "tasks": {
    // ...
    "build": {
      "dependsOn": ["^build"]
    }
  }
}
```
