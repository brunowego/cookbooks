# Polyaxon

## References

- [Single Sign On](https://docs.polyaxon.com/configuration/sso/)

## Helm

### References

- [How to set the configuration](https://github.com/polyaxon/polyaxon-chart#how-to-set-the-configuration)

### Dependencies

- [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

### Repository

```sh
helm repo add polyaxon https://charts.polyaxon.com
helm repo update
```

### Install

```sh
kubectl create namespace polyaxon
```

```sh
helm install polyaxon/polyaxon \
  -n polyaxon \
  --namespace polyaxon \
  --set serviceType=ClusterIP \
  --set ingress.enabled=true \
  --set ingress.hostName=polyaxon.example.com \
  --set user.username=admin \
  --set user.email=admin@example.com \
  --set user.password="$(openssl rand -hex 32)"
```

### SSL

### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n polyaxon
```

```sh
helm upgrade polyaxon polyaxon/polyaxon -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - polyaxon.example.com
EOF
) <(helm get values polyaxon))
```

#### Remove

```sh
helm upgrade polyaxon polyaxon/polyaxon -f <(yq d <(helm get values polyaxon) ingress.tls)

kubectl delete secret example.tls-secret -n polyaxon
```

### Status

```sh
kubectl rollout status deploy/polyaxon-polyaxon-api -n polyaxon
```

### Logs

```sh
kubectl logs -c polyaxon-api -l 'app=polyaxon-polyaxon-api' -n polyaxon -f

kubectl logs -c polyaxon-streams -l 'app=polyaxon-polyaxon-api' -n polyaxon -f
```

### DNS

```sh
dig @10.96.0.10 polyaxon-polyaxon-api.polyaxon.svc.cluster.local +short
nslookup polyaxon-polyaxon-api.polyaxon.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 polyaxon.example.com +short
nslookup polyaxon.example.com 10.96.0.10
```

### Secret

```sh
kubectl get secret polyaxon-polyaxon-secret \
  -o jsonpath='{.data.POLYAXON_ADMIN_PASSWORD}' \
  -n polyaxon | \
    base64 --decode; echo
```

### LDAP

```sh
helm upgrade polyaxon polyaxon/polyaxon -f <(yq m <(cat << EOF
ldap:
  enabled: true
  serverUri: 'ldap://example.com'
  globalOptions: {}
  connectionOptions: {}
  bindDN: 'cn=admin,dc=example,dc=com'
  bindPassword: ''
  userSearchBaseDN: 'dc=example,dc=com'
  userSearchFilterStr: '(mail=%(user)s)'
  userDNTemplate: 'uid=%(user)s,ou=users,dc=example,dc=com'
  startTLS: false
  userAttrMap: {'first_name': 'givenName', 'last_name': 'sn'}
  groupSearchBaseDN: 'ou=groups,dc=example,dc=com'
  groupSearchGroupType: '(objectClass=groupOfNames)'
  requireGroup: 'cn=enabled,ou=groups,dc=example,dc=com'
  denyGroup: 'cn=disabled,ou=groups,dc=example,dc=com'
EOF
) <(helm get values polyaxon))
```

### Delete

```sh
helm delete polyaxon --purge
kubectl delete namespace polyaxon --grace-period=0 --force
```

## CLI

### Installation

#### PIP

```sh
pip install polyaxon-cli
```

### Commands

```sh
polyaxon --help
```
