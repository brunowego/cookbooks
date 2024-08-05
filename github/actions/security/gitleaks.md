# GitHub Actions Gitleaks

## Workflow

**Refer:** `./.github/workflows/gitleaks.yml`

```yml
name: gitleaks

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  scan:
    name: Secrets Management
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/checkout@v4
        # with:
        #   fetch-depth: 0

      - uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITLEAKS_LICENSE: ${{ secrets.GITLEAKS_LICENSE}}
```
