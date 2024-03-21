# Atlantis

<!--
https://github.com/runatlantis/helm-charts

https://github.com/infracost/vscode-infracost
-->

**Keywords:** Terraform Pull Request Automation

## Links

- [Code Repository](https://github.com/runatlantis/atlantis)
- [Main Website](https://runatlantis.io)

## Glossary

- Request For Comments (RFC)

## Guides

- [Creating a personal access token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-token)
- [Provider Credentials](https://runatlantis.io/docs/provider-credentials.html)

## Supported Providers

- Azure DevOps
- Bitbucket
- GitHub
- GitLab

<!-- ##

- GitOps Automation for Terraform
- Pull Request Oriented
- Workflow Creation
- Plan/Apply Automation by Approval -->

<!-- ## Key Features

- Go Binary or Docker Image
- Multi-cloud
- Multi-providers
- Webhooks
- YAML Oriented
- Integration Hooks (Custom) -->

## GitOps

### Configuration

```sh
cat << EOF > ./atlantis.yaml
---
version: 3

projects:
- &shared
  name: my-app-stg
  dir: ./.devops/terraform
  workspace: stg
  terraform_version: v0.14.7
  workflow: stg
  autoplan:
    when_modified: [
      ./*.tf,
      ./modules/**/*.tf,
      ./policies/*.tpl,
      ./vars/*.tfvars
    ]
    enabled: true
  apply_requirements: [mergeable]

- <<: *shared
  name: my-app-prd
  workspace: prd
  workflow: prd
  apply_requirements: [mergeable]
  # apply_requirements: [approved, mergeable]

workflows:
  stg:
    plan:
      steps:
      # - run: rm -fR ./.terraform
      - init:
      - plan:
          extra_args: [-var-file, ./vars/terraform-stg.tfvars]

  prd:
    plan:
      steps:
      # - run: rm -fR ./.terraform
      - init:
      - plan:
          extra_args: [-var-file, ./vars/terraform-prd.tfvars]
EOF
```

### Commands

```sh
#
atlantis plan
atlantis plan -w stg
atlantis plan -w prd

#
atlantis apply
atlantis apply -w stg
atlantis apply -w prd

#
atlantis plan -d <directory>
atlantis apply -d <directory>

#
atlantis plan -- -destroy
atlantis plan -- -var=stg.tfvars
atlantis plan -- -var=prd.tfvars

#
atlantis unlock
```

## CLI

### Installation

#### Homebrew

```sh
brew install atlantis
```

#### Binary

##### Dependencies

- [GNU Wget](/gnu/wget.md)
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
  --gh-user <user> \
  --gh-token <token>

# GitHub
atlantis server \
  --gh-app-id <user> \
  --gh-app-key-file <key-file>

# GitLab
atlantis server \
  --gitlab-user <user> \
  --gitlab-token <token>

# Bitbucket
atlantis server \
  --bitbucket-user <user> \
  --bitbucket-token <token>

# Azure DevOps (ADO)
atlantis server \
  --azuredevops-user <user> \
  --azuredevops-token <token>
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
kubectl create ns atlantis
# kubectl create ns automation

#
kubens atlantis

#
helm search repo -l runatlantis/atlantis

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install atlantis runatlantis/atlantis \
  --version 4.13.1 \
  -f <(cat << EOF
orgWhitelist: github.com/<org-name>/*

github:
  user: <username>
  token: <token>
  secret: <secret>

ingress:
  host: atlantis.$DOMAIN
  path:
    - /
EOF
)
```

<!-- ### Status

```sh
kubectl rollout status deploy/atlantis
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=atlantis' \
  -f
``` -->

### Port Forward

```sh
kubectl port-forward \
  svc/atlantis \
  8080:80 \
  --address 0.0.0.0 \
  -n atlantis
```

<!--
http://atlantis.${K8S_DOMAIN}/events
-->

<!--
#
kubectl get secret atlantis-tf-envs \
  -o json | \
    jq '.data | map_values(@base64d)'

#
kubectl get secret google-credentials \
  -o json | \
    jq '.data | map_values(@base64d)'
-->

### Delete

```sh
helm uninstall atlantis

kubectl delete ns atlantis \
  --grace-period=0 \
  --force
```
