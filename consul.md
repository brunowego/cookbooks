# Consul

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/consul#configuration)

### Install

```sh
kubectl create namespace consul
```

```sh
helm install stable/consul \
  -n consul \
  --namespace consul \
  --set uiIngress.enabled=true \
  --set uiIngress.hosts={consul.$(minikube ip).nip.io} \
  --set uiService.type=ClusterIP
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Upgrade

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n consul
```

```sh
helm upgrade consul stable/consul -f <(yq m <(cat << EOF
uiIngress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - consul.$(minikube ip).nip.io
EOF
) <(helm get values consul))
```

<!-- ### ACL

  --set acl.enabled=true \
  --set acl.masterToken="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --set acl.agentToken="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" -->

### Status

```sh
kubectl rollout status statefulset/consul -n consul
```

<!-- ### Secret

```sh
kubectl get secret consul-gossip-key \
  -o jsonpath='{.data.gossip-key}' \
  -n consul | \
    base64 --decode; echo
``` -->

### Delete

```sh
helm delete consul --purge
kubectl delete namespace consul --grace-period=0 --force
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h consul \
  -e CONSUL_BIND_INTERFACE=eth0 \
  -p 8500:8500/tcp \
  --name consul \
  consul:1.5.2 agent -bootstrap-expect=1 -client=0.0.0.0 -server -ui
```

```sh
xdg-open 'http://127.0.0.1:8500' || open 'http://127.0.0.1:8500' || echo -e '[INFO]\thttp://127.0.0.1:8500'
```

### Remove

```sh
docker rm -f consul
```

## CLI

### Installation

#### Homebrew

```sh
brew install consul
```

#### Chocolatey

```sh
choco install -y consul
```

### Commands

```sh
consul --help
```

### Examples

#### Agent Develop

```sh
consul agent \
  -dev \
  -advertise 127.0.0.1
```
