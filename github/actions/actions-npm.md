# Actions NPM

## Workflow

```yaml
name: GitHub Actions Workflow with NPM cache

on: [push]

jobs:
  build:
    runs-on: ubuntu-18.04

    steps:
    - uses: actions/checkout@v1

    - name: Cache NPM dependencies
      uses: actions/cache@v1
      with:
        path: ~/.npm
        key: ${{ runner.OS }}-npm-cache-${{ hashFiles('**/package-lock.json') }}
        restore-keys: |
          ${{ runner.OS }}-npm-cache-

    - name: Install NPM dependencies
      run: npm install
```
