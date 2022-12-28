# Cert Manager (cert-manager)

<!--
https://github.com/cert-manager/cert-manager/issues/921
-->

**Keywords:** X.509 Certificate Controller

## Links

- [Code Repository](https://github.com/cert-manager/cert-manager)
- [Main Website](https://cert-manager.io/)

## Docs

- [Supported Annotations](https://cert-manager.io/docs/usage/ingress/#supported-annotations)
- [Securing NGINX-ingress](https://cert-manager.io/docs/tutorials/acme/ingress/)
- [Troubleshooting Issuing ACME Certificates](https://cert-manager.io/docs/faq/acme/)
- [Kubernetes CertificateSigningRequests](https://cert-manager.io/docs/usage/kube-csr/)

## Issuers

- [Amazon Web Services (AWS)](/aws/README.md)
- [Azure](/azure/README.md)
- [Cloudflare](/cloudflare.md)
- [Google Cloud Platform (GCP)](/gcp/README.md)
- [Let's Encrypt](/letsencrypt.md)

## CLI

### Links

- [Docs](https://cert-manager.io/docs/reference/cmctl/)

### Installation

#### Homebrew

```sh
brew install cmctl
```

#### Linux Binary

```sh
CMCTL_VERSION="$(curl -s https://api.github.com/repos/cert-manager/cert-manager/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl -L \
    "https://github.com/cert-manager/cert-manager/releases/download/v${CMCTL_VERSION}/cmctl-linux-amd64.tar.gz" | \
      tar -xzC /usr/local/bin cmctl
```

### Commands

```sh
cmctl -h
```

### Usage

```sh
#
cmctl status
```

## Lens (Non-official)

### Installation

1. Lens -> Extensions
2. Copy [TGZ URL Address of latest version](https://github.com/jkroepke/lens-extension-certificate-info/releases)
3. Extensions -> Paste in the Field URL -> Install

<!--
lens://app/extensions/install/lens-certificate-info
-->

## Helm

### References

- [Helm Charts](https://github.com/cert-manager/cert-manager/tree/master/deploy/charts/cert-manager)

### Dependencies

- [NGINX Ingress Controller](/nginx/ingress-controller/README.md#helm)

### Repository

```sh
helm repo add jetstack 'https://charts.jetstack.io'
helm repo update
```

### Install

```sh
#
kubectl create ns cert-system
# kubectl create ns security

#
helm search repo -l jetstack/cert-manager

#
helm install cert-manager jetstack/cert-manager \
  --namespace cert-system \
  --version v1.10.1 \
  -f <(cat << EOF
installCRDs: true

ingressShim:
  defaultIssuerKind: ClusterIssuer
  defaultIssuerName: letsencrypt-issuer

prometheus:
  enabled: false
EOF
)

#
kubectl get all -n cert-system
```

### Status

```sh
kubectl rollout status deploy/cert-manager \
  -n cert-system
```

### Delete

```sh
helm uninstall cert-manager \
  -n cert-system

kubectl delete ns cert-system \
  --grace-period=0 \
  --force
```
