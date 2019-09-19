# Helm

## Tiller

### Dependencies

#### RBAC

```sh
kubectl create serviceaccount tiller -n kube-system
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

#### DNS

```log
Error: forwarding ports: error upgrading connection: unable to upgrade connection: pod does not exist
```

Add current external ip and hostname to each node machine:

```sh
# Using shell
sudo sh -c 'echo -e "$(hostname -I | awk '\''{print $2}'\'')\t$(hostname)" >> /etc/hosts'

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

### Tips

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

### Uninstall

```sh
sudo rm -fR /usr/local/bin/helm
```

```sh
rm -fR ~/.helm
```
