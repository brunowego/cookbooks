# Helm

<!--
https://github.com/komodorio/helm-dashboard
-->

<!--
https://github.com/scaleoutsystems/charts/blob/4d445a66906cdaf5d51864c2a71f55281bdcb5e2/.github/workflows/release.yaml

https://linkedin.com/learning/kubernetes-package-management-with-helm/manage-kubernetes-workloads-with-helm

https://app.pluralsight.com/library/courses/kubernetes-packaging-applications-helm/table-of-contents
https://app.pluralsight.com/library/courses/kubernetes-package-administration-helm/table-of-contents

https://medium.com/@saraswatpuneet/blue-green-deployments-using-helm-charts-93ec479c0282

kubectl get helmrelease/<name> -n <namespace> -o yaml | \
  yq .spec.values -y | \
    helm upgrade -i <release name> -f - <chart>
-->

## Links

- [Code Repository](https://github.com/helm/helm)
- [Main Website](https://helm.sh)

## Alternatives

- [Kustomize](/kustomize.md)

## References

- [Artifact HUB](https://artifacthub.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install helm
```

#### Unix-like

```sh
curl -Ss 'https://raw.githubusercontent.com/helm/helm/master/scripts/get' | \
  /bin/bash
```

### Commands

```sh
helm -h
```

### Usage

```sh
#
helm env

# Create
helm create <name>

# List
helm list -A

# Lint
helm lint <name>

# Debug
helm install <name> \
  --dry-run \
  --debug

# Dependency
helm dep build

# Package
helm package <name>

# Start Serve
nohup helm serve \
  --address '127.0.0.1:8879' \
  --repo-path "$(helm home)/repository/local" \
  --url 'http://127.0.0.1:8879/charts' \
  &> /dev/null &

echo -e '[INFO]\thttp://127.0.0.1:8879'

# Index
# helm repo index ./
helm repo index \
  --url 'http://127.0.0.1:8879/charts' \
  ./

# Add
helm repo add local 'http://127.0.0.1:8879/charts'
helm repo update

# Search
helm search repo <repo-name>
helm search repo <repo-name> -l
helm search repo <repo-name>/<chart-name> --versions

# Install
helm install <name> local/<name> \
  --namespace <name>

# Remove
helm repo remove local

# Stop Server
pkill helm
```

### Tips

#### Force Redeploy

```sh
#
helm upgrade <name> <repo-name>/<chart-name> \
  -n <namespace> \
  --version <version>
```

#### Plugin

```sh
#
helm plugin list

#
helm plugin update <name>

#
helm plugin uninstall <name>
```

<!-- #### History

```sh
#
helm history
``` -->

#### Upgrade Helm

```sh
#
helm list -n '<namespace>'

#
helm history '<name>' \
  -n '<namespace>'

#
helm get values '<name>' \
  -n '<namespace>'

#
helm upgrade <name> <repo-name>/<chart-name> \
  -n <namespace> \
  --version 3.13.0 \
  --dry-run \
  -f ./values.yaml

#
helm rollback '<name>' '<revision>' \
  -n '<namespace>'
```

#### Show Values of a Chart

```sh
#
helm search repo <repo-name>/<chart-name> --versions

#
helm show values <repo-name>/<chart-name> \
  --version <semver>
```

#### Download Helm Chart Files

```sh
helm pull sentry/sentry \
  -d ./ \
  --untar=true \
  --version 11.2.0
```

#### Get Values of Installed Chart

```sh
helm get values '<name>' \
  -n '<namespace>'
```

<!-- ####

```sh
helm template <repo>/<chart> > ./manifest.yaml
``` -->

#### Visual Studio Code

```sh
#
code --install-extension technosophos.vscode-helm

#
jq '."recommendations" += ["technosophos.vscode-helm"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### Delete All Deployed Helms

```sh
helm uninstall $(helm ls --all --short) -n $(helm ls --all --short)
```

#### Overwrite Values

```sh
# Prefix Image with Registry
helm inspect values <repo>/<name> | sed 's|repo/image|registry.xyz.tld/repo/image|'

# When install
helm install <name> <repo>/<name> \
  --namespace <namespace> \
  -f <(helm inspect values <repo>/<name> | sed 's|repo/image|registry.xyz.tld/repo/image|')
```

<!-- ####

```sh
helm install polyaxon polyaxon/polyaxon \
  --namespace polyaxon \
  --debug \
  --dry-run
``` -->

<!-- ####

```sh
helm upgrade polyaxon polyaxon/polyaxon \
  --dry-run \
  --debug \
  --install \
  --namespace polyaxon
``` -->

#### Purge without Hooks

```sh
helm uninstall <name> \
  --purge \
  --no-hooks
```

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Helm
source <(helm completion zsh)
```

```sh
source ~/.zshrc
```

### Issues

#### Update Failed - Context Deadline Exceeded

```log
Error: UPGRADE FAILED: Get "https://<secret>.us-east-1.elb.amazonaws.com/api/v1/namespaces/sentry/services/sentry-snuba": context deadline exceeded
```

```sh
helm install \
  # ...
  --debug
```

[Change the DNS](/dns.md#set-dns).

#### Failed Timeout Condition

```log
Error: failed post-install: timed out waiting for the condition
```

```sh
helm install \
  # ...
  --timeout 15m \
  --wait
```

#### Kubernetes Configuration

```log
WARNING: Kubernetes configuration file is group-readable. This is insecure. Location: ~/.kube/config
WARNING: Kubernetes configuration file is world-readable. This is insecure. Location: ~/.kube/config
```

```sh
chmod go-r ~/.kube/config
```

<!-- ####

```log
Error: plugin home "$HELM_HOME/plugins" does not exist
```

```sh
mkdir -p ~/.helm/plugins
``` -->

#### API Version

```log
Error: validation failed: unable to recognize "": no matches for kind "Deployment" in version "extensions/v1beta1"
```

```sh
# export HELM_CHART=stable/lamp
# export HELM_VERSION=1.1.2

#
helm fetch stable/lamp

#
tar -xzf ./lamp-1.1.2.tgz && rm ./lamp-1.1.2.tgz

#
sed -i 's|extensions/v1beta1|apps/v1|g' ./lamp/templates/deployment.yaml
```

Add code below to `./lamp/templates/deployment.yaml`:

```yml
---
spec:
  <...>
  selector:
    matchLabels:
      app: {{ template "lamp.name" . }}
      release: {{ .Release.Name }}
  <...>
```

```sh
#
helm package ./lamp -d ~/.helm/repository/local && rm -R ./lamp

#
helm search lamp

# Start Serve

#
helm repo update
```

```sh
kubectl create ns lamp
```

```sh
helm install lamp local/lamp \
  --namespace lamp \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.domain="lamp.${DOMAIN}"
```

```sh
# Delete
rm "$(helm home)/repository/local/lamp-1.1.2.tgz"

helm repo index "$(helm home)/repository/local"
```

```sh
helm uninstall lamp -n lamp
kubectl delete ns lamp --grace-period=0 --force
```

### Uninstall

```sh
sudo rm -fR /usr/local/bin/helm
```

```sh
rm -fR "$(helm home)"
```

## Tiller

### Dependencies

#### RBAC

```sh
kubectl create serviceaccount tiller \
  -n kube-system
```

```sh
kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller
```

### Init

```sh
# Default
helm init \
  --history-max 10 \
  --service-account tiller

# Skip Refresh
helm init \
  --history-max 10 \
  --service-account tiller \
  --skip-refresh \
  --wait

# Personalized
helm init \
  --history-max 10 \
  --service-account tiller \
  -i "gcr.io/kubernetes-helm/tiller:$(curl -s https://api.github.com/repos/helm/helm/releases/latest | grep tag_name | cut -d '"' -f 4)"
```

### Status

```sh
kubectl rollout status deploy/tiller-deploy -n kube-system
```

### Logs

```sh
kubectl logs -l 'app=helm,name=tiller' -n kube-system -f
```

### Issues

#### Missing Resource Kind

```log
Error: UPGRADE FAILED: error validating "": error validating data: [apiVersion not set, kind not set]
```

```sh
#
helm template ./ | \
  kubeval \
    --force-color \
    --strict
```

#### Upgrade Operation in Progress

```log
Error: UPGRADE FAILED: another operation (install/upgrade/rollback) is in progress
```

```sh
#
helm history <name> \
  -n <namespace>

#
helm rollback <name> <revision> \
  -n <namespace>
```

#### Local Chart Repository

```log
Hang tight while we grab the latest from your chart repositories...
...Unable to get an update from the "local" chart repository (http://127.0.0.1:8879/charts):
	Get http://127.0.0.1:8879/charts/index.yaml: dial tcp 127.0.0.1:8879: connect: connection refused
```

Run Helm serve.

#### Self-signed Certificate

```log
Error: Looks like "https://chartmuseum.xyz.tld" is not a valid chart repository or cannot be reached: Get https://chartmuseum.xyz.tld/index.yaml: x509: certificate signed by unknown authority
```

```sh
sudo mkdir -p /etc/ssl/{certs,private}/example
```

```sh
sudo chmod a+w /etc/ssl/{certs,private}/example
```

```sh
openssl s_client \
  -connect chartmuseum.xyz.tld:443 \
  -showcerts \
  -servername chartmuseum.xyz.tld < /dev/null 2>/dev/null | \
    openssl x509 -outform PEM > /etc/ssl/certs/example/root-ca.pem
```

```sh
helm repo add --ca-file /etc/ssl/certs/example/root-ca.pem example https://chartmuseum.xyz.tld
```

<!-- #### Transport Closing

```log
E0924 14:25:51.932342   32716 portforward.go:233> lost connection to pod
Error: transport is closing
```

TODO -->

#### DNS

```log
Error: forwarding ports: error upgrading connection: unable to upgrade connection: pod does not exist
```

Add current external ip and hostname to each node machine:

```sh
# Using shell
sudo /usr/bin/sh -c 'echo -e "$(hostname -I | awk '\''{print $2}'\'')\t$(hostname)" >> /etc/hosts'

# Using hostess
sudo hostess add "$(hostname)" "$(hostname -I | awk '{print $2}')"
```

#### Service Account

```log
Error: configmaps is forbidden: User "system:serviceaccount:kube-system:default" cannot list resource "configmaps" in API group "" in the namespace "kube-system"
```

```sh
#
kubectl create serviceaccount tiller -n kube-system

#
kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller

#
kubectl patch deploy -n kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

#
helm init \
  --service-account tiller \
  --upgrade
```

### Delete & Reset

```sh
helm reset --force

kubectl delete clusterrolebinding tiller-cluster-rule

kubectl delete serviceaccount tiller -n kube-system
```
