# Dependabot

## Alternative

- [Renovate](/renovate.md)

## Links

- [Org. Repository](https://github.com/dependabot)

## Docs

- [Configuration options for the dependabot.yml file](https://docs.github.com/en/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file)

## Configuration

**Refer:** `./.github/dependabot.yml`

```yml
---
version: 2

registries:
  npm-github:
    type: npm-registry
    url: https://npm.pkg.github.com
    token: ${{ secrets.GH_TOKEN }}

updates:
  - package-ecosystem: npm
    directory: /
    schedule:
      interval: weekly
    registries:
      - npm-github
    # allow:
    #   - dependency-type: direct
    # versioning-strategy: increase
    # versioning-strategy: lockfile-only
    # commit-message:
    #   prefix: deps
    #   prefix-development: chore
    # labels:
    #   - dependencies
```

<!--
  - package-ecosystem: gitsubmodule
    directory: /
    schedule:
      interval: daily
-->

### Label Creation

1. Issues -> Labels
2. New label
   - Label name: `dependencies`
   - Description: `Pull requests that update a dependency file`
   - Color: `#C59F76`

## Tips

### Helpful Commands

| Command                                 | Description                                                              |
| --------------------------------------- | ------------------------------------------------------------------------ |
| `@dependabot cancel merge`              | Cancel a merge                                                           |
| `@dependabot close`                     | Close the PR and Dependabot will not recreate the same PR                |
| `@dependabot ignore`                    | Close the PR and stop depdendabot on this repository                     |
| `@dependabot ignore this dependency`    |                                                                          |
| `@dependabot ignore this minor version` | Close the PR and Dependabot will not recreate PRs for this minor version |
| `@dependabot ignore this major version` | Close the PR and Dependabot will not recreate PRs for this major version |
| `@dependabot merge`                     | Merge the pull after CI tests                                            |
| `@dependabot rebase`                    | Rebase the PR                                                            |
| `@dependabot recreate`                  | Force recreate the PR                                                    |
| `@dependabot reopen`                    | Reopen the closed PR                                                     |
| `@dependabot squash and merge`          | Squash and merge after CI tests                                          |

## Issues

### TBD

```log
Errored with the message "Dependabot can't authenticate to a private package registry"
```

TODO

### TBD

```log
Dependabot can't resolve your JavaScript dependency files
```

<!--
https://zenn.dev/risu729/articles/dependabot-engine-strict
-->

TODO
