# Fonoster

<!--
Twilio Alternative
-->

## Links

- [Code Repository](https://github.com/fonoster/fonoster)
- [Main Website](https://fonoster.com)

## CLI

### Installation

#### NPM

```sh
npm install -g @fonoster/ctl
```

### Commands

```sh
fonoster help
```

### Usage

```sh
#
fonoster config:init
```

## Helm

### References

- [Helm Chart](https://github.com/fonoster/fonoster/tree/main/.helm)

### Repository

```sh
helm repo add fonoster 'https://fonoster.github.io/fonoster/charts'
helm repo update
```

### Install

```sh
#
kubectl create ns fonoster-system

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install fonoster fonoster/fonos \
  --namespace fonoster-system \
  --version 0.0.7 \
  -f <(cat << EOF
apiserver:
  ingress:
    host: fonos.${K8S_DOMAIN}
EOF
)
```

### Status

```sh
kubectl rollout status deploy/fonoster-apiserver \
  -n fonoster-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=grafana' \
  -n fonoster-system \
  -f
```

### Delete

```sh
helm uninstall fonoster \
  -n fonoster-system

kubectl delete ns fonoster-system
```
