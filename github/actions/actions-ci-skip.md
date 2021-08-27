# Actions CI Skip

## Links

- [Code Repository](https://github.com/mstachniuk/ci-skip)

## Workflow

```yaml
name: Continuous Integration

on:
  push:
    branches:
    - main

jobs:
  sync-apps:
    runs-on: ubuntu-latest
    steps:
    # ...

    - uses: mstachniuk/ci-skip@v1
      with:
        commit-filter: '[ci skip];[CI skip];[CI-skip];[ci-skip];[CI SKIP];[CI-SKIP]'
        commit-filter-separator: ';'
        fail-fast: true
```
