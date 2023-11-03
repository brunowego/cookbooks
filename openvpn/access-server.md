# OpenVPN Access Server (AS)

<!--
https://www.youtube.com/watch?v=3F18KT8W7CQ&t=364s

https://github.com/linuxserver/docker-openvpn-as/pkgs/container/openvpn-as
-->

## Links

- [Dashboard](https://as-portal.openvpn.com)

## Uses

- Create Secure IoT Network
- IP Address Whitelisting for SaaS Apps
- Remote Access
- Secure Access to the Cloud
- Site-to-site
- Third Party Access
- VOIP Security

## Helm

### References

- [Parameters](https://github.com/henkiz/helm-charts/tree/master/charts/openvpn-as#parameters)

### Repository

```sh
helm repo add henkiz 'https://henkiz.github.io/helm-charts'
helm repo update
```

### Install

```sh
#
kubectl create ns openvpn-system
# kubectl create ns vpn

#
helm search repo -l henkiz/openvpn-as

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
helm install openvpn-as ./ \
  --namespace openvpn-system \
  --version 0.0.1 \
  -f <(cat << EOF
openvpn:
  users:
    - user: user
      password: user

ingress:
  gui:
    enabled: true
    hostName: client.openvpn.${K8S_DOMAIN}
  admin:
    enabled: true
    hostName: admin.openvpn.${K8S_DOMAIN}
EOF
)

#
kubectl get all -n openvpn-system
```

### Status

```sh
kubectl rollout status deployment/openvpn-as \
  -n openvpn-system
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/instance=openvpn-as' \
  -n openvpn-system \
  -f
```

### Delete

```sh
helm uninstall openvpn-as \
  -n openvpn-system

kubectl delete ns openvpn-system \
  --grace-period=0 \
  --force
```
