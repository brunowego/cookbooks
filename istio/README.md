# Istio

**Keywords:** Service Mesh

<!--
https://github.com/fortio/fortio

https://github.com/jsa4000/Observable-Distributed-System/blob/master/docs/11_istio_service_mesh.md

https://linkedin.com/learning/kubernetes-service-mesh-with-istio/adjusting-istio-load-balancing-ratios
https://app.pluralsight.com/library/courses/istio-managing-apps-kubernetes/table-of-contents

https://github.com/solsson/istio-access-control
https://github.com/rinormaloku/istio-mastery
https://devopspro.lt/wp-content/uploads/2019/04/Nikhil-Barthwal-Knative-A-Kubernetes-Framework-to-manage-Serverless-Workloads-min.pdf
https://linkedin.com/learning/kubernetes-service-mesh-with-istio/modifying-routes-for-canary-deployments
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

## References

- [Envoy](/envoy.md)

## Examples

- [Hipster Shop: Cloud-Native Microservices Demo Application](https://github.com/GoogleCloudPlatform/microservices-demo)

<!-- ## Helm

### References

- [Charts](https://github.com/istio/istio/tree/master/manifests/charts)

### Repository

```sh
helm repo add istio 'https://istio-release.storage.googleapis.com/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns istio-system

#
helm search repo -l istio/istiod

#
helm install istiod istio/istiod \
  --namespace istio-system \
  --version 1.16.0

#
kubectl get all -n istio-system
```

### Status

```sh
kubectl rollout status statefulset/istio-istiod \
  -n istio-system
```

### Logs

```sh
kubectl logs \
  -l 'app=istio' \
  -n istio-system \
  -f
```

### Delete

```sh
helm uninstall istiod \
  -n istio-system

kubectl delete ns istio-system \
  --grace-period=0 \
  --force
``` -->

## CLI

### Installation

#### Homebrew

```sh
brew install istioctl
```

#### Linux Binary

```sh
curl -L 'https://github.com/istio/istio/releases/download/1.3.0/istio-1.3.0-linux.tar.gz' | \
  tar -xzC /usr/local/bin --strip-components 2 istio-1.3.0/bin/istioctl
```

### Commands

```sh
istioctl -h
```
