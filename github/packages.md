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

## Credentials

```sh
#
docker-credential-desktop list
docker-credential-osxkeychain list

# Logout
jq 'del(.credsStore)' ~/.docker/config.json | sponge ~/.docker/config.json

docker logout ghcr.io

# Login
docker login \
  -u 'brunowego' \
  ghcr.io

#
docker pull ghcr.io/<organization>/<image>

docker push ghcr.io/<organization>/<image>
```

<!-- ```sh
echo -n '<username>:<password>' | base64

jq '.auths["ghcr.io"].auth'

jq
{
  "auths": {
    "ghcr.io": {
      "auth": ""
    }
  }
}
``` -->

<!--
docker \
  --config ./ \
  login \
    -u "brunowego" \
    ghcr.io
-->

## Issues

### Token Issue

```log
Error response from daemon: pull access denied for ghcr.io/[organization]/[image], repository does not exist or may require 'docker login': denied: permission_denied: The token provided does not match expected scopes.
```

Access the [GitHub settings token page](https://github.com/settings/tokens) and create new one.

```sh
docker pull ghcr.io/<organization>/<image>
```

### TBD

```log
denied: permission_denied: `<org>` forbids access via a personal access token (classic). Please use a GitHub App, OAuth App, or a personal access token with fine-grained permissions.
```

TODO

### TBD

```log
denied: permission_denied: The token provided does not match expected scopes.
```

TODO
