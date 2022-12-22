# Traefik

<!--
https://www.udemy.com/course/the-complete-traefik-training-course/?referralCode=B585BB185AFA05066747

helm3 repo add traefik https://helm.traefik.io/traefik
-->

## Alternatives

- [Kubernetes Ingress NGINX](/kubernetes/kubernetes-ingress-nginx.md)

## Guides

- [Capture Traefik Metrics for Apps on Kubernetes with Prometheus](https://traefik.io/blog/capture-traefik-metrics-for-apps-on-kubernetes-with-prometheus/)

## References

- [Docker-compose basic example](https://docs.traefik.io/v2.0/user-guides/docker-compose/basic-example/)
- [Middlewares Headers](https://doc.traefik.io/traefik/v2.0/middlewares/headers/)

## Plataform

### Tips

<!-- #### CORS

```yml
# Docker
labels:
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.accesscontrolallowmethods=GET,OPTIONS,PUT'
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.accesscontrolalloworigin=*'
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.accesscontrolmaxage=100'
  - 'traefik.http.middlewares.uan-sentry-onprem.headers.addvaryheader=true'
``` -->

## Helm

### References

- [Installing](https://github.com/traefik/traefik-helm-chart/tree/master/traefik#installing)

### Repository

```sh
helm repo add traefik 'https://helm.traefik.io/traefik'
helm repo update
```

### Dependencies

- [MetalLB](/metallb.md)
- [Jaeger Tracing](/jaeger/README.md)

### Install

```sh
#
kubectl create ns traefik-system
```

```sh
helm install traefik traefik/traefik \
  --namespace traefik-system \
  --version 10.0.2 \
  -f <(cat << EOF
additionalArguments:
- "--api.insecure"
- "--metrics.prometheus=true"
- "--tracing.jaeger=true"
- "--tracing.serviceName=traefik-service"
- "--tracing.jaeger.samplingParam=1.0"
- "--tracing.jaeger.disableAttemptReconnecting=false"
- "--tracing.jaeger.samplingType=const"
- "--tracing.jaeger.samplingServerURL=http://jaeger-all-in-one-agent.tracing.svc:5778/sampling"
- "--tracing.jaeger.localAgentHostPort=jaeger-all-in-one-agent.tracing.svc:6831"
EOF
)
```

### Status

```sh
kubectl rollout status deploy/traefik \
  -n traefik-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=traefik' \
  -n traefik-system \
  -f
```

### Traefik Dashboard

#### Install

```sh
#
cat << EOF | kubectl apply \
  -n traefik-system \
  -f -
apiVersion: v1
kind: Service
metadata:
  name: traefik-dashboard
  labels:
    app.kubernetes.io/instance: traefik
    app.kubernetes.io/name: traefik-dashboard
spec:
  type: ClusterIP
  ports:
  - name: traefik
    port: 9000
    targetPort: traefik
    protocol: TCP
  selector:
    app.kubernetes.io/instance: traefik
    app.kubernetes.io/name: traefik
---
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name:  traefik
  labels:
    app: traefik
    release: prometheus-stack
spec:
  jobLabel: traefik-metrics
  endpoints:
  - port: traefik
    path: /metrics
  namespaceSelector:
    matchNames:
    - traefik-system
  selector:
    matchLabels:
      app.kubernetes.io/instance: traefik
      app.kubernetes.io/name: traefik-dashboard
EOF

#
kubectl port-forward svc/traefik-dashboard \
  --address 0.0.0.0 \
  9000:9000 \
  -n traefik-system
```

#### Delete

```sh
kubectl delete servicemonitor traefik \
  -n traefik-system

kubectl delete service traefik-dashboard \
  -n traefik-system
```

### Traefik Ingress

#### Install

```sh
#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
cat << EOF | kubectl apply \
  -n traefik-system \
  -f -
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: traefik-basic-auth
spec:
  basicAuth:
    secret: authsecret
---
apiVersion: v1
kind: Secret
metadata:
  name: authsecret
data:
  users: |
    $(htpasswd -nb admin pass | base64)
---
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: traefik
spec:
  entryPoints:
  - web
  routes:
  - match: PathPrefix(\`/dashboard\`) || Host(\`traefik.${DOMAIN}\`)
    kind: Rule
    middlewares:
    - name: traefik-basic-auth
    services:
    - name: traefik-dashboard
      port: 9000
EOF

#
echo -e "[INFO]\thttp://traefik.${DOMAIN}"
```

#### Delete

```sh
kubectl delete ingressroute traefik \
  -n traefik-system

kubectl delete secret authsecret \
  -n traefik-system

kubectl delete middleware traefik-basic-auth \
  -n traefik-system
```

### Delete

```sh
helm uninstall traefik \
  -n traefik-system
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h traefik \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 80:80 \
  -p 8080:8080 \
  --name traefik \
  --network workbench \
  docker.io/library/traefik:v2.0.2
```

```sh
docker exec -i traefik /bin/sh << EOSHELL
mkdir /etc/traefik

cat << EOF > /etc/traefik/traefik.toml
[providers.docker]
  endpoint = "unix:///var/run/docker.sock"

[api]
  dashboard = true
  insecure = true

EOF
EOSHELL
```

```sh
docker restart traefik
```

```sh
xdg-open "http://127.0.0.1:8080" || open "http://127.0.0.1:8080" || echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f traefik
```
