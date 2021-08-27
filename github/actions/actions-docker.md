# Actions Docker

## Workflow

```yaml
name: Docker Build and Push

on:
  push:
    branches:
    - main
    paths:
    - docker/**
    - '!docker/README.md'
  pull_request:
    branches:
    - main
    paths:
    - docker/**
    - '!docker/README.md'

concurrency:
  group: main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout Code
      uses: actions/checkout@v2

    - name: Login to GitHub Container Registry
      uses: docker/login-action@v1
      with:
        registry: ghcr.io
        username: ${{ secrets.GH_REGISTRY_USERNAME }}
        password: ${{ secrets.GH_REGISTRY_PASSWORD }}

    - name: Build and Push Docker Image
      uses: docker/build-push-action@v2
      with:
        context: ./
        push: ${{ github.event_name != 'pull_request' }}
        tags: ghcr.io/${{ github.repository }}:latest
```
