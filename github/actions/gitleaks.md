# GitHub Actions Gitleaks

## Workflow

**Refer:** `./.github/workflows/notfoundbot.yml`

```yml
name: gitleaks

on: [push, workflow_dispatch]

jobs:
  scan:
    name: Secrets Management
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0

      - uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITLEAKS_LICENSE: ${{ secrets.GITLEAKS_LICENSE}}
```
