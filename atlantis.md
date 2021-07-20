# Atlantis

<!--
https://github.com/runatlantis/helm-charts

tfstate war

Terragrunt
-->

## Links

- [Code Repository](https://github.com/runatlantis/atlantis)
- [Main Website](https://runatlantis.io/)

## Glossary

- Request For Comments (RFC)

## Guides

- [Creating a personal access token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token)

<!-- ##

- GitOps Automation for Terraform
- Pull Request Oriented
- Workflow Creation
- Plan/Apply Automation by Approval -->

<!-- ##

- Go Binary or Docker Image
- Multi-cloud
- Multi-providers
- Webhooks
- YAML Oriented
- Integration Hooks (Custom) -->

<!-- ##

- AWS
- GCP
- OCI
- New Relic -->

## GitOps

### Configuration

```sh
cat << EOF > ./atlantis.yaml
version: 3
automerge: true
projects:
- dir: .
  workspace: prod
  autoplan:
    when_modified: ["*"]
    enabled: true
EOF
```

### Commands

```sh
#
atlantis plan
atlantis plan -w prod

#
atlantis apply
atlantis apply -w prod

#
atlantis plan -d <directory>
atlantis apply -d <directory>

#
atlantis plan -- -destroy
atlantis plan -- -var=prod.tfvars
```

### Supported Providers

- Azure DevOps
- Bitbucket
- GitHub
- GitLab

<!-- ## Docker

###

https://github.com/msfidelis/atlantis-aws/tree/master/github

```sh
docker.io/runatlantis/atlantis:v0.17.0

EXPOSE 4141
``` -->

## CLI

### Installation

#### Homebrew

```sh
brew install atlantis
```

#### Binary

##### Dependencies

- [GNU Wget](/gnu-wget.md)
- [UnZip](/unzip.md)

##### Install

```sh
# Darwin
wget \
  'https://github.com/runatlantis/atlantis/releases/download/v0.17.0/atlantis_darwin_amd64.zip' \
  -O /tmp/atlantis.zip

# Linux
wget \
  'https://github.com/runatlantis/atlantis/releases/download/v0.17.0/atlantis_linux_amd64.zip' \
  -O /tmp/atlantis.zip

( cd /tmp && unzip ./atlantis.zip -d /usr/local/bin && rm ./atlantis.zip )
```

### Commands

```sh
atlantis -h
```

### Usage

```sh
#
atlantis testdrive

# GitHub
atlantis server \
  --gh-user [user] \
  --gh-token [token]

# GitHub
atlantis server \
  --gh-app-id [user] \
  --gh-app-key-file [key-file]

# GitLab
atlantis server \
  --gitlab-user [user] \
  --gitlab-token [token]

# Bitbucket
atlantis server \
  --bitbucket-user [user] \
  --bitbucket-token [token]

# Azure DevOps (ADO)
atlantis server \
  --azuredevops-user [user] \
  --azuredevops-token [token]
```

## Docker

### Running

```sh
docker run -it --rm \
  -h atlantis \
  --name atlantis \
  docker.io/runatlantis/atlantis:v0.17.2 atlantis -h
```

## Helm

### References

- [Chart Repository](https://github.com/runatlantis/helm-charts/tree/main/charts/atlantis)

### Repository

```sh
helm repo add runatlantis 'https://runatlantis.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
export INGRESS_HOST='127.0.0.1'

#
kubectl create namespace atlantis-system
```

```sh
helm install atlantis runatlantis/atlantis \
  --namespace atlantis-system \
  --version 3.14.0 \
  -f <(cat << EOF
orgWhitelist: github.com/[org-name]/*

github:
  user: [username]
  token: [token]
  secret: [secret]

ingress:
  host: atlantis.${INGRESS_HOST}.nip.io
  path:
  - /
EOF
)
```

### Status

```sh
kubectl rollout status deploy/logging-operator \
  -n atlantis-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=logging-operator' \
  -n atlantis-system \
  -f
```

### Port Forward

```sh
kubectl port-forward svc/atlantis 8080:80 \
  -n atlantis
```

<!--
http://atlantis.${INGRESS_HOST}.nip.io/events
-->

### Delete

```sh
helm uninstall atlantis \
  -n atlantis-system

kubectl delete namespace atlantis-system \
  --grace-period=0 \
  --force
```
