# Flux CD

**Keywords:** Operator, GitOps

<!--
https://github.com/paulcarlton-ww/weaveworks-cx-task

https://github.com/stefanprodan/gitops-istio
https://github.com/ruzickap/k8s-flagger-istio-flux
https://github.com/datalayer-examples/flux-crossplane-example
https://github.com/datalayer-examples/flux2-kustomize-helm-example
https://github.com/datalayer-examples/flux2-multi-tenancy-example

https://www.youtube.com/watch?v=R6OeIgb7lUI
-->

## Dependencies

- [Helm Charts](/helm.md)

## Workflow

| Step | Action | Detail |
| --- | --- | --- |
| 0 | Commit Infra Code | Create/Change/Delete cloud and Kubernetes infrastructure via Terraform/Kubestack/Jenkins X |
| 1a | Commit App Code | Write application code and commit it to application Git repository (GitHub/GitLab/ADO etc.) |
| 1b | Commit Cluster Code | Write Kubernetes cluster code (YAML manifests) and commit to deploy repository for app/cluster configurations |
| 2 | Merge/Trigger | Pull request to merge and trigger container build |
| 3 | Push Image | Push to Container/Helm Registry |
| 4 | Update Deploy Repo | If application configurations changes from the application Git repository update deployment Git repository so that the FLux operator can pick up changes |
| 5 | Operator Sync | Flux operator syncs with deployment Git repository & Container/Helm repository watching for changes and will apply manifest/s (Kubectl apply) to namespaces if changes are needed |

## Helm

### References

- [Get started with Flux using Helm](https://github.com/fluxcd/flux/blob/master/docs/tutorials/get-started-helm.md)

### Dependencies

- [GitLab CE/EE](/gitlab_ce.md)

### Project

```sh
git clone https://github.com/fluxcd/flux-get-started flux-get-started && cd "$_"
```

```sh
rm -fR ./.git && git init
```

```sh
git config http.sslVerify false
```

```sh
git remote add origin "https://gitlab.example.com/[username]/flux-get-started.git"
```

```sh
sed -i "s|github.com/weaveworks/flux-get-started|gitlab.example.com/[username]/flux-get-started|" ./releases/ghost.yaml
```

```sh
git add -A && git commit -m 'chore(repo): initial commit' && git push
```

### Repository

```sh
helm repo add fluxcd https://charts.fluxcd.io
helm update
```

### Install

```sh
kubectl apply -f https://raw.githubusercontent.com/fluxcd/flux/helm-0.10.1/deploy-helm/flux-helm-release-crd.yaml
```

```sh
kubectl create namespace flux
```

```sh
helm install flux fluxcd/flux \
  --namespace flux \
  --set helmOperator.create=true \
  --set helmOperator.createCRD=false \
  --set git.url='git@gitlab.example.com:[username]/flux-get-started' \
  --set git.user='John Doe' \
  --set git.email='jdoe@example.com' \
  --set-string ssh.known_hosts="$(ssh-keyscan gitlab.example.com 2> /dev/null)"
```

### Status

```sh
kubectl rollout status deploy/flux -n flux
```

### Deploy keys

```sh
# using logs
kubectl logs deployment/flux -n flux | grep identity.pub | cut -d '"' -f 2

# using cli
fluxctl identity --k8s-fwd-ns flux
```

```sh
echo -e '[INFO]\thttps://gitlab.example.com/[username]/flux-get-started/-/settings/repository'
```

### Logs

```sh
kubectl logs deployment/flux -n flux -f
```

### Delete

```sh
helm uninstall flux -n flux
kubectl delete namespace flux --grace-period=0 --force
kubectl delete -f https://raw.githubusercontent.com/fluxcd/flux/helm-0.10.1/deploy-helm/flux-helm-release-crd.yaml
```

## CLI

### Installation

#### Homebrew

```sh
brew tap fluxcd/tap

brew install flux
```

### Commands

```sh
flux -h
```

### Usage

```sh
#
flux check --pre

#
flux bootstrap github \
  --kubeconfig=${kubeconfig_path} \
  --owner=${GITHUB_ORG} \
  --repository=${GITHUB_REPO} \
  --branch=main \
  --path=${path}
```
