# GitHub Packages

<!--
https://github.com/github/roadmap/issues/93
-->

## Links

- [Main Website](https://github.com/features/packages)
- [GitHub Settings - Token Page](https://github.com/settings/tokens)

## Supported

- Docker
- NPM
- Maven
- NuGet
- RubyGems

## Docker

```sh
#
jq 'del(.credsStore)' ~/.docker/config.json | sponge ~/.docker/config.json

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

```sh
docker pull ghcr.io/[organization]/[image]
```
