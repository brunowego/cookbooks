# Actions SonarQube

## Links

- [Code Repository](https://github.com/SonarSource/sonarqube-scan-action)

## Workflow

```yml
---
name: Run Python Tests

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:

jobs:
  test:
    name: pytest (${{ matrix.os }}, ${{ matrix.python-version }})
    runs-on: ${{ matrix.os }}
    strategy:
      fail-fast: false
      matrix:
        os: ['ubuntu-22.04']
        python-version: ['3.9']
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
        with:
          # Disabling shallow clone is recommended for improving relevancy of reporting
          fetch-depth: 0

      # ...

      # FIXME: Someone is overwrite of the SonarQube binary path.
      # https://community.sonarsource.com/t/github-action-sonarsource-sonarcloud-github-action-stopped-working/36665/4
      - run: |
          echo '/opt/sonar-scanner/bin' >> $GITHUB_PATH
          echo '/opt/java/openjdk/bin' >> $GITHUB_PATH

      - name: SonarQube Scan
        uses: sonarsource/sonarqube-scan-action@v1.2.0
        env:
          SONAR_TOKEN: ${{ secrets.SONARQUBE_TOKEN }}
          SONAR_HOST_URL: ${{ secrets.SONARQUBE_HOST_URL }}
```

<!--
      - uses: sonarsource/sonarqube-quality-gate-action@master
        timeout-minutes: 5
        env:
          SONAR_TOKEN: ${{ secrets.SONAR_TOKEN }}

-->
