# Kubeval

_Unmaintained:_ Use [kubeconform](/kubeconform.md)

**Keywords:** Kubernetes Manifests Validator

## Links

- [Code Repository](https://github.com/instrumenta/kubeval)
- [Main Website](https://kubeval.com)

## CLI

### Installation

#### Darwin Binary

```sh
KUBEVAL_VERSION="$(curl -s https://api.github.com/repos/instrumenta/kubeval/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL_VERSION}/kubeval-darwin-amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        'kubeval'
```

#### Linux Binary

```sh
KUBEVAL_VERSION="$(curl -s https://api.github.com/repos/instrumenta/kubeval/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/instrumenta/kubeval/releases/download/v${KUBEVAL_VERSION}/kubeval-linux-amd64.tar.gz" | \
      tar \
        -xzC /usr/local/bin \
        'kubeval'
```

#### Chocolatey

```sh
choco install kubeval
```

### Commands

```sh
kubeval -h
```

### Usage

```sh
#
kubeval \
  --force-color \
  --strict \
  [filename]

#
kubeval \
  --additional-schema-locations 'file:///tmp/flux-crd-schemas' \
  --ignore-missing-schemas \
  --skip-kinds 'ClusterConfig,CustomResourceDefinition' \
  --force-color \
  --strict \
  [filename]

#
helm template . | \
  kubeval \
    --force-color \
    --strict

#
kustomize build ./base | \
  kubeval \
    --force-color \
    --strict
```

### Issues

#### Skip Kinds

```log
ERR  - stdin: Failed initializing schema https://kubernetesjsonschema.dev/master-standalone-strict/prometheusrule-monitoring-v1.json: Could not read schema from HTTP, response status is 404 Not Found

ERR  - stdin: Failed initializing schema https://kubernetesjsonschema.dev/master-standalone-strict/servicemonitor-monitoring-v1.json: Could not read schema from HTTP, response status is 404 Not Found
```

```sh
kubeval \
  --skip-kinds 'PrometheusRule,ServiceMonitor' \
  --force-color \
  --strict \
  [filename]
```
