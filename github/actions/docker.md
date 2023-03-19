# Actions Docker

<!--
Matrix Example

https://github.com/jauderho/dockerfiles/blob/63a6a3228e1b32e6c7cb972a32a5f81f554e5031/.github/workflows/ansible.yml

https://evilmartians.com/chronicles/build-images-on-github-actions-with-docker-layer-caching
-->

## Links

- [Code Repository](https://github.com/docker/build-push-action)
- [Marketplace](https://github.com/marketplace/actions/build-and-push-docker-images)

## Workflow

**Refer:** `./.github/workflows/ci.yml`

```yml
---
name: Docker Build and Push

on:
  pull_request:
    branches:
      - main
    paths:
      # - ...
      - .dockerignore
      - Dockerfile
  push:
    branches:
      - main
    paths:
      # - ...
      - .dockerignore
      - Dockerfile

concurrency:
  group: main

jobs:
  build:
    runs-on: ubuntu-22.04
    steps:
      - name: Get short SHA
        id: sha
        run: echo "::set-output name=sha12::$(echo ${GITHUB_SHA} | cut -c 1-12)"

      - name: Checkout code
        uses: actions/checkout@v3
        # with:
        #   # Disabling shallow clone is recommended for improving relevancy of reporting
        #   fetch-depth: 0

      - name: Set up Docker Buildx
        id: buildx
        uses: docker/setup-buildx-action@v1

      - name: Cache Docker layers
        uses: actions/cache@v3
        with:
          path: /tmp/.buildx-cache
          key: ${{ runner.os }}-buildx-${{ hashFiles('Dockerfile') }}
          restore-keys: ${{ runner.os }}-buildx-

      - name: Login to GitHub Container Registry
        if: github.ref == 'refs/heads/main'
        uses: docker/login-action@v2
        with:
          registry: ghcr.io
          username: ${{ github.actor }}
          password: ${{ secrets.GITHUB_TOKEN }}

      - name: Build and Push Docker Image
        uses: docker/build-push-action@v3
        with:
          builder: ${{ steps.buildx.outputs.name }}
          cache-from: type=local,src=/tmp/.buildx-cache
          cache-to: type=local,dest=/tmp/.buildx-cache
          context: ./
          push: ${{ github.ref == 'refs/heads/main' }}
          tags: |
            ghcr.io/${{ github.repository }}:${{ steps.sha.outputs.sha12 }}
            ghcr.io/${{ github.repository }}:latest
```
