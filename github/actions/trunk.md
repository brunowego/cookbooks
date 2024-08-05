# Actions Trunk

## Workflow

**Refer:** `./.github/workflows/lint.yml`

```yml
---
name: Static Code Analysis (Lint)

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:

concurrency:
  group: ${{ github.head_ref || github.run_id }}
  cancel-in-progress: true

permissions: write-all

jobs:
  lint:
    name: Check
    runs-on: ubuntu-22.04

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Setup pnpm 9
        uses: pnpm/action-setup@v4
        with:
          version: 9

      - name: Setup Node.js 20
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: pnpm

      - name: Install dependencies
        run: pnpm install
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Trunk check
        uses: trunk-io/trunk-action@v1
```
