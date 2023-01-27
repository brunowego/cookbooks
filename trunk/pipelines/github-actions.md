# Trunk with GitHub Actions

## Workflow

**Refer:** `./.github/workflows/lint.yaml`

```yml
---
name: Static Code Analysis

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:

jobs:
  lint:
    name: Check
    runs-on: ubuntu-22.04

    steps:
      - name: Checkout code
        uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Trunk check
        uses: trunk-io/trunk-action@v1
        with:
          check-mode: all
```
