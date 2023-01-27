# GitHub Actions CodeQL Analysis

**Important:** Only for public repositories or Enterprise account.

## Links

- [Actions Cache](https://github.com/actions/cache/blob/main/examples.md#php---composer)
- [Code Repository](https://github.com/github/codeql)
- [Main Website](https://codeql.github.com)
- [Supported languages and frameworks](https://codeql.github.com/docs/codeql-overview/supported-languages-and-frameworks/)

## Workflow

**Refer:** `./.github/workflows/codeql-analysis.yml`

```yml
---
name: CodeQL Analysis

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  schedule:
    - cron: 0 3 * * 0 # https://crontab.guru/#0_3_*_*_0

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-22.04
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
      - name: Checkout code
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
        with:
          category: /language:${{matrix.language}}
```

## Issues

### Not Enabled

```log
Error: repository not enabled for code scanning
```

Only for public repositories or Enterprise account.
