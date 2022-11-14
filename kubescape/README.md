# Kubescape

<!--
https://github.com/kubescape/lens-extension
-->

**Keywords:** Risk Analysis, Security Compliance, RBAC Visualizer, Vulnerabilities Scanning

## Links

- [Code Repository](https://github.com/armosec/kubescape)

## Related

- [NSA, CISA release Kubernetes Hardening Guidance](https://nsa.gov/News-Features/Feature-Stories/Article-View/Article/2716980/nsa-cisa-release-kubernetes-hardening-guidance/)

## Glossary

- National Security Agency (NSA)
- Cybersecurity and Infrastructure Security Agency (CISA)

## CLI

### Installation

#### Linux Binary

```sh
curl \
  -L 'https://github.com/armosec/kubescape/releases/download/v0.0.38/kubescape' \
  -o /usr/local/bin/kubescape && \
    chmod +x /usr/local/bin/kubescape
```

#### go build

```sh
git clone 'https://github.com/armosec/kubescape.git' kubescape && cd "$_"

go mod tidy && \
  go build -o kubescape ./
```

### Commands

```sh
kubescape -h
```

### Usage

```sh
#
kubescape scan framework nsa \
  --exclude-namespaces kube-system,kube-public
```
