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
    - name: Checkout code
      uses: actions/checkout@v2
      with:
        # Disabling shallow clone is recommended for improving relevancy of reporting
        fetch-depth: 0

    - name: Fix links
      uses: tmcw/notfoundbot@v2.0.0-beta.1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
