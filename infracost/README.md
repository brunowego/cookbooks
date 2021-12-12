# Infracost

<!--
https://github.com/infracost/infracost-atlantis
https://github.com/marketplace/actions/infracost
-->

**Keywords:** FinOps

## Links

- [Code Repository](https://github.com/infracost/infracost)
- [Main Website](https://infracost.io/)

## Docs

- [CI/CD Integrations](https://infracost.io/docs/integrations/cicd)

## Guides

- [Usage-based resources](https://infracost.io/docs/usage_based_resources/)

## CLI

### Installation

#### Homebrew

```sh
brew install infracost
```

#### Linux Binary

```sh
curl -L 'https://github.com/infracost/infracost/releases/download/v0.9.3/infracost-linux-amd64.tar.gz' | \
  tar -xzC /usr/local/bin --transform s/-linux-amd64//
```

### Commands

```sh
infracost -h
```

### Bootstrap

```sh
# Get API token
infracost register

# Show credentials
cat ~/.config/infracost/credentials.yml

# Create inside the project
cat << EOF > ./infracost-usage.yml
version: 0.1
resource_usage: {}
EOF
```

### Usage

```sh
#
terraform workspace list

#
terraform workspace show

#
infracost configure set currency USD
infracost configure set currency BRL

#
cat ~/.config/infracost/configuration.yml

#
infracost breakdown \
  -p ./ \
  --show-skipped \
  --sync-usage-file \
  --terraform-plan-flags "-var-file=./vars/terraform-$(terraform workspace show).tfvars" \
  --usage-file ./infracost-usage.yml

#
infracost diff \
  -p ./ \
  --show-skipped \
  --sync-usage-file \
  --terraform-plan-flags "-var-file=./vars/terraform-$(terraform workspace show).tfvars" \
  --usage-file ./infracost-usage.yml
```

## Helm

### References

- [Helm Chart](https://github.com/infracost/helm-charts/tree/master/charts/cloud-pricing-api)

### Repository

```sh
helm repo add infracost 'https://infracost.github.io/helm-charts/'
helm repo update
```

### Install

```sh
#
kubectl create ns infracost-system

#
export KUBERNETES_IP='127.0.0.1'
export DOMAIN="${KUBERNETES_IP}.nip.io"
export INFRACOST_API_KEY="$(yq e '.api_key' ~/.config/infracost/credentials.yml)"

#
helm install cloud-pricing-api infracost/cloud-pricing-api \
  --namespace infracost-system \
  --version 0.4.3 \
  -f <(cat << EOF
infracostAPIKey: $INFRACOST_API_KEY

ingress:
  enabled: true
  hosts:
  - host: cloud-pricing-api.${DOMAIN}
    paths:
    - path: /

postgresql:
  postgresqlPassword: $(echo -n $(openssl rand -base64 32))
EOF
)
```

### Status

```sh
kubectl rollout status deploy/cloud-pricing-api \
  -n infracost-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=cloud-pricing-api' \
  -n infracost-system \
  -f
```

### Configuration

```sh
#
export INFRACOST_API_KEY="$(kubectl get secret cloud-pricing-api -o jsonpath='{.data.self-hosted-infracost-api-key}' -n infracost-system | base64 -d)"

#
infracost configure set pricing_api_endpoint "https://cloud-pricing-api.${DOMAIN}"
infracost configure set api_key "$INFRACOST_API_KEY"

#
cat ~/.config/infracost/credentials.yml
```

<!--
INFRACOST_PRICING_API_ENDPOINT
INFRACOST_API_KEY
-->

### Delete

```sh
helm uninstall cloud-pricing-api \
  -n infracost-system

kubectl delete ns infracost-system
```
