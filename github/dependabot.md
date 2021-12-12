# Dependabot

## Links

- [Org. Repository](https://github.com/dependabot)

## Configuration

```sh
cat << EOF > ./.github/dependabot.yml
version: 2

updates:
- package-ecosystem: npm
  directory: /
  schedule:
    interval: daily
  # allow:
  # - dependency-name: [dep-name]
  # ignore:
  # - dependency-name: [dep-name]
  labels:
  - dependencies
EOF
```
