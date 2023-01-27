# Actions PHP

## Links

- [Actions Cache](https://github.com/actions/cache/blob/main/examples.md#php---composer)

## Workflow

```yml
---
name: GitHub Actions Workflow with Composer cache

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-22.04

    steps:
      - name: Get Composer Cache Directory
        id: get-composer-cache-dir
        run: echo "::set-output name=dir::$(composer config cache-files-dir)"

      - name: Cache Composer
        uses: actions/cache@v2
        id: composer-cache
        with:
          path: ${{ steps.get-composer-cache-dir.outputs.dir }}
          key: ${{ runner.os }}-composer-${{ hashFiles('**/composer.lock') }}
          restore-keys: ${{ runner.os }}-composer-

      - name: Install composer dependencies
        if: steps.composer-cache.outputs.cache-hit != 'true'
        run: composer install
```
