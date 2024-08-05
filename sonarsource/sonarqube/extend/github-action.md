# GitHub Action

## Workflow

### Monorepo

**Producer (Parent Repo):**

```yml
---
name: <AppName>

on:
  pull_request:
    branches:
      - main
    paths:
      - apps/<service-name>/**/*
  workflow_dispatch:

jobs:
  trigger:
    name: Trigger
    runs-on: ubuntu-22.04

    steps:
      - name: Guality Gate
        uses: actions/github-script@v6
        with:
          github-token: ${{ secrets.ORG_GH_TOKEN }}
          script: |
            await github.rest.actions.createWorkflowDispatch({
              owner: '<owner>',
              repo: '<service-name>',
              workflow_id: 'quality-gate.yml',
              ref: 'main'
            })
```

**Consumer (Service Name):**

```yml
---
name: Quality Gate

on:
  workflow_dispatch:

jobs:
  check:
    name: Check
    runs-on: ubuntu-22.04

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4
        with:
          repository: <owner>/<parent-repo>
          ref: main
          token: ${{ secrets.ORG_GH_TOKEN }}

      - name: SonarQube Scan
        uses: sonarsource/sonarqube-scan-action@v1.2.0
        with:
          projectBaseDir: apps/<service-name>
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}
          SONAR_HOST_URL: ${{ secrets.SONAR_HOST_URL }}
```
