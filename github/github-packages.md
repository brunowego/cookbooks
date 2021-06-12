# GitHub Packages

## Links

- [GitHub Settings - Token Page](https://github.com/settings/tokens)

## Docker

```sh
#
docker login \
  -u 'brunowego' \
  ghcr.io
```

## Issues

### Token Issue

```log
Error response from daemon: pull access denied for ghcr.io/[organization]/[image], repository does not exist or may require 'docker login': denied: permission_denied: The token provided does not match expected scopes.
```

Access the [GitHub settings token page](https://github.com/settings/tokens) and create new one.
docker pull ghcr.io/arcotech-services/php74-apache:latest
