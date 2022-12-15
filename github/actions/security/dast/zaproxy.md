# GitHub Actions with OWASP Zed Attack Proxy (ZAP)

## Links

- [Code Repository](https://github.com/zaproxy/action-full-scan)

<!--
https://github.com/zaproxy/action-baseline
https://github.com/zaproxy/action-api-scan
-->

## Workflow

**Refer:** `./.github/workflows/zaproxy.yml`

```yml
---
on:
  schedule:
    - cron: '0 1 * * *'
  workflow_dispatch:

jobs:
  zap_scan:
    runs-on: ubuntu-22.04
    name: Scan ZAP website
    steps:
      - name: ZAP Scan
        uses: zaproxy/action-full-scan@v0.4.0
        with:
          target: 'http://ifs4205-gp02-1.comp.nus.edu.sg'
```
