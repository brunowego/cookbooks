# Kubernetes ServiceAccount

<!-- ## Manifest

```yml
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: my-sa
```

```yml
spec:
  serviceAccount: my-sa
``` -->

## CLI

### Usage

```sh
#
kubectl get serviceaccounts

#
kubectl describe serviceaccount default
```

### Testing

```sh
kubectl run -it \
  curl \
  --serviceaccount 'default' \
  --image docker.io/radial/busyboxplus:curl

#
kubectl exec -it curl -- ls /var/run/secrets/kubernetes.io/serviceaccount

#
kubectl exec -it curl -- /bin/sh

export TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token); echo "$TOKEN"
export CACERT=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt; cat "$CACERT"

# Using cURL
curl \
  --cacert "$CACERT" \
  -X GET \
  'https://kubernetes.default.svc.cluster.local/api/'

curl \
  --cacert "$CACERT" \
  --header "Authorization: Bearer $TOKEN" \
  -X GET \
  'https://kubernetes.default.svc.cluster.local/api/'

# wget \
#   -qO - \
#   --ca-certificate "$CACERT" \
#   --header "Authorization: Bearer $TOKEN" \
#   --method GET \
#    'https://kubernetes.default.svc.cluster.local/api/'

wget \
  -qO - \
  --no-check-certificate \
  --header "Authorization: Bearer $TOKEN" \
   'https://kubernetes.default.svc.cluster.local/api/'

curl \
  --cacert "$CACERT" \
  --header "Authorization: Bearer $TOKEN" \
  -X GET \
  'https://kubernetes.default.svc.cluster.local/api/v1/namespaces/default/pods'

kubectl auth can-i list pods --as system:serviceaccount:default:default
kubectl get pods -v 6 --as system:serviceaccount:default:default

kubectl create role demorole --verb get,list --resource pods
kubectl create rolebinding demorolebinding --role demorole --serviceaccount default:default

kubectl delete pod curl
kubectl delete rolebinding demorolebinding
kubectl delete role demorole
```
