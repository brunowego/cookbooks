# semantic-release

## Links

- [Code Repository](https://github.com/semantic-release/semantic-release)
- [Main Website](https://semantic-release.gitbook.io)

## Library

### Configuration

```sh
cat << EOF > ./.releaserc.yml
---
branches:
  - name: main
    prerelease: false

plugins:
  # - '@semantic-release/commit-analyzer'
  # - '@semantic-release/release-notes-generator'
  - '@semantic-release/github'
EOF
```

## CLI

### Setup

```sh
npx semantic-release-cli setup
```

### Commands

```sh
npx semantic-release -h
```
