# GitHub Actions CodeQL Analysis

**Important:** Only for public repositories or Enterprise account.

## Links

- [Actions Cache](https://github.com/actions/cache/blob/main/examples.md#php---composer)
- [Code Repository](https://github.com/github/codeql)
- [Main Website](https://codeql.github.com/)

## Workflow

**Refer:** `./.github/workflows/codeql-analysis.yml`

```yaml
---
name: CodeQL

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  schedule:
    - cron: 0 0 * * * # https://crontab.guru/#0_0_*_*_*

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-18.04
    permissions:
      actions: read
      contents: read
      security-events: write

    strategy:
      fail-fast: false
      matrix:
        language:
          - javascript

    steps:
      - name: Checkout Code
        uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - name: Initialize CodeQL
        uses: github/codeql-action/init@v2
        with:
          languages: ${{ matrix.language }}

      - name: Autobuild
        uses: github/codeql-action/autobuild@v2

      - name: Perform CodeQL Analysis
        uses: github/codeql-action/analyze@v2
```

## Issues

### Not Enabled

```log
Error: repository not enabled for code scanning
```

Only for public repositories or Enterprise account.
