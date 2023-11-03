# MailHog

**Keywords:** Local Mail Server

## Links

- [Code Repository](https://github.com/mailhog/MailHog)

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
helm repo update
```

### Install

```sh
#
kubectl create ns mailhog
# kubectl create ns mailing

#
kubens mailhog

#
helm search repo -l codecentric/mailhog

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install mailhog codecentric/mailhog \
  --version 5.2.3 \
  -f <(cat << EOF
auth:
  enabled: true
  fileContents: $(htpasswd -nbBC 10 admin admin)

ingress:
  enabled: true
  ingressClassName: nginx
  hosts:
  - host: mailhog.${K8S_DOMAIN}
    paths:
    - path: /
      pathType: Prefix
EOF
)

#
kubectl get all
```

### NGINX Ingress

#### Using Helm Chart

```sh
# Helm
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.1025 mailhog/mailhog:1025)

# Delete
# TODO
```

#### Using Minikube Addon

```sh
# Minikube
kubectl patch configmap tcp-services \
  -p '{"data":{"1025":"mailhog/mailhog:1025"}}'

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "add", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 1025, "containerPort": 1025}]}]' \

# Delete
kubectl patch configmap tcp-services \
  --type 'json' \
  -p '[{"op": "remove", "path": "/data/1025"}]'

kubectl patch deployment nginx-ingress-controller \
  --type 'json' \
  -p '[{"op": "remove", "path": "/spec/template/spec/containers/0/ports", "value": [{"hostPort": 1025, "containerPort": 1025}]}]'
```

### Status

```sh
kubectl rollout status deploy/mailhog
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/name=mailhog' \
  -f
```

### Delete

```sh
helm uninstall mailhog

kubectl delete ns mailhog --grace-period=0 --force
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
  -h mailhog \
  -p 1025:1025 \
  -p 8025:8025 \
  --name mailhog \
  --network workbench \
  docker.io/mailhog/mailhog:v1.0.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8025'
```

### Remove

```sh
docker rm -f mailhog
```

## Test

### Send Email

```sh
# Docker
telnet '127.0.0.1' 1025

# Kubernetes
telnet "mailhog.${K8S_DOMAIN}" 1025
```

```txt
EHLO xyz.tld
MAIL FROM: <fromuser@xyz.tld>
RCPT TO: <touser@xyz.tld>
DATA
Subject: Sending an email using telnet

Hello,
This is an email sent by using the telnet command.

Your friend,
Me!
.
QUIT
```
