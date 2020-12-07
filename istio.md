# Istio

<!--
https://www.linkedin.com/learning/kubernetes-service-mesh-with-istio/adjusting-istio-load-balancing-ratios
https://app.pluralsight.com/library/courses/istio-managing-apps-kubernetes/table-of-contents

https://github.com/solsson/istio-access-control
https://github.com/rinormaloku/istio-mastery
https://devopspro.lt/wp-content/uploads/2019/04/Nikhil-Barthwal-Knative-A-Kubernetes-Framework-to-manage-Serverless-Workloads-min.pdf
https://www.linkedin.com/learning/kubernetes-service-mesh-with-istio/modifying-routes-for-canary-deployments
https://github.com/IBM/cloud-native-starter
https://github.com/ruzickap/k8s-flagger-istio-flux
https://github.com/stefanprodan/istio-gke
https://github.com/redhat-developer-demos/istio-tutorial
https://github.com/dangtrinhnt/keycloak_flask
https://docs.flagger.app/install/flagger-install-on-google-cloud
https://github.com/weaveworks/flagger/blob/master/docs/gitbook/tutorials/canary-helm-gitops.md
https://github.com/040code/040code.github.io/blob/source/content/posts/2019-07-01-multi-cloud-service-mesh/index.md
https://github.com/malston/platform-automation-reference/tree/master/installs/istio
https://github.com/jmoliva/jpetstore-kubernetes-20190920092120074/blob/master/istio/README.md
https://github.com/IBM-Cloud/jpetstore-kubernetes/tree/master/istio
https://github.com/cnbper/bp-istio/blob/master/doc/egress-control.md
https://github.com/pubudu538/microservices/tree/master/ride-app
https://github.com/hack19-istio/dj-istio
https://ordina-jworks.github.io/cloud/2019/05/03/istio-service-mesh-s2s.html
https://github.com/swilliams11/apigee-istio-k8s-demo#prep-script
-->

## Examples

- [Hipster Shop: Cloud-Native Microservices Demo Application](https://github.com/GoogleCloudPlatform/microservices-demo)

## Helm

### References

- [Configuration](https://github.com/istio/istio/tree/master/install/kubernetes/helm/istio#configuration)

### Repository

```sh
helm repo add istio.io https://storage.googleapis.com/istio-release/releases/1.3.0/charts
helm repo update istio.io
```

### Install

```sh
kubectl create namespace istio-system
```

```sh
helm install istio.io/istio-init \
  -n istio-init \
  --namespace istio-system
```

```sh
kubectl get crds | grep 'istio.io' | wc -l
```

```sh
helm install istio.io/istio \
  -n istio \
  --namespace istio-system \
  --set grafana.enabled=true \
  --set tracing.enabled=true \
  --set kiali.enabled=true \
  --set kiali.dashboard.jaegerURL='http://jaeger-query.istio-system.svc.cluster.local:16686' \
  --set kiali.dashboard.grafanaURL='http://grafana.istio-system.svc.cluster.local:3000' \
```

### Labels

```sh
kubectl label namespace default istio-injection=enabled
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

TODO

#### Remove

TODO

### Status

```sh
kubectl rollout status deploy/istio-pilot -n istio-system
```

### Logs

```sh
kubectl logs -l 'app=pilot' -c discovery -n istio-system -f
kubectl logs -l 'app=pilot' -c istio-proxy -n istio-system -f
```

### DNS

```sh
dig @10.96.0.10 istio-pilot.istio-system.svc.cluster.local +short
nslookup istio-pilot.istio-system.svc.cluster.local 10.96.0.10
```

### Secret

```sh
cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: kiali
  namespace: istio-system
  labels:
    app: kiali
type: Opaque
data:
  username: $(echo -n 'admin' | base64)
  passphrase: $(echo -n 'admin' | base64)
EOF
```

```sh
kubectl delete pod -l 'app=kiali' -n istio-system
```

```sh
kubectl get secret kiali \
  -o jsonpath='{.data.passphrase}' \
  -n istio-system | \
    base64 --decode; echo
```

### Delete

```sh
helm delete istio --purge
helm delete istio-init --purge
kubectl delete namespace istio-system --grace-period=0 --force

kubectl get crd -o json | jq -r '.items[] | select(.spec.group | contains("istio.io")) | .metadata.name' | xargs kubectl delete crd
```

## CLI

### Installation

#### Homebrew

```sh
brew install istioctl
```

#### Linux

```sh
curl -L https://github.com/istio/istio/releases/download/1.3.0/istio-1.3.0-linux.tar.gz | \
  tar -xzC /usr/local/bin --strip-components 2 istio-1.3.0/bin/istioctl
```

### Commands

```sh
istioctl -h
```
