# Dependabot

## Alternative

- [Renovate](/renovate.md)

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
    interval: weekly
  open-pull-requests-limit: 0
  # allow:
  # - dependency-name: [dep-name]
  # ignore:
  # - dependency-name: [dep-name]
  labels:
  - dependencies
  assignees:
  - brunowego
EOF
```

<!--
@dependabot ignore this minor version
@dependabot ignore this major version
-->
