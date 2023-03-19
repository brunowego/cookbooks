# GitHub Actions Cypress

## Links

- [Code Repository](https://github.com/cypress-io/github-action)

<!-- ## Workflow

**Refer:** `./.github/workflows/cypress.yml`

```yml
---
name: Cypress E2E

on:
  push:
    branches:
    - main
  pull_request:
    branches:
    - main

jobs:
  cypress:
    name: Run Cypress
    runs-on: ubuntu-22.04
    permissions:
      actions: read
      contents: read
      security-events: write

    strategy:
      fail-fast: false
      matrix:
        language:
        - javascript

    steps:
    - name: Checkout code
      uses: actions/checkout@v3
      # with:
      #   # Disabling shallow clone is recommended for improving relevancy of reporting
      #   fetch-depth: 0

    - name: Cypress run
      uses: cypress-io/github-action@v2
      with:
        headless: true
        build: yarn build
        start: yarn start
``` -->
