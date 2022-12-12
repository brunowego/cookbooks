# GitHub Action Dynamic Application Security Testing (DAST)

## Workflow

**Refer:** `./.github/workflows/notfoundbot.yml`

```yml
---
on:
  schedule:
    - cron: '0 1 * * *'
  workflow_dispatch:

jobs:
  zap_scan:
    runs-on: ubuntu-latest
    name: Scan ZAP website
    steps:
      - name: ZAP Scan
        uses: zaproxy/action-full-scan@v0.4.0
        with:
          target: 'http://ifs4205-gp02-1.comp.nus.edu.sg'
```
