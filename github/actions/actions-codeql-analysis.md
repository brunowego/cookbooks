# GitHub Actions CodeQL Analysis

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
  - cron: 0 0 * * *

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
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
    - name: Checkout repository
      uses: actions/checkout@v2

    - name: Initialize CodeQL
      uses: github/codeql-action/init@v1
      with:
        languages: ${{ matrix.language }}

    - name: Autobuild
      uses: github/codeql-action/autobuild@v1

    - name: Perform CodeQL Analysis
      uses: github/codeql-action/analyze@v1
```
