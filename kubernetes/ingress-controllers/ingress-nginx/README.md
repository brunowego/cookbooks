# Kubernetes NGINX Ingress Controller

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
- [Annotations](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/)
- [Generate Deploy Scripts](https://github.com/kubernetes/ingress-nginx/blob/main/hack/generate-deploy-scripts.sh)

## Utils

- Grafana Dashboards
  - [NGINX Ingress controller](https://grafana.com/grafana/dashboards/9614)

## Glossary

- Same-Origin Policy (SOP)
- Cross-Origin Resource Sharing (CORS)
- Sticky and NON-Sticky Sessions

## Kubernetes Manifest

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
kubectl get ingress [ingress-name] \
  -o json \
  -n [namespace] |
    jq -r '.metadata.annotations'

#
kubectl annotate ingress \
  [ingress-name] \
  nginx.ingress.kubernetes.io/enable-cors='true' \
  -n [namespace]

#
kubectl annotate ingress \
  --overwrite \
  [ingress-name] \
  nginx.ingress.kubernetes.io/cors-allow-headers='Access-Control-Allow-Origin,Authorization' \
  -n [namespace]

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
  -n [namespace]

#
kubectl annotate ingress \
  [ingress-name] \
  'nginx.ingress.kubernetes.io/cors-allow-origin="https://admin.example.com"' \
  -n [namespace]

#
kubectl annotate ingress \
  [ingress-name] \
  'nginx.ingress.kubernetes.io/cors-allow-credentials="true"' \
  -n [namespace]
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
kubectl patch ingress/[name] \
  -n [namespace] \
  -p '{"metadata":{"annotations":{"nginx.ingress.kubernetes.io/proxy-body-size":"32m"}}}'
```

<!--
kubectl patch ingress/[name] \
  -n [namespace] \
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
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
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
minikube addons enable ingress

# Disable
minikube addons disable ingress
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
# Kubernetes in Docker (kind)
helm install ingress-controller ingress-nginx/ingress-nginx \
  --create-namespace \
  --namespace ingress-nginx \
  --version 3.35.0 \
  -f <(cat << EOF
controller:
  hostPort:
    enabled: true

  kind: DaemonSet

  publishService:
    enabled: false

  extraArgs:
    publish-status-address: localhost

  tolerations:
  - key: node-role.kubernetes.io/master
    operator: Equal
    effect: NoSchedule

  terminationGracePeriodSeconds: 0

  nodeSelector:
    ingress-ready: 'true'
    kubernetes.io/os: linux

  service:
    type: NodePort
EOF
)
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
nginx.ingress.kubernetes.io/limit-rpm: "300"
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
kubectl delete -A ValidatingWebhookConfiguration ingress-controller-ingress-nginx-admission
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

kubectl delete namespace ingress-nginx \
  --grace-period=0 \
  --force
```
