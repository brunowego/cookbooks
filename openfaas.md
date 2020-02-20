# OpenFaaS

## Helm

### References

- [Configuration](https://github.com/openfaas/faas-netes/tree/master/chart/openfaas#configuration)

### Repository

```sh
helm repo add openfaas https://openfaas.github.io/faas-netes
helm repo update openfaas
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
helm install openfaas/openfaas \
  -n openfaas \
  --namespace openfaas \
  --set functionNamespace=openfaas-fn \
  --set serviceType=ClusterIP \
  --set operator.create=true \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].host=openfaas.$(minikube ip).nip.io" \
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
dig @10.96.0.10 "openfaas.$(minikube ip).nip.io" +short
nslookup "openfaas.$(minikube ip).nip.io" 10.96.0.10
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
helm delete openfaas --purge
kubectl delete -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml
```

## CLI

### Installation

#### Homebrew

```sh
brew install faas-cli
```
