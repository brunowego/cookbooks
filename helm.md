# Helm

## CLI

### Installation

```sh
curl -H 'Cache-Control: no-cache' -Ss https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash
```

### Commands

```sh
helm -h
```

### Uninstall

```sh
sudo rm -fR /usr/local/bin/helm
```

```sh
rm -fR ~/.helm
```

## Kubernetes

### Create & Init

```sh
kubectl create serviceaccount tiller -n kube-system
```

```sh
kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller
```

```sh
helm init --service-account tiller
```

```sh
kubectl rollout status deploy/tiller-deploy -n kube-system
```

#### Skip Refresh

```sh
helm init \
  --service-account tiller \
  --skip-refresh \
  --wait
```

### Delete & Reset

```sh
kubectl delete serviceaccount tiller -n kube-system
kubectl delete clusterrolebinding tiller-cluster-rule
```

```sh
helm reset --force
```

## Issues

### DNS

> Error: forwarding ports: error upgrading connection: unable to upgrade connection: pod does not exist

Add current external ip and hostname to each node machine:

```sh
# Using shell
sudo sh -c 'echo -e "$(hostname -I | awk '\''{print $2}'\'')\t$(hostname -s)" >> /etc/hosts'

# Using hostess
sudo hostess add "$(hostname -I | awk '{print $2}')" "$(hostname -s)"
```

### Service Account

> Error: configmaps is forbidden: User "system:serviceaccount:kube-system:default" cannot list resource "configmaps" in API group "" in the namespace "kube-system"

```sh
kubectl create serviceaccount -n kube-system tiller
```

```sh
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
```

```sh
kubectl patch deploy -n kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```

```sh
helm init --service-account tiller --upgrade
```

## Tips

### Install with Heredoc

```sh
cat << EOF | helm install [chart] -n [name] --namespace [namespace] -f -

EOF
```
