# MailHog

## CLI

### Installation

#### Homebrew

```sh
brew install mailhog
```

### Commands

```sh
mailhog -h
```

### Usage

```sh
# Password Generate
mailhog bcrypt 'Pa$$w0rd!'
```

## Helm

### References

- [Configuration](https://github.com/codecentric/helm-charts/tree/master/charts/mailhog#configuration)

### Repository

```sh
helm repo add codecentric https://codecentric.github.io/helm-charts
helm repo update codecentric
```

### Install

```sh
kubectl create namespace mailhog
```

```sh
helm install codecentric/mailhog \
  -n mailhog \
  --namespace mailhog \
  --set auth.enabled=true \
  --set auth.fileContents="admin:$(mailhog bcrypt admin)" \
  --set ingress.enabled=true \
  --set "ingress.hosts[0].host=mailhog.$(minikube ip).nip.io" \
  --set 'ingress.hosts[0].paths={/}'
```

### NGINX Ingress

```sh
# Helm
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.1025 mailhog/mailhog:1025)

## Delete
# TODO

# Minikube
kubectl patch configmap tcp-services \
  -p '{"data":{"1025":"mailhog/mailhog:1025"}}' \
  -n kube-system

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "add", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 1025, "containerPort": 1025}]}]' \
  -n kube-system

## Delete
kubectl patch configmap tcp-services \
  --type 'json' \
  -p '[{"op": "remove", "path": "/data/1025"}]' \
  -n kube-system

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "remove", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 1025, "containerPort": 1025}]}]' \
  -n kube-system
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n mailhog
```

```sh
helm upgrade mailhog codecentric/mailhog -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - mailhog.$(minikube ip).nip.io
EOF
) <(helm get values mailhog))
```

#### Remove

```sh
helm upgrade mailhog codecentric/mailhog -f <(yq d <(helm get values mailhog) ingress.tls)

kubectl delete secret example.tls-secret -n mailhog
```

### Status

```sh
kubectl rollout status deploy/mailhog -n mailhog
```

### Logs

```sh
kubectl logs -l 'app.kubernetes.io/name=mailhog' -n mailhog -f
```

### DNS

```sh
dig @10.96.0.10 mailhog.mailhog.svc.cluster.local +short
nslookup mailhog.mailhog.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "mailhog.$(minikube ip).nip.io" +short
nslookup "mailhog.$(minikube ip).nip.io" 10.96.0.10
```

### Delete

```sh
helm delete mailhog --purge
kubectl delete namespace mailhog --grace-period=0 --force
```

## Docker

### Running

```sh
docker run -d \
  -h mailhog \
  -p 1025:1025 \
  -p 8025:8025 \
  --name mailhog \
  docker.io/mailhog/mailhog:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8025'
```

## Test

### Send Email

```sh
# Docker
telnet '127.0.0.1' 1025

# Kubernetes
telnet "mailhog.$(minikube ip).nip.io" 1025
```

```txt
EHLO example.com
MAIL FROM: <fromuser@example.com>
RCPT TO: <touser@example.com>
DATA
Subject: Sending an email using telnet

Hello,
This is an email sent by using the telnet command.

Your friend,
Me!
.
QUIT
```
