# RabbitMQ Server

## Links

- [Code Repository](https://github.com/rabbitmq/rabbitmq-server)

## Helm

### References

- [Parameters](https://github.com/bitnami/charts/tree/master/bitnami/rabbitmq#parameters)

### Repository

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

### Install

```sh
kubectl create ns rabbitmq
```

```sh
helm install rabbitmq bitnami/rabbitmq \
  --namespace rabbitmq \
  --set auth.username=admin \
  --set auth.password=admin \
  --set replicaCount=3 \
  --set ingress.enabled=true \
  --set ingress.hostname="rabbitmq.${INGRESS_HOST}.nip.io" \
  --set metrics.enabled=true
```

### Status

```sh
kubectl rollout status statefulset/rabbitmq -n rabbitmq
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=rabbitmq' -n rabbitmq -f
```

### Secret

```sh
kubectl get secret rabbitmq \
  -o jsonpath='{.data.rabbitmq-password}' \
  -n rabbitmq | \
    base64 --decode; echo
```

### Metrics

```sh
#
kubectl port-forward svc/rabbitmq -n rabbitmq 9419:9419

#
echo -e '[INFO]\thttp://127.0.0.1:9419/metrics'
```

### Delete

```sh
helm uninstall rabbitmq \
  -n rabbitmq

kubectl delete ns rabbitmq \
  --grace-period=0 \
  --force
```

## CLI

### Installation

#### Homebrew

```sh
brew install rabbitmq
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

**Homebrew**

```sh
# RabbitMQ
export RABBITMQ_HOME='/usr/local/opt/rabbitmq'
export RABBITMQ_CONFIG_FILE='/usr/local/etc/rabbitmq/rabbitmq.conf'
export PATH="$RABBITMQ_HOME/sbin:$PATH"
```

```sh
sudo su - "$USER"
```

**Linux**

```sh
# RabbitMQ
export RABBITMQ_CONFIG_FILE='/etc/rabbitmq/rabbitmq.conf'
```

```sh
sudo su - "$USER"
```

### Configuration

```sh
#
cat << EOF >> "$RABBITMQ_CONFIG_FILE"
default_pass = admin
default_user = admin
EOF

#
rabbitmqctl reset
```

### Service

```sh
# Homebrew
brew services start rabbitmq
```

### Commands

```sh
rabbitmq-queues help
rabbitmq-upgrade help
rabbitmqctl help
rabbitmq-diagnostics help
rabbitmq-plugins help
rabbitmqadmin -h
```

<!--
rabbitmq-defaults
rabbitmq-env
-->

### Usage

```sh
#
export RABBITMQ_NODE_IP_ADDRESS='127.0.0.1'
export RABBITMQ_NODE_PORT='5672'
export RABBITMQ_NODENAME='rabbit'

#
rabbitmq-server -detached
```

> Wait! This process take a while.

```sh
#
rabbitmqctl cluster_status

echo -e '[INFO]\thttp://127.0.0.1:15672'

rabbitmqctl shutdown

#
rabbitmq-plugins list
```

### Tips

#### Management UI

```sh
#
rabbitmq-plugins -q is_enabled rabbitmq_management

#
rabbitmq-plugins enable rabbitmq_management

#
cat << EOF >> "$RABBITMQ_CONFIG_FILE"
management.tcp.port = 15672
EOF

#
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app
```

#### Prometheus

```sh
#
rabbitmq-plugins -q is_enabled rabbitmq_prometheus

#
rabbitmq-plugins enable rabbitmq_prometheus --offline

#
cat << EOF >> "$RABBITMQ_CONFIG_FILE"
prometheus.path = /metrics
prometheus.tcp.port = 15692
EOF

#
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app

#
rabbitmq-plugins disable rabbitmq_prometheus
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:15692/metrics'
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
  -h rabbitmq \
  -v rabbitmq-data:/var/lib/rabbitmq \
  -e RABBITMQ_DEFAULT_USER='admin' \
  -e RABBITMQ_DEFAULT_PASS='admin' \
  -p 5672:5672 \
  --name rabbitmq \
  --network workbench \
  docker.io/library/rabbitmq:3.8.2-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:5672'
```

```sh
# Management Plugin Enabled
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rabbitmq \
  -v rabbitmq-data:/var/lib/rabbitmq \
  -e RABBITMQ_DEFAULT_USER='admin' \
  -e RABBITMQ_DEFAULT_PASS='admin' \
  -p 5672:5672 \
  -p 15672:15672 \
  --name rabbitmq \
  --network workbench \
  docker.io/library/rabbitmq:3.8.2-management-alpine
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:15672'
```

| Login | Password |
| --- | --- |
| `guest` | `guest` |
| `admin` | `admin` |

### Remove

```sh
docker rm -f rabbitmq

docker volume rm rabbitmq-data
```
