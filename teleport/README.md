# Teleport

<!--
https://github.com/krzwiatrzyk/lib-cluster-manager/tree/main/k8s-apps/teleport/manifests
-->

**Keywords:** Bastion Host, IAP, Access Plane

## Links

- [Code Repository](https://github.com/gravitational/teleport)
- [Main Website](https://goteleport.com)
- [Docs](https://goteleport.com/docs/)

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
# kubectl create ns security

#
kubens teleport

#
helm search repo -l teleport/teleport-cluster

#
export KUBERNETES_IP='<kubernetes-ip>'
export DOMAIN="${KUBERNETES_IP}.nip.io"

#
[[ -n "${DOMAIN}" ]] && cat << EOF | kubectl apply \
  -f -
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: teleport-cluster
data:
  teleport.yaml: |
    teleport:
      log:
        severity: INFO
        output: stderr
        format:
          output: text
          extra_fields:
            - timestamp
            - level
            - component
            - caller
    auth_service:
      enabled: true
      cluster_name: teleport.${DOMAIN}
      authentication:
        type: local
        local_auth: true
        second_factor: 'off'
    kubernetes_service:
      enabled: true
      listen_addr: 0.0.0.0:3027
      kube_cluster_name: teleport.${DOMAIN}
    proxy_service:
      public_addr: teleport.${DOMAIN}:443
      kube_listen_addr: 0.0.0.0:3026
      mysql_listen_addr: 0.0.0.0:3036
      enabled: true
    ssh_service:
      enabled: false
EOF

#
[[ -n "${DOMAIN}" ]] && helm install teleport-cluster teleport/teleport-cluster \
  --namespace teleport-system \
  --version 12.2.4 \
  -f <(cat << EOF
clusterName: teleport.${DOMAIN}

authentication:
  secondFactor: 'off'

chartMode: custom

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
kubectl rollout status deployment/teleport-cluster \
  -n teleport-system
```

### Logs

```sh
kubectl logs \
  -l 'app=teleport-cluster' \
  -n teleport-system \
  -f
```

### Ingress

```sh
#
[[ -n "${DOMAIN}" ]] && cat << EOF | kubectl apply \
  -n teleport-system \
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
curl -k "https://teleport.${DOMAIN}/webapi/ping"
```

#### TCP Ingress Route

| Service     | Port |
| ----------- | ---- |
| SSH Proxy   | 3023 |
| Kubernetes  | 3026 |
| SSH Tunnel  | 3024 |
| MySQL Proxy | 3036 |

```sh
kubectl patch configmap tcp-services \
  -p '{"data":{"3023":"teleport-system/teleport-cluster:3023","3026":"teleport-system/teleport-cluster:3026","3024":"teleport-system/teleport-cluster:3024","3036":"teleport-system/teleport-cluster:3036"}}' \
  -n ingress-nginx

kubectl get deployment ingress-nginx-controller \
  -o json \
  -n ingress-nginx | \
    jq '.spec.template.spec.containers[0].ports += [{"hostPort": 3023, "containerPort": 3023},{"hostPort": 3026, "containerPort": 3026},{"hostPort": 3024, "containerPort": 3024},{"hostPort": 3036, "containerPort": 3036}]' | \
      kubectl apply -f -
```

<!--
- kube.teleport.${DOMAIN}
- tunnel.teleport.${DOMAIN}
- ssh.teleport.${DOMAIN}
- mysql.teleport.${DOMAIN}
-->

#### Create App User

```sh
#
export POD_NAME=$(kubectl get po -l app=teleport-cluster -o jsonpath='{.items[0].metadata.name}' -n teleport-system)

[[ -n "${POD_NAME}" ]] && kubectl exec "$POD_NAME" \
  -n teleport-system \
  -- tctl get roles --format text

#
[[ -n "${POD_NAME}" ]] && kubectl exec "$POD_NAME" \
  -n teleport-system \
  -- tctl users add \
    --logins 'root,ubuntu,ec2-user' \
    --roles 'access,auditor,editor' \
    admin
```

### Delete

```sh
helm uninstall teleport-cluster \
  -n teleport-system

kubectl delete ns teleport-system \
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
