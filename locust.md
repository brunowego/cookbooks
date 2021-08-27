# Locust

<!--
https://github.com/apereo/cas/blob/master/docs/cas-server-documentation/high_availability/Performance-Testing-Locust.md
https://artifacthub.io/packages/helm/deliveryhero/locust

https://github.com/ONSdigital/blaise-cawi-load-tests/tree/main
-->

## Alternatives

- [K6](/k6.md)

## Guides

- [Distributed load generation](https://docs.locust.io/en/stable/running-locust-distributed.html)

## Helm

### References

- [Values](https://github.com/deliveryhero/helm-charts/tree/master/stable/locust#values)

### Repository

```sh
helm repo add deliveryhero 'https://charts.deliveryhero.io'
helm repo update
```

### HTTP Server Test

```sh
#
kubectl create deployment 'http-https-echo' \
  --image docker.io/mendhak/http-https-echo:18

#
kubectl expose deployment 'http-https-echo' \
  --port 8080 \
  --type 'ClusterIP' \
  --name 'http-https-echo'
```

<!--
#
kubectl create configmap my-loadtest-locustfile \
  --from-file '[path/to/your/main.py]' \
  -n locust
-->

### Install

```sh
#
kubectl create namespace locust

#
cat << EOF | kubectl apply \
  -n locust \
  -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-loadtest-locustfile
data:
  main.py: |
    from locust import TaskSet, task, HttpUser, between

    class MyTaskSet(TaskSet):
        @task(2)
        def index(self):
            self.client.get('/')

        @task(1)
        def stats(self):
            self.client.get('/stats/requests')


    class WebsiteUser(HttpUser):
        host = 'http://http-https-echo.default:8080'
        wait_time = between(1, 2)
        tasks = [MyTaskSet]
EOF

#
export INGRESS_HOST='127.0.0.1'

#
helm upgrade locust deliveryhero/locust \
  --namespace locust \
  --version 0.20 \
  -f <(cat << EOF
loadtest:
  name: my-loadtest
  locust_locustfile_configmap: my-loadtest-locustfile

worker:
  replicas: 3
  hpa:
    enabled: true
    minReplicas: 3
    maxReplicas: 100
    targetCPUUtilizationPercentage: 40
  resources:
    limits:
      cpu: 200m
      memory: 256Mi
    requests:
      cpu: 100m
      memory: 256Mi

ingress:
  enabled: true
  hosts:
  - host: locust.${INGRESS_HOST}.nip.io
    path: /
EOF
)
```

### Status

```sh
kubectl rollout status deploy/locust-master \
  -n locust
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=locust' \
  -n locust \
  -f
```

### Delete

```sh
helm uninstall locust \
  -n locust

kubectl delete namespace locust \
  --grace-period=0 \
  --force

kubectl delete service http-https-echo \
  -n default

kubectl delete deployment http-https-echo \
  -n default
```

## CLI

### Installation

#### PIP

```sh
pip3 install -U locust
```

### Commands

```sh
locust -h
```

### Usage

**Dependencies:** [docker-http-https-echo](/docker-http-https-echo.md).

```sh
#
cat << EOF > ./main.py
from locust import TaskSet, task, HttpUser, between

class MyTaskSet(TaskSet):
    @task(2)
    def index(self):
        self.client.get('/')

    @task(1)
    def stats(self):
        self.client.get('/stats/requests')


class WebsiteUser(HttpUser):
    host = 'http://127.0.0.1:8080'
    wait_time = between(1, 2)
    tasks = [MyTaskSet]
EOF

#
locust \
  -f ./main.py \
  -u 1000 \
  -r 50
```
