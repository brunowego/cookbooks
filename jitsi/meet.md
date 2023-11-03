# Jitsi Meet

<!--
https://www.udemy.com/course/integrate-free-jitsi-video-conference-api-in-php-codeigniter/
https://www.udemy.com/course/bigbluebutton-jitsi-installation-configuration/
-->

## Links

- [Code Repository](https://github.com/jitsi/jitsi-meet)

## App

### Installation

#### Homebrew

```sh
brew install --cask jitsi-meet
```

## Helm

### References

- [Configuration](https://github.com/jitsi-contrib/jitsi-helm#configuration)

### Repository

```sh
helm repo add jitsi 'https://jitsi-contrib.github.io/jitsi-helm/'
helm repo update
```

### Install

```sh
#
kubectl create ns jitsi

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install jitsi-meet jitsi/jitsi-meet \
  --namespace jitsi \
  --version 0.2.0 \
  -f <(cat << EOF
publicURL: jitsi.${K8S_DOMAIN}

web:
  ingress:
    enabled: true
    hosts:
    - host: jitsi.${K8S_DOMAIN}
      paths: ['/']
EOF
)
```

### Status

```sh
kubectl rollout status statefulset/jitsi-meet-prosody \
  -n jitsi
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=jitsi-meet' \
  -n jitsi \
  -f
```

### Delete

```sh
helm uninstall jitsi-meet \
  -n jitsi

kubectl delete ns jitsi \
  --grace-period=0 \
  --force
```
