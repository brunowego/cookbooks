# Teleport

<!--
https://github.com/krzwiatrzyk/lib-cluster-manager/tree/main/k8s-apps/teleport/manifests
-->

**Keywords:** Bastion Host, IAP, Access Plane

## Links

- [Code Repository](https://github.com/gravitational/teleport)
- [Main Website](https://goteleport.com)
- [Docs](https://goteleport.com/docs/)
  - [Teleport Configuration Reference](https://goteleport.com/docs/reference/config/)

## Glossary

- Application-Layer Protocol Negotiation (ALPN)
- Infrastructure Access Platform (IAP)
- Role-based Access Controls (RBAC)

## Terms

- Passwordless Access
- Per-session Multi-factor Authentication

## Helm

### References

- [Arguments Reference](https://github.com/gravitational/teleport/tree/master/examples/chart/teleport-cluster#arguments-reference)

### Dependencies

- [Cert Manager (cert-manager)](/cert-manager/README.md#helm)

### Repository

```sh
helm repo add teleport 'https://charts.releases.teleport.dev'
helm repo update
```

### Install

```sh
#
kubectl create ns teleport
# kubectl create ns security-gate

#
kubens teleport

#
helm search repo -l teleport/teleport-cluster

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
[[ -n "${DOMAIN}" ]] && helm install teleport-cluster teleport/teleport-cluster \
  --version 13.1.0 \
  -f <(cat << EOF
clusterName: teleport.${DOMAIN}

authentication:
  secondFactor: 'off'

service:
  type: ClusterIP

extraArgs:
  - --insecure
EOF
)

#
kubectl get all
```

### Status

```sh
kubectl rollout status deployment teleport-cluster-auth
```

### Logs

```sh
kubectl logs \
  -l 'app.kubernetes.io/component=auth' \
  -f
```

### Ingress

```sh
#
[[ -n "${DOMAIN}" ]] && cat << EOF | kubectl apply \
  -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: teleport-cluster
  labels:
    app: teleport-cluster
  annotations:
    app.kubernetes.io/name: teleport-cluster
    cert-manager.io/cluster-issuer: letsencrypt-issuer
    nginx.ingress.kubernetes.io/backend-protocol: HTTPS
spec:
  ingressClassName: nginx
  tls:
  - hosts:
      - teleport.${DOMAIN}
    secretName: teleport.tls-secret
  rules:
    - host: teleport.${DOMAIN}
      http:
        paths:
        - backend:
            service:
              name: teleport-cluster
              port:
                number: 443
          path: /
          pathType: Prefix
EOF

#
curl -sk "https://teleport.${DOMAIN}/webapi/ping" | jq .
```

### Create App User

```sh
#
export POD_NAME=$(kubectl get po -l app.kubernetes.io/component=auth -o jsonpath='{.items[0].metadata.name}')

#
[[ -n "${POD_NAME}" ]] && kubectl exec "$POD_NAME" \
  -- tctl get roles --format text

#
[[ -n "${POD_NAME}" ]] && kubectl exec "$POD_NAME" \
  -- tctl users add \
    --logins 'root,ubuntu,ec2-user' \
    --roles 'access,auditor,editor' \
    admin
```

### Ingress Route

#### Option 1: Using TCP

| Service     | Port |
| ----------- | ---- |
| SSH Proxy   | 3023 |
| Kubernetes  | 3026 |
| SSH Tunnel  | 3024 |
| MySQL Proxy | 3036 |

```sh
#
nmap "$(minikube ip)" -p 3023,3024,3026,3036

#
export NAMESPACE="$(kubens -c)"

#
kubectl patch configmap tcp-services \
  -p '{"data":{"3023":"'$NAMESPACE'/teleport-cluster:3023","3026":"'$NAMESPACE'/teleport-cluster:3026","3024":"'$NAMESPACE'/teleport-cluster:3024","3036":"'$NAMESPACE'/teleport-cluster:3036"}}' \
  -n ingress-nginx

#
kubectl get deployment ingress-nginx-controller \
  -o json \
  -n ingress-nginx | \
    jq '.spec.template.spec.containers[0].ports += [{"hostPort": 3023, "containerPort": 3023},{"hostPort": 3026, "containerPort": 3026},{"hostPort": 3024, "containerPort": 3024},{"hostPort": 3036, "containerPort": 3036}]' | \
      kubectl apply -f -
```

#### Option 2: Using Multiplex

```sh
#
kubens teleport

#
export TELEPORT_HELM_CHART_VERSION='13.1.0'

#
helm upgrade teleport-cluster teleport/teleport-cluster \
  --version "$TELEPORT_HELM_CHART_VERSION" \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values teleport-cluster -o yaml) <(cat << EOF
proxyListenerMode: multiplex
EOF
))

#
helm get values teleport-cluster -o yaml

#
curl -sk "https://teleport.${DOMAIN}/webapi/ping" | jq .
```

#### Option 3: Using Domain

> Note: Currently Not Working

| Service     | Host                        |
| ----------- | --------------------------- |
| SSH Proxy   | `ssh.teleport.${DOMAIN}`    |
| Kubernetes  | `kube.teleport.${DOMAIN}`   |
| SSH Tunnel  | `tunnel.teleport.${DOMAIN}` |
| MySQL Proxy | `mysql.teleport.${DOMAIN}`  |

```sh
#
kubens teleport

#
[[ -n "${DOMAIN}" ]] && cat << EOF | kubectl apply \
  -f -
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: teleport-cluster-ssh
  annotations:
    app.kubernetes.io/name: teleport-cluster-ssh
    cert-manager.io/cluster-issuer: letsencrypt-issuer
    nginx.ingress.kubernetes.io/backend-protocol: HTTPS
spec:
  ingressClassName: nginx
  tls:
  - hosts:
      - ssh.teleport.${DOMAIN}
    secretName: teleport-ssh.tls-secret
  rules:
    - host: ssh.teleport.${DOMAIN}
      http:
        paths:
        - backend:
            service:
              name: teleport-cluster
              port:
                number: 3023
          path: /
          pathType: Prefix
EOF

#
export TELEPORT_HELM_CHART_VERSION='13.1.0'

#
helm upgrade teleport-cluster teleport/teleport-cluster \
  --version "$TELEPORT_HELM_CHART_VERSION" \
  -f <(yq eval-all 'select(fileIndex == 0) * select(fileIndex == 1)' <(helm get values teleport-cluster -o yaml) <(cat << EOF
sshPublicAddr:
  - ssh.teleport.${DOMAIN}:443
EOF
))

#
curl -sk "https://teleport.${DOMAIN}/webapi/ping" | jq .
```

### Next Steps

- [Teleport Kube Agent](./kube-agent.md#helm)
- Services
  - [Teleport Application Service](./services/application.md)

### Issues

#### TBD

```log
ERROR: Unable to connect to ssh proxy at ssh.teleport.192.168.64.46.nip.io:443. Confirm connectivity and availability. Error: ssh: handshake failed: ssh: overflow reading version string
```

TODO

### Delete

```sh
helm uninstall teleport-cluster

kubectl delete ns teleport \
  --grace-period=0 \
  --force

kubectl delete pv "$(kubectl get pv -o json | jq -r '.items[] | select(.spec.claimRef.name=="teleport-cluster") | .metadata.name')"
```

## CLI

### Dependencies

- Linux
  - [cURL](/curl.md)
- Ubuntu
  - [GNU Privacy Guard (GPG) or GNU Pretty Good Privacy (PGP)](/gnu/pg.md)
  - [Software Properties Common](/apt/software-properties-common.md#installation)
- CentOS
  - [yum-utils](/yum-utils.md)

### Installation

#### Homebrew

```sh
brew install teleport
```

#### APT

```sh
curl 'https://deb.releases.teleport.dev/teleport-pubkey.asc' | sudo apt-key add -
sudo add-apt-repository 'deb https://deb.releases.teleport.dev/ stable main'

sudo apt update
sudo apt -y install teleport
```

#### YUM

```sh
sudo yum-config-manager --add-repo 'https://rpm.releases.teleport.dev/teleport.repo'

yum check-update
sudo yum -y install teleport
```

#### Chocolatey

```sh
choco install -y teleport-tsh
```

### Environment

**Dependency:** [alias](/shell/alias.md)

```sh
cat << EOF >> ~/.aliases
alias tctl='tctl --insecure'
alias tsh='tsh --insecure'
EOF

source ~/.zshrc
```

<!--
TELEPORT_CONFIG_FILE=$HOME/.config/teleport/teleport.yaml
-->

### Commands

```sh
teleport -h

tsh -h

tctl -h
```

### Configuration

```sh
#
sudo install -dm 775 -o "$(id -u)" -g "$(id -g)" /var/lib/teleport

#
teleport configure > /etc/teleport.yaml

#
teleport start -c /etc/teleport.yaml
```

<!-- ### Usage

```sh
teleport app start \
  --app-name \
  --app-uri

teleport db start

teleport status

teleport configure
``` -->
