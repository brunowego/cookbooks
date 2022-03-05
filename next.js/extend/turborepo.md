# TurboRepo

## Structure

```sh
#
mkdir -p {./apps/{admin,assets,blog,docs,site,worker},./packages/{preset,tsconfig,ui}}

#
rm -fR ./.next

#
mv ./src ./apps/site
mv ./test ./apps/site
mv ./.eslintrc.{cjs,js} ./apps/site
mv ./{.env,.example.env} ./apps/site
mv ./next* ./apps/site
mv ./package.json ./apps/site
mv ./playwright.config.ts ./apps/site
mv ./postcss.config.js ./apps/site
mv ./tailwind.config.{cjs,js} ./apps/site
mv ./tsconfig.json ./apps/site
```

## Checklist

- Move general dependencies and scripts from `./apps/site/package.json` to `./package.json`.

## Configuration

```sh
#
sed -i '/\/.next/d' ./.gitignore
sed -i '1s;^;/.next\n;' ./apps/site/.gitignore

#
echo '/.turbo' >> ./apps/site/.gitignore

#
sed -i '/\/.env/d' ./.gitignore
echo '/.env*' >> ./apps/site/.gitignore
```

**Refer:** `./package.json`

```json
{
  "private": true,
  "workspaces": [
    "./apps/*",
    "./packages/*"
  ],
  "scripts": {
    "dev": "turbo run dev --parallel",
    "lint": "turbo run lint",
    "test": "turbo run test",
    "build": "turbo run build",
    "start": "turbo run start"
  }
}
```

**Refer:** `./turbo.json`

```json
{
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

**Refer:** `./.eslintrc.cjs`

```cjs
/**
 * @type {import('@types/eslint').Linter.Config}
 */
const eslintRC = {
  extends: 'eslint:recommended',
  parserOptions: {
    sourceType: 'module',
  },
  env: {
    es6: true,
  },
  rules: {
    'comma-dangle': ['warn', 'always-multiline'],
    semi: ['warn', 'never'],
    'no-console': [
      'warn',
      {
        allow: ['warn', 'error'],
      },
    ],
  },
}

module.exports = eslintRC
```

## Installation

```sh
# Using NPM
npm install turbo --save-dev

# Using Yarn
yarn add turbo --ignore-workspace-root-check --dev
```
