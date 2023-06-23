# Kong Gateway Operator

## Links

- [Code Repository](https://github.com/kong/gateway-operator-docs)
- [Main Website](https://incubator.konghq.com/p/gateway-operator/)

## Kustomize

### Dependencies

- minikube
  - [MetalLB](/metallb.md#minikube)
- [Kubernetes Gateway API](/kubernetes/gateway-api.md)

### Installation

<!--
kubectl kustomize 'https://github.com/Kong/kubernetes-ingress-controller/config/crd' | kubectl apply -f -
-->

```sh
#
kubectl kustomize "https://github.com/kong/gateway-operator-docs/config/default?submodules=false" | kubectl apply -f -

#
kubectl wait --for=condition=Available=true --timeout=120s deployment/gateway-operator-controller-manager -n kong-system
```

### Configuration

```sh
#
kubens kong-system

#
cat << EOF | kubectl apply -f -
---
kind: GatewayClass
apiVersion: gateway.networking.k8s.io/v1beta1
metadata:
  name: kong
  # annotations:
  #   konghq.com/gatewayclass-unmanaged: 'true'
spec:
  controllerName: konghq.com/gateway-operator
EOF

#
kubectl get gatewayclass

#
cat << EOF | kubectl apply -f -
---
kind: Gateway
apiVersion: gateway.networking.k8s.io/v1beta1
metadata:
  name: kong
  # annotations:
  #   networking.istio.io/service-type: ClusterIP
spec:
  gatewayClassName: kong
  listeners:
    - name: http
      protocol: HTTP
      port: 80
EOF
```

> Wait! This process take a while.

```sh
#
kubectl wait --for=condition=Ready=true gateways.gateway.networking.k8s.io/kong

#
kubectl get gateway kong -o=jsonpath='{.status.addresses}' | jq .
```

### Test

```sh
#
kubens default

#
kubectl apply -f https://bit.ly/echo-service

#
cat << EOF | kubectl apply -f -
---
apiVersion: gateway.networking.k8s.io/v1beta1
kind: ReferenceGrant
metadata:
  name: httproute
  namespace: kong-system
spec:
  from:
    - group: gateway.networking.k8s.io
      kind: HTTPRoute
      namespace: default
  to:
    - group: ""
      kind: Service
EOF

#
cat << EOF | kubectl apply -f -
---
apiVersion: gateway.networking.k8s.io/v1beta1
kind: HTTPRoute
metadata:
  name: echo
  # namespace: default
spec:
  parentRefs:
    - group: gateway.networking.k8s.io
      kind: Gateway
      name: kong
      namespace: kong-system
  rules:
    - backendRefs:
        - group: ''
          kind: Service
          name: echo
          # namespace: default
          port: 80
          weight: 1
      matches:
        - path:
            type: PathPrefix
            value: /echo
EOF

#
kubectl logs \
  -l 'control-plane=controller-manager' \
  -f

stern controlplane-kong

#
export PROXY_IP=$(kubectl get gateway kong -o=jsonpath='{.status.addresses}' | jq -r '.[0].value')

curl -i "http://$PROXY_IP/echo"
```

### Issues

#### TBD

```log
controlplane-kong-pg89g-dq6p6-667479c657-ft4lm controller time="2023-06-23T17:23:48Z" level=error msg="gateway.networking.k8s.io/v1beta1, Kind=HTTPRoute kong-system/echo requested backendRef to Service default/echo, but no ReferenceGrant permits it, skipping..."
```

TODO
