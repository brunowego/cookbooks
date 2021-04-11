# Matomo Environment Variables

## Installation

```sh
# Host
cd /path/to/matomo

# Docker
docker exec -it matomo /bin/sh
```

```sh
MATOMO_PLUGIN_VERSION="$(curl -ks https://api.github.com/repos/matomo-org/plugin-EnvironmentVariables/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  curl -kL "https://github.com/matomo-org/plugin-EnvironmentVariables/archive/${MATOMO_PLUGIN_VERSION}.tar.gz" | \
    tar -xzC ./plugins --transform "s/plugin-EnvironmentVariables-${MATOMO_PLUGIN_VERSION}/EnvironmentVariables/"
```

## Activate

```sh
./console plugin:activate EnvironmentVariables
```
