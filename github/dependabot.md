# Dependabot

## Alternative

- [Renovate](/renovate.md)

## Links

- [Org. Repository](https://github.com/dependabot)

## Docs

- [Configuration options for the dependabot.yml file](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file)

## Configuration

**Refer:** `./.github/dependabot.yml`

```yaml
---
version: 2

updates:
  - package-ecosystem: npm
    directory: /
    schedule:
      interval: daily
    allow:
      - dependency-type: direct
    versioning-strategy: increase
    commit-message:
      prefix: deps
      prefix-development: chore
    labels:
      - dependencies
```

### Label Creation

1. Issues -> Labels
2. New label
   - Label name: `dependencies`
   - Description: `Pull requests that update a dependency file`
   - Color: `#C59F76`

## Tips

### Comments

```txt
@dependabot rebase

@dependabot ignore this dependency

@dependabot ignore this minor version
@dependabot ignore this major version
```
