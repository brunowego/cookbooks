# Actions Release It

<!--
https://github.com/marketplace/actions/release-it-github-action
-->

## Configuration

**Refer:** `./.github/workflows/release.yml`

```yml
---
name: Package Release

on:
  workflow_dispatch:
    inputs:
      releaseType:
        type: choice
        description: Version Type
        required: true
        default: 'patch'
        options:
          - patch
          - minor
          - major
      dry:
        type: boolean
        description: 'Is Dry Run?'
        required: false
        default: false

concurrency:
  group: ${{ github.head_ref || github.run_id }}
  cancel-in-progress: true

env:
  CI: true

permissions:
  contents: write

defaults:
  run:
    shell: bash

jobs:
  release:
    name: New Release
    runs-on: ubuntu-22.04
    permissions:
      contents: write
      id-token: write

    steps:
      - name: Checkout repo
        uses: actions/checkout@v4

      - name: Setup pnpm 9
        uses: pnpm/action-setup@v4
        with:
          version: 9

      - name: Setup Node.js 20
        uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: pnpm

      - name: Set Git username
        run: |-
          git config --global user.name 'Release It'
          git config --global user.email 'actions@users.noreply.github.com'

      - name: Install dependencies
        run: pnpm install
        env:
          GITHUB_TOKEN: ${{ secrets.GH_TOKEN }}

      - name: Publish package
        run: |
          pnpm release-it --ci -i ${{ inputs.releaseType }} ${{ inputs.dry && '--dry-run' || '' }}
        env:
          NODE_AUTH_TOKEN: ${{ secrets.GH_TOKEN }}
          GITHUB_TOKEN: ${{ secrets.GH_TOKEN }}
```

## Issues

### TBD

```log
npm ERR! 403 403 Forbidden - PUT https://npm.pkg.github.com/@acme%2femail - Permission installation not allowed to Write organization package
```

<!--
https://github.com/orgs/community/discussions/57724
-->

TODO

### Wrong registry

```log
ERROR Not authenticated with npm. Please `npm login` and try again.
```

**Refer:** `./package.json`

```json
{
  // ...
  "publishConfig": {
    "registry": "https://npm.pkg.github.com"
  }
}
```

### TBD

```log
npm error code ENEEDAUTH
npm error need auth This command requires you to be logged in.
npm error need auth You need to authorize this machine using `npm adduser`
```

TODO
