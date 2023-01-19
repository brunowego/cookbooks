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
    - cron: 0 3 * * 0 # https://crontab.guru/#0_3_*_*_0
  workflow_dispatch:

jobs:
  zap_scan:
    runs-on: ubuntu-22.04
    name: Scan public website
    steps:
      - name: ZAP Scan
        uses: zaproxy/action-full-scan@v0.4.0
        with:
          issue_title: Vulnerability Scan Results
          token: ${{ secrets.GITHUB_TOKEN }}
          docker_name: owasp/zap2docker-stable
          target: http://domain.tld
          rules_file_name: ./.zap/rules.tsv
          cmd_options: '-a'
```
