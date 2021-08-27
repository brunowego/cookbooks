# Keycloak Realm Generator & Importer (kci)

**Keywords:** Fake users

## Links

- [Code Repository](https://github.com/nmasse-itix/keycloak-import-realm)

## CLI

### Dependencies

- [Keycloak](/keycloak/README.md#docker)

### Installation

#### Darwin Binary

```sh
curl \
  -L "https://github.com/nmasse-itix/keycloak-import-realm/releases/download/$(curl -s https://api.github.com/repos/nmasse-itix/keycloak-import-realm/releases/latest | grep tag_name | cut -d '"' -f 4)/kci-darwin-amd64.tar.gz" | \
  tar -xzC /usr/local/bin
```

#### Linux Binary

```sh
curl \
  -L "https://github.com/nmasse-itix/keycloak-import-realm/releases/download/$(curl -s https://api.github.com/repos/nmasse-itix/keycloak-import-realm/releases/latest | grep tag_name | cut -d '"' -f 4)/kci-linux-amd64.tar.gz" | \
  tar -xzC /usr/local/bin
```

### Commands

```sh
kci -h
```

### Usage

```sh
# Generate
kci generate \
  --clients 10 \
  --realms 5 \
  --target ./realms \
  --users 1000

#
jq -r '.users | length' ./realms/*.json

# Configuration
kci config set realm --value 'master'
kci config set login --value 'admin'
kci config set password --value 'admin'
kci config set keycloak_url --value 'http://127.0.0.1:8080/auth'
kci config set workers --value 10

# Show file config
cat ~/.kci.yaml

#
kci import ./realms/*.json
```

<!-- ### Issues

####

```log
missingParameter.accessToken
```

TODO -->
