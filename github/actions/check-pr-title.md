# GitHub Action Check PR Title

## Workflow

```yml
---
name: Check PR Title

on:
  pull_request_target:
    types:
      - opened
      - edited
      - synchronize

jobs:
  check-pr-title:
    name: Check PR Title
    runs-on: ubuntu-22.04
    steps:
      - uses: amannn/action-semantic-pull-request@v3.4.0
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
