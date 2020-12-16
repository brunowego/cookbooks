# Helm

<!--
https://www.linkedin.com/learning/kubernetes-package-management-with-helm/manage-kubernetes-workloads-with-helm

https://app.pluralsight.com/library/courses/kubernetes-packaging-applications-helm/table-of-contents
https://app.pluralsight.com/library/courses/kubernetes-package-administration-helm/table-of-contents

https://medium.com/@saraswatpuneet/blue-green-deployments-using-helm-charts-93ec479c0282
-->

## CLI

### Installation

#### Unix-like

```sh
curl -Ss https://raw.githubusercontent.com/helm/helm/master/scripts/get | /bin/bash
```

### Commands

```sh
helm -h
```

### Usage

```sh
# Create
helm create [name]

# Lint
helm lint [name]

# Debug
helm install [name] \
  --dry-run \
  --debug

# Dependency
helm dep build

# Package
helm package [name]

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
helm repo update local

# Install
helm install local/[name] \
  -n [name] \
  --namespace [name]

# Remove
helm repo remove local

# Stop Server
pkill helm
```

### Tips

#### Visual Studio Code

```sh
code --install-extension technosophos.vscode-helm
```

#### Delete All

```sh
helm delete $(helm ls --all --short) --purge
```

#### Overwrite Values

```sh
# Prefix Image with Registry
helm inspect values [repo]/[name] | sed 's|repo/image|registry.example.com/repo/image|'

# When install
helm install [repo]/[name] \
  -n [name] \
  --namespace [namespace] \
  -f <(helm inspect values [repo]/[name] | sed 's|repo/image|registry.example.com/repo/image|')
```

<!-- ####

```sh
helm install polyaxon/polyaxon \
  -n polyaxon \
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
helm delete [name] \
  --purge \
  --no-hooks
```

#### Autocomplete

```sh
# bash
source <(helm completion bash)

# zsh
source <(helm completion zsh)
```

### Issues

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

```yaml
spec:
  [...]
  selector:
    matchLabels:
      app: {{ template "lamp.name" . }}
      release: {{ .Release.Name }}
  [...]
```

```sh
#
helm package ./lamp -d ~/.helm/repository/local && rm -R ./lamp

#
helm search lamp

# Start Serve

#
helm repo update local
```

```sh
kubectl create namespace lamp
```

```sh
helm install local/lamp \
  -n lamp \
  --namespace lamp \
  --set service.type=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.domain="lamp.$(minikube ip).nip.io"
```

```sh
# Delete
rm "$(helm home)/repository/local/lamp-1.1.2.tgz"

helm repo index "$(helm home)/repository/local"
```

```sh
helm delete lamp --purge
kubectl delete namespace lamp --grace-period=0 --force
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

#### Local Chart Repository

```log
Hang tight while we grab the latest from your chart repositories...
...Unable to get an update from the "local" chart repository (http://127.0.0.1:8879/charts):
	Get http://127.0.0.1:8879/charts/index.yaml: dial tcp 127.0.0.1:8879: connect: connection refused
```

Run Helm serve.

####

```log
Error: Looks like "https://chartmuseum.example.com" is not a valid chart repository or cannot be reached: Get https://chartmuseum.example.com/index.yaml: x509: certificate signed by unknown authority
```

```sh
sudo mkdir -p /etc/ssl/{certs,private}/example
```

```sh
sudo chmod a+w /etc/ssl/{certs,private}/example
```

```sh
openssl s_client \
  -connect chartmuseum.example.com:443 \
  -showcerts \
  -servername chartmuseum.example.com < /dev/null 2> /dev/null | \
    openssl x509 -outform PEM > /etc/ssl/certs/example/root-ca.pem
```

```sh
helm repo add --ca-file /etc/ssl/certs/example/root-ca.pem example https://chartmuseum.example.com
```

#### Transport Closing

```log
E0924 14:25:51.932342   32716 portforward.go:233] lost connection to pod
Error: transport is closing
```

TODO

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
kubectl create serviceaccount tiller -n kube-system
```

```sh
kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller
```

```sh
kubectl patch deploy -n kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```

```sh
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
