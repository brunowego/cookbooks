# GitHub Actions Lighthouse CI

<!--
https://github.com/correttojs/next-monorepo/blob/main/.github/workflows/lighthouse.yml
-->

## Workflow

```yml
---
name: Lighthouse CI

on:
  pull_request:
    branches:
      - main
  workflow_dispatch:

jobs:
  test:
    name: Test
    runs-on: ubuntu-22.04

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4
        # with:
        #   fetch-depth: 0

      - name: Use Node.js 14
        uses: actions/setup-node@v2
        with:
          node-version: 14

      - name: Install dependencies
        run: yarn install --frozen-lockfile

      - name: Build application
        run: yarn build

      - name: Run Lighthouse CI
        uses: treosh/lighthouse-ci-action@v8
        with:
          configPath: ./.lighthouserc.json
          uploadArtifacts: true
          temporaryPublicStorage: true
```

```sh
act \
  -P ubuntu-22.04=docker.io/catthehacker/ubuntu:js-18.04-dev \
  -j test \
  -W ./.github/workflows/lighthouse-ci.yml \
  -v
```
