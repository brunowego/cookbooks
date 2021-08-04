# OpenFaaS

<!--
https://artifacthub.io/packages/helm/openfaas/kafka-connector
-->

## Helm

### References

- [Configuration](https://github.com/openfaas/faas-netes/tree/master/chart/openfaas#configuration)

### Repository

```sh
helm repo add openfaas https://openfaas.github.io/faas-netes
helm repo update
```

### Install

```sh
kubectl create clusterrolebinding tiller-cluster-admin \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller

kubectl create clusterrolebinding tiller-cluster-default \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:default
```

```sh
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
```

```sh
kubectl create secret generic basic-auth \
  --from-literal=basic-auth-user=admin \
  --from-literal=basic-auth-password="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  -n openfaas
```

```sh
helm install openfaas openfaas/openfaas \
  --namespace openfaas \
  --set functionNamespace=openfaas-fn \
  --set serviceType=ClusterIP \
  --set operator.create=true \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].host=openfaas.${INGRESS_HOST}.nip.io" \
  --set 'ingress.hosts[0].path=/' \
  --set 'ingress.hosts[0].serviceName=gateway' \
  --set 'ingress.hosts[0].servicePort=8080' \
  --set gateway.replicas=2 \
  --set queueWorker.replicas=2
```

### Status

```sh
kubectl rollout status deploy/faas-idler -n openfaas
```

### Logs

```sh
kubectl logs -l 'app=faas-idler' -n openfaas -f
```

### DNS

```sh
dig @10.96.0.10 gateway-external.openfaas.svc.cluster.local +short
nslookup gateway-external.openfaas.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "openfaas.${INGRESS_HOST}.nip.io" +short
nslookup "openfaas.${INGRESS_HOST}.nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret basic-auth \
  -o jsonpath='{.data.basic-auth-user}' \
  -n openfaas | \
    base64 --decode; echo

kubectl get secret basic-auth \
  -o jsonpath='{.data.basic-auth-password}' \
  -n openfaas | \
    base64 --decode; echo
```

### Delete

```sh
helm uninstall openfaas -n openfaas
kubectl delete -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
```

## CLI

### Installation

#### Homebrew

```sh
brew install faas-cli
```
