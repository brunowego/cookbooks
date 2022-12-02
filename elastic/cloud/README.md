# Elastic Cloud

<!--
https://elastic.co/guide/en/cloud/current/ec-multiple-node-deployment-disk-used.html
-->

## Links

- [Main Website](https://elastic.co/cloud/)
- [Deployments](https://cloud.elastic.co/deployments/)
- [API keys](https://cloud.elastic.co/deployment-features/keys)

## Docs

- Document APIs
  - [Delete API](https://elastic.co/guide/en/elasticsearch/reference/8.5/docs-delete.html)

## Key Feature

- [Log Monitoring](https://elastic.co/observability/log-monitoring)
- [Infrastructure Monitoring](https://elastic.co/observability/infrastructure-monitoring)
- [APM](https://elastic.co/observability/application-performance-monitoring)
- [Synthetic Monitoring](https://elastic.co/observability/synthetic-monitoring)
- [Enterprise Search](https://elastic.co/enterprise-search)
- [Maps](https://elastic.co/maps)
- [SIEM](https://elastic.co/security/siem)
- [Endpoint Security](https://elastic.co/security/endpoint-security/)

## Services

- [Elasticsearch Service (ESS)](https://elastic.co/elasticsearch/)
- [Elastic Cloud Enterprise (ECE)](https://elastic.co/ece/)
- Elasticsearch Service Private (ESSP)

## CLI

### Links

- [Code Repository](https://github.com/elastic/ecctl)
- [Docs](https://elastic.co/guide/en/ecctl/master/ecctl-overview.html)

### Installation

#### Homebrew

```sh
brew tap elastic/tap
brew install ecctl
```

#### Linux Binary

```sh
ELASTIC_ECCTL_VERSION="$(curl -s https://api.github.com/repos/elastic/ecctl/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://download.elastic.co/downloads/ecctl/${ELASTIC_ECCTL_VERSION}/ecctl_${ELASTIC_ECCTL_VERSION}_linux_amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin ecctl
```

### Commands

```sh
ecctl -h
```

### Initialize

```sh
#
ecctl init

#
cat ~/.ecctl/config.json
```

### Usage

```sh
#
ecctl deployment list
ecctl deployment extension list

#
ecctl stack list
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Elastic Cloud
source <(ecctl generate completions)
```

```sh
source ~/.zshrc
```
