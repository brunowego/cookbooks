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

<!-- ####

```log
413 Request Entity Too Large
```

```sh
kubectl patch ingress/sentry \
  -n sentry \
  -p '{"metadata":{"annotations":{"nginx.ingress.kubernetes.io/proxy-body-size":"32m"}}}'
``` -->

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
#
kubectl create namespace ingress-nginx

# Kubernetes IN Docker (KIND)
helm install ingress-controller ingress-nginx/ingress-nginx \
  --namespace ingress-nginx \
  --version 3.35.0 \
  -f <(cat << EOF
controller:
  hostPort:
    enabled: true

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

<!--
### Prometheus Stack

**Dependencies:** [kube-prometheus (a.k.a prometheus-stack, p.k.a. prometheus-operator)](/prometheus/prometheus-stack.md)

```sh
#
kubectl get prometheus \
  -o jsonpath='{.items[*].spec.serviceMonitorSelector}' \
  -n monitoring

#
  podAnnotations:
    prometheus.io/scrape: 'true'
    prometheus.io/port: '10254'

  metrics:
    enabled: true
    serviceMonitor:
      enabled: true
      additionalLabels:
        release: prometheus-stack
```
-->

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

### Delete

```sh
helm uninstall ingress-controller \
  -n ingress-nginx

kubectl delete namespace ingress-nginx \
  --grace-period=0 \
  --force
```
