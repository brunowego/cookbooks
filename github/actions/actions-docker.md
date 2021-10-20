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

```yaml
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
    runs-on: ubuntu-latest
    steps:
    - name: Checkout Code
      uses: actions/checkout@v2

    - name: Set up Docker Buildx
      id: buildx
      uses: docker/setup-buildx-action@v1

    - name: Cache Docker layers
      uses: actions/cache@v2
      with:
        path: /tmp/.buildx-cache
        key: ${{ runner.os }}-buildx-${{ hashFiles('Dockerfile') }}
        restore-keys: ${{ runner.os }}-buildx-

    - name: Login to GitHub Container Registry
      if: github.ref == 'refs/heads/main'
      uses: docker/login-action@v1
      with:
        registry: ghcr.io
        username: ${{ github.actor }}
        password: ${{ secrets.GITHUB_TOKEN }}

    - name: Build and Push Docker Image
      uses: docker/build-push-action@v2
      with:
        builder: ${{ steps.buildx.outputs.name }}
        cache-from: type=local,src=/tmp/.buildx-cache
        cache-to: type=local,dest=/tmp/.buildx-cache
        context: ./
        push: ${{ github.ref == 'refs/heads/main' }}
        tags: |
          ghcr.io/${{ github.repository }}:${{ github.sha }}
          ghcr.io/${{ github.repository }}:latest
```
