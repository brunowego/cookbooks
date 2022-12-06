# Docker Scan

## Links

- [Code Repository](https://github.com/docker/scan-cli-plugin)

## CLI

### Dependencies

- [Snyk Auth Token](https://app.snyk.io/account)

### Commands

```sh
docker scan -h
```

### Usage

```sh
#
docker scan \
  --login \
  --token <snyk-token>

#
export SNYK_INTEGRATION_NAME='GITHUB_ACTIONS'
export SNYK_INTEGRATION_VERSION='node'

# Local
docker scan --file ./Dockerfile docker.io/library/docker-scan:e2e

# Remotely
docker scan <image>
```

### Issues

#### Invalid Manifest

```log
Invalid manifest schema version undefined
```

TODO
