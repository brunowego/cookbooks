# Action Render

<!--
https://github.com/sspangsberg/MEN_RESTAPI_EASV_S23/blob/main/.github/workflows/main.yaml
-->

<!--
https://github.com/marketplace/actions/render-deploy-action 604
https://github.com/marketplace/actions/deploy-to-render 101
https://github.com/marketplace/actions/render-github-action 44
https://github.com/marketplace/actions/render-deployment 36
https://github.com/marketplace/actions/deploy-to-render-com 17
https://github.com/marketplace/actions/render-com-deploy 13
https://github.com/marketplace/actions/render-ci-deploy 4
https://github.com/marketplace/actions/render-redeploy-action 1
-->

```yml
---
name: Deploy

on:
  push:
    branches:
      - with-render
    paths:
      - src/**
      - package.json
      - pnpm-lock.yaml
      - tsup.config.ts
  workflow_dispatch:

jobs:
  release:
    name: Deployment
    runs-on: ubuntu-22.04
    permissions:
      contents: write

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Render deploy
        uses: johnbeynon/render-deploy-action@747373cdb7b9b3f561438e063ee0815b71584f1b
        with:
          service-id: ${{ secrets.RENDER_SERVICE_ID }} # Starts with srv-
          api-key: ${{ secrets.RENDER_API_KEY }} # Starts with rnd_
```
