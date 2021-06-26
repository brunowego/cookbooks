# Kubeval

## Links

- [Code Repository](https://github.com/instrumenta/kubeval)
- [Main Website](https://kubeval.com)

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L \
  'https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-darwin-amd64.tar.gz' | \
    tar -xzC /usr/local/bin kubeval
```

#### Linux Binary

```sh
curl \
  -L \
  'https://github.com/instrumenta/kubeval/releases/download/v0.16.1/kubeval-linux-amd64.tar.gz' | \
    tar -xzC /usr/local/bin kubeval
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
