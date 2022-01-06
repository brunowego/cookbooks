# GitHub Action notfoundbot

## Links

- [Code Repository](https://github.com/tmcw/notfoundbot)

## Workflow

**Refer:** `./.github/workflows/notfoundbot.yml`

```yaml
---
name: notfoundbot

on:
  schedule:
  - cron: 0 5 * * *  # https://crontab.guru/#0_5_*_*_*

jobs:
  check:
    runs-on: ubuntu-18.04
    steps:
    - name: Checkout Code
      uses: actions/checkout@v2

    - name: Fix links
      uses: tmcw/notfoundbot@v2.0.0-beta.1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
