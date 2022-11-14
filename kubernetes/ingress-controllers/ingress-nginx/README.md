# NGINX Ingress Controller

<!--
https://github.com/SpiderLabs/ModSecurity-nginx
https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Frame-Options
https://web.dev/same-site-same-origin/
https://github.com/kubernetes/ingress-nginx/tree/main/deploy/grafana/dashboards
-->

## Alternatives

- [Traefik](/traefik.md)

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
  http://example.com
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
  'nginx.ingress.kubernetes.io/cors-allow-origin="https://admin.example.com"' \
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

## Minikube

### Addons

```sh
# Enable
minikube addons -p minikube-default enable ingress
# minikube addons -p minikube-default enable ingress-dns

# Disable
minikube addons -p minikube-default disable ingress
# minikube addons -p minikube-default disable ingress-dns
```

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
helm search repo -l ingress-nginx/ingress-nginx

# Only for minikube
kubectl label node minikube-default ingress-ready=true

#
helm install ingress-controller ingress-nginx/ingress-nginx \
  --create-namespace \
  --namespace ingress-nginx \
  --version 4.4.0 \
  -f <(cat << EOF
controller:
  nodeSelector:
    ingress-ready: 'true'
    kubernetes.io/os: linux

  service:
    type: NodePort
EOF
)

#
helm status ingress-controller -n ingress-nginx
```

### Bare-metal (minikube)

```sh
#
helm upgrade ingress-controller ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  -f <(yq m <(cat << EOF
controller:
  hostNetwork: true
  reportNodeInternalIp: true
EOF
) <(helm get values ingress-controller --namespace ingress-nginx))
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
  --namespace ingress-nginx \
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
  --namespace ingress-nginx \
  -f <(yq m <(cat << EOF
controller:
  maxmindLicenseKey: 'DfoSiRTipW5IyLUR'
EOF
) <(helm get values ingress-controller --namespace ingress-nginx))
```

### Status

```sh
kubectl rollout status deploy/ingress-controller-ingress-nginx-controller \
  -n ingress-nginx
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/instance=ingress-controller' \
  -n ingress-nginx \
  -f
```

### Tips

#### K8s Manifests

```sh
helm get manifest ingress-controller \
  -n ingress-nginx
```

<!-- #### HTTP Strict Transport Security (HSTS)

```yml
nginx.ingress.kubernetes.io/server-snippet: |
  add_header Strict-Transport-Security "max-age=63072000; includeSubDomains" always;
``` -->

<!-- #### Minikube Tunnel

```log
; (1 server found)
;; global options: +cmd
;; connection timed out; no servers could be reached
```

```sh
minikube tunnel
``` -->

### Issues

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

```yaml
block-user-agents:
```

#### Rate Limit

```yaml
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
helm uninstall ingress-controller \
  -n ingress-nginx

kubectl delete ns ingress-nginx \
  --grace-period=0 \
  --force
```

## Issues

### API Breaking Change

```log
error: error validating "STDIN": error validating data: [ValidationError(Ingress.spec.rules[0].http.paths[0].backend): unknown field "serviceName" in io.k8s.api.networking.v1.IngressBackend, ValidationError(Ingress.spec.rules[0].http.paths[0].backend): unknown field "servicePort" in io.k8s.api.networking.v1.IngressBackend]; if you choose to ignore these errors, turn validation off with --validate=false
```

```yaml
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
