# Helm

## Installation

```sh
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash
```

## Create & Init

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

### Skip Refresh

```sh
helm init \
  --service-account tiller \
  --skip-refresh --wait
```

## Commands

```sh
helm -h
```

## Issues

### DNS

> Error: forwarding ports: error upgrading connection: unable to upgrade connection: pod does not exist

Add current external ip and hostname to each node machine:

```sh
sudo sh -c 'echo -e "$(hostname -I | awk '\''{print $2}'\'')\t$(hostname -s)" >> /etc/hosts'
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

## Delete & Reset

```sh
kubectl delete serviceaccount tiller -n kube-system
kubectl delete clusterrolebinding tiller-cluster-rule
```

```sh
helm reset --force
```

## Uninstall

```sh
sudo rm -fR /usr/local/bin/helm
```

```sh
rm -fR ~/.helm
```
