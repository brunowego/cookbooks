# NGINX Ingress Controller

<!--
https://github.com/SpiderLabs/ModSecurity-nginx
https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
https://web.dev/same-site-same-origin/
https://github.com/kubernetes/ingress-nginx/tree/main/deploy/grafana/dashboards
-->

## Links

- [Main Website](https://kubernetes.github.io/ingress-nginx/)
- [Generate Deploy Scripts](https://github.com/kubernetes/ingress-nginx/blob/main/hack/generate-deploy-scripts.sh)

## Guides

- [Custom Headers](https://kubernetes.github.io/ingress-nginx/examples/customization/custom-headers/)
- [Annotations](https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/nginx-configuration/annotations.md)

## Utils

- Grafana Dashboards
  - [NGINX Ingress controller](https://grafana.com/grafana/dashboards/9614)

## Glossary

- Same-Origin Policy (SOP)
- Cross-Origin Resource Sharing (CORS)
- Sticky and NON-Sticky Sessions

## Custom Resource (CR)

### Install

```sh
#
kubectl apply \
  -f 'https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml'

#
kubectl wait \
  --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
```

### Tips

#### Enable CORS

```sh
#
kubens '[ns-name]'

#
export K8S_INGRESS_NAME=''

#
kubectl get ingress "$K8S_INGRESS_NAME" \
  -o json |
    jq -r '.metadata.annotations'

#
kubectl annotate ingress "$K8S_INGRESS_NAME" \
  nginx.ingress.kubernetes.io/enable-cors='true'

#
kubectl annotate ingress \
  --overwrite \
  "$K8S_INGRESS_NAME" \
  nginx.ingress.kubernetes.io/cors-allow-headers='Access-Control-Allow-Origin,Authorization'

# Testing
curl \
  -I \
  -X OPTIONS \
  -H 'Access-Control-Request-Method: GET' \
  -H 'Origin: http://localhost' \
  http://xyz.tld
```

<!-- ```sh
#
kubectl annotate ingress \
  [ingress-name] \
  'nginx.ingress.kubernetes.io/cors-allow-methods="PUT, GET, POST, OPTIONS"' \
  -n <namespace>

#
kubectl annotate ingress \
  [ingress-name] \
  'nginx.ingress.kubernetes.io/cors-allow-origin="https://admin.xyz.tld"' \
  -n <namespace>

#
kubectl annotate ingress \
  [ingress-name] \
  'nginx.ingress.kubernetes.io/cors-allow-credentials="true"' \
  -n <namespace>
``` -->

<!-- #### Sticky Session

```sh
nginx.ingress.kubernetes.io/affinity: "cookie"
nginx.ingress.kubernetes.io/affinity-mode: "persistent"
nginx.ingress.kubernetes.io/session-cookie-hash: "sha1"
nginx.ingress.kubernetes.io/session-cookie-name: "route"
``` -->

<!-- ####
nginx.ingress.kubernetes.io/limit-connections: "100"
nginx.ingress.kubernetes.io/limit-rps: "50"
nginx.ingress.kubernetes.io/limit-whitelist:
prometheus.io/scrape: "true"
prometheus.io/port: "10254"
-->

### Issues

#### TBD

```log
ERR_TOO_MANY_REDIRECTS
```

TODO

#### Missing Root Path

```log
Error: INSTALLATION FAILED: unable to build kubernetes objects from release manifest: error validating "": error validating data: ValidationError(Ingress.spec.rules[0].http): missing required field "paths" in io.k8s.api.networking.v1.HTTPIngressRuleValue
```

```yml
ingress:
  enabled: true
  hosts:
    - host: n8n.${DOMAIN}
      paths: ['/'] # add this
```

#### Incompatibility on API Version

```log
Error: INSTALLATION FAILED: unable to build kubernetes objects from release manifest: [resource mapping not found for name: "<resource>" namespace: "" from "": no matches for kind "Ingress" in version "networking.k8s.io/v1beta1"
ensure CRDs are installed first]
```

```sh
kubectl resource-versions | grep apiextensions.k8s.io/v1beta1
kubectl resource-versions | grep apiextensions.k8s.io/v1

kubectl resource-versions | grep rbac.authorization.k8s.io/v1beta1
kubectl resource-versions | grep rbac.authorization.k8s.io/v1
```

#### Entity Too Large

```log
413 Request Entity Too Large
```

```sh
kubectl patch ingress/<name> \
  -n <namespace> \
  -p '{"metadata":{"annotations":{"nginx.ingress.kubernetes.io/proxy-body-size":"32m"}}}'
```

<!--
kubectl patch ingress/<name> \
  -n <namespace> \
  -p '{"metadata":{"annotations":{"nginx.ingress.kubernetes.io/client_max_body_size":"32m"}}}'
-->

#### Failed Calling Webhook

```log
Error from server (InternalError): error when creating "STDIN": Internal error occurred: failed calling webhook "validate.nginx.ingress.kubernetes.io": an error on the server ("") has prevented the request from succeeding
```

```sh
#
kubectl get validatingwebhookconfigurations

#
kubectl delete validatingwebhookconfiguration ingress-controller-ingress-nginx-admission
```

### Uninstall

```sh
kubectl delete \
  -f 'https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml'
```

## minikube

### Installation

```sh
# Enable
minikube addons -p minikube enable ingress

# Disable
minikube addons -p minikube disable ingress
```

<!--
minikube addons -p minikube enable ingress-dns
minikube addons -p minikube disable ingress-dns
-->

<!--
kubectl get ingressclass nginx -o json | \
  jq '.metadata.name = "nginx"' | \
    kubectl apply -f - && \
      kubectl delete ingressclass nginx
-->

## Helm

### References

- [Configuration](https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx#configuration)

### Repository

```sh
helm repo add ingress-nginx 'https://kubernetes.github.io/ingress-nginx'
helm repo update
```

### Install

```sh
#
kubectl create ns ingress-nginx

#
kubens ingress-nginx

#
helm search repo -l ingress-nginx/ingress-nginx

#
helm upgrade ingress-controller ingress-nginx/ingress-nginx \
  --version 4.4.2 \
  -f <(cat << EOF
controller:
  ingressClass: nginx

  nodeSelector:
    # ingress-ready: 'true'
    kubernetes.io/os: linux

  service:
    type: NodePort
EOF
)

#
kubectl get all
```

<!--
kubectl get nodes --show-labels
kubectl label node minikube ingress-ready=true
-->

### Bare-metal (minikube)

```sh
#
helm upgrade ingress-controller ingress-nginx/ingress-nginx \
  --version 4.4.2 \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values ingress-controller) <(cat << \EOF
controller:
  hostNetwork: true
  reportNodeInternalIp: true
EOF
))
```

### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
helm upgrade ingress-controller ingress-nginx/ingress-nginx \
  -f <(yq m <(cat << EOF
controller:
  podAnnotations:
    prometheus.io/scrape: 'true'
    prometheus.io/port: '10254'

  metrics:
    enabled: true

    serviceMonitor:
      enabled: true
      additionalLabels:
        release: prometheus-stack
EOF
) <(helm get values ingress-controller --namespace ingress-nginx))
```

### MaxMind GeoLite2

```sh
#
helm upgrade ingress-controller ingress-nginx/ingress-nginx \
  -f <(yq m <(cat << EOF
controller:
  maxmindLicenseKey: 'DfoSiRTipW5IyLUR'
EOF
) <(helm get values ingress-controller --namespace ingress-nginx))
```

### Status

```sh
kubectl rollout status deploy/ingress-controller-ingress-nginx-controller
```

### Logs

```sh
kubectl logs \
  -n ingress-nginx \
  -l 'app.kubernetes.io/instance=ingress-controller' \
  -f
```

### Tips

#### K8s Manifests

```sh
helm get manifest ingress-controller
```

<!-- #### HTTP Strict Transport Security (HSTS)

```yml
nginx.ingress.kubernetes.io/server-snippet: |
  add_header Strict-Transport-Security "max-age=63072000; includeSubDomains" always;
``` -->

<!-- #### minikube Tunnel

```log
; (1 server found)
;; global options: +cmd
;; connection timed out; no servers could be reached
```

```sh
minikube tunnel
``` -->

### Issues

#### TBD

```log
502 Bad Gateway
```

TODO

#### TBD

```log
504 Gateway Time-out
```

TODO

#### TBD

```log
│ Error: pre-upgrade hooks failed: Delete "https://C28995CC23A40E72216A3F98B22234AB.gr7.us-east-1.eks.amazonaws.com/api/v1/namespaces/ingress-nginx/serviceaccounts/ingress-controller-ingress-nginx-admission": dial tcp [64:ff9b::34cb:deb6]:443: i/o timeout
```

TODO

#### TBD

```log
│ Error: post-upgrade hooks failed: unable to build kubernetes object for deleting hook ingress-nginx/templates/admission-webhooks/job-patch/clusterrole.yaml: unable to recognize "": Get "https://C28995CC23A40E72216A3F98B22234AB.gr7.us-east-1.eks.amazonaws.com/api?timeout=32s": dial tcp [64:ff9b::34cb:deb6]:443: i/o timeout
```

TODO

#### TBD

```log
Failed to pull image "registry.k8s.io/ingress-nginx/kube-webhook-certgen:v20220916-gd32f8c343@sha256:39c5b2e3310dc4264d638ad28d9d1d96c4cbb2b2dcfb52368fe4e3c63f61e10f": rpc error: code = Unknown desc = failed to pull and unpack image "registry.k8s.io/ingress-nginx/kube-webhook-certgen@sha256:39c5b2e3310dc4264d638ad28d9d1d96c4cbb2b2dcfb52368fe4e3c63f61e10f": failed to resolve reference "registry.k8s.io/ingress-nginx/kube-webhook-certgen@sha256:39c5b2e3310dc4264d638ad28d9d1d96c4cbb2b2dcfb52368fe4e3c63f61e10f": failed to do request: Head "https://registry.k8s.io/v2/ingress-nginx/kube-webhook-certgen/manifests/sha256:39c5b2e3310dc4264d638ad28d9d1d96c4cbb2b2dcfb52368fe4e3c63f61e10f": dial tcp: lookup registry.k8s.io on 10.0.0.2:53: read udp 10.0.2.211:45465->10.0.0.2:53: i/o timeout
```

<!--
https://kubernetes.github.io/ingress-nginx/troubleshooting/#image-related-issues-faced-on-nginx-425-or-other-versions-helm-chart-versions
-->

TODO

#### TBD

```log
Warning  FailedScheduling  3m11s (x2 over 8m37s)  default-scheduler  0/2 nodes are available: 1 Too many pods, 1 node(s) had untolerated taint {market: spot}. preemption: 0/2 nodes are available: 1 No preemption victims found for incoming pod, 1 Preemption is not helpful for scheduling.
```

TODO

#### Missing Un-taint Node

```log
0/4 nodes are available: 1 node(s) had taint {node-role.kubernetes.io/master: }, that the pod didn't tolerate, 3 node(s) didn't match Pod's node affinity/selector.
```

```sh
#
kubectl get nodes \
  -l 'ingress-ready=true,kubernetes.io/os=linux' \
  -o json | \
    jq '.items[].spec.taints'
# or
kubectl get nodes -o=custom-columns=NAME:.metadata.name,TAINTS:.spec.taints

#
kubectl get nodes -l 'ingress-ready=true,kubernetes.io/os=linux'

#
kubectl taint node \
  -l 'ingress-ready=true,kubernetes.io/os=linux' \
    node-role.kubernetes.io/master-
# or
kubectl taint node \
  -l 'ingress-ready=true,kubernetes.io/os=linux' \
  node-role.kubernetes.io/control-plane-
```

#### DDos Attack

```log
172.16.10.101 - - [02/Jan/2021:21:51:22 +0000] "GET / HTTP/1.1" 200 45 "-" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0) Gecko/20100101 Firefox/84.0" 367 0.001 [default-ingress-1db0bf370dd59aa8ff284a4bd4ccdc07-80] [] 10.42.0.10:80 45 0.000 200 1da439122bd7d7014f6627f32e4cefc3
172.16.10.101 - - [02/Jan/2021:21:51:22 +0000] "GET /favicon.ico HTTP/1.1" 499 0 "http://test.default.54.202.152.214.xip.io/" "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0) Gecko/20100101 Firefox/84.0" 341 0.001 [default-ingress-1db0bf370dd59aa8ff284a4bd4ccdc07-80] [] 10.42.0.10:80 0 0.000 - 92a1e851206da86fbec0610d346e2ddd
172.16.10.101 - - [02/Jan/2021:21:51:26 +0000] "GET / HTTP/1.1" 200 45 "-" "curl/7.64.1" 98 0.000 [default-ingress-1db0bf370dd59aa8ff284a4bd4ccdc07-80] [] 10.42.0.10:80 45 0.000 200 4c51046660b05cf2703dbedfae2272aa
172.16.10.101 - - [02/Jan/2021:21:51:29 +0000] "GET / HTTP/1.1" 200 45 "-" "Wget/1.20.3 (darwin19.0.0)" 164 0.001 [default-ingress-1db0bf370dd59aa8ff284a4bd4ccdc07-80] [] 10.42.0.10:80 45 0.000 200 5334e799b3268dab31d74a5d2239702b
```

```yml
block-user-agents:
```

#### Rate Limit

```yml
nginx.ingress.kubernetes.io/limit-rpm: '300'
```

<!--
https://stackoverflow.com/questions/64425924/rate-limiting-based-on-url-and-path-in-kubernetes
https://github.com/nginxinc/kubernetes-ingress/blob/master/examples/custom-annotations/README.md
-->

#### Failed Calling Webhook

```log
Error: Internal error occurred: failed calling webhook "validate.nginx.ingress.kubernetes.io": Post "https://ingress-controller-ingress-nginx-controller-admission.ingress-nginx.svc:443/networking/v1beta1/ingresses?timeout=10s": dial tcp 0.0.0.0:443: connect: connection refused
```

```sh
#
kubectl get validatingwebhookconfigurations

#
kubectl delete validatingwebhookconfiguration ingress-controller-ingress-nginx-admission
```

#### Node Free Ports

```log
Warning  FailedScheduling  18s (x2 over 20s)  default-scheduler  0/4 nodes are available: 1 node(s) didn't have free ports for the requested pod ports, 3 node(s) didn't match Pod's node affinity/selector.
```

One way to ensure that only schedulable Pods are created is to deploy the NGINX Ingress Controller as a `DaemonSet` instead of a traditional `Deployment`.

```sh
helm upgrade ingress-controller ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  -f <(yq m <(cat << EOF
controller:
  kind: DaemonSet
EOF
) <(helm get values ingress-controller --namespace ingress-nginx))
```

### Delete

```sh
helm uninstall ingress-controller

kubectl delete ns ingress-nginx \
  --grace-period=0 \
  --force
```

## Issues

### API Breaking Change

```log
error: error validating "STDIN": error validating data: [ValidationError(Ingress.spec.rules[0].http.paths[0].backend): unknown field "serviceName" in io.k8s.api.networking.v1.IngressBackend, ValidationError(Ingress.spec.rules[0].http.paths[0].backend): unknown field "servicePort" in io.k8s.api.networking.v1.IngressBackend]; if you choose to ignore these errors, turn validation off with --validate=false
```

```yml
---
# apiVersion: extensions/v1beta1
apiVersion: networking.k8s.io/v1
kind: Ingress
# ...
spec:
  # ...
  rules:
    - # ...
      http:
        paths:
          - path: /
            # backend:
            #   serviceName: <name>
            #   servicePort: <port>
            pathType: Prefix
            backend:
              service:
                name: <name>
                port:
                  number: <port>
```
