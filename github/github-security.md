# GitHub Security

## Security Policy

```sh
cat << EOF > ./SECURITY.md
# Security Policy

## Reporting a Vulnerability

Please report suspected security vulnerabilities to security [at] example [dot] com. You will receive a response from us within 72 hours. If the issue is confirmed, we will release a patch as soon as possible depending on complexity.
EOF
```

## Dependabot Alerts

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
      - Dependencies
```

## Code Scanning Alerts

TODO
