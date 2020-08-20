# Polyaxon

## References

- [Integrations](https://docs.polyaxon.com/integrations/)
- [Single Sign On](https://docs.polyaxon.com/configuration/sso/)

## Helm

### References

- [How to set the configuration](https://github.com/polyaxon/polyaxon-chart#how-to-set-the-configuration)

### Dependencies

- [Persistent Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)

### Repository

```sh
helm repo add polyaxon https://charts.polyaxon.com
helm repo update polyaxon
```

### Install

```sh
kubectl create namespace polyaxon
```

```sh
helm install polyaxon/polyaxon \
  -n polyaxon \
  --namespace polyaxon \
  --set serviceType='ClusterIP' \
  --set ingress.enabled=true \
  --set ingress.hostName="polyaxon.$(minikube ip).nip.io" \
  --set user.username='admin' \
  --set user.email="admin@$(minikube ip).nip.io" \
  --set user.password="$(head -c 12 /dev/urandom | shasum | cut -d ' ' -f 1)" \
  --timeout 900 \
  --wait
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
        - polyaxon.$(minikube ip).nip.io
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
dig @10.96.0.10 "polyaxon.$(minikube ip).nip.io" +short
nslookup "polyaxon.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret polyaxon-polyaxon-secret \
  -o jsonpath='{.data.POLYAXON_ADMIN_PASSWORD}' \
  -n polyaxon | \
    base64 --decode; echo
```

| Key | Value |
| --- | --- |
| Database | `polyaxon` |
| Username | `polyaxon` |

```sh
kubectl get secret polyaxon-postgresql \
  -o jsonpath='{.data.postgres-password}' \
  -n polyaxon | \
    base64 --decode; echo
```

```sh
kubectl get secret polyaxon-rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-management-username}' \
  -n polyaxon | \
    base64 --decode; echo

kubectl get secret polyaxon-rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-management-password}' \
  -n polyaxon | \
    base64 --decode; echo
```

```sh
kubectl get secret polyaxon-rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-username}' \
  -n polyaxon | \
    base64 --decode; echo

kubectl get secret polyaxon-rabbitmq-ha \
  -o jsonpath='{.data.rabbitmq-password}' \
  -n polyaxon | \
    base64 --decode; echo
```

###

```sh
kubectl port-forward \
  --address 0.0.0.0 \
  service/polyaxon-postgresql \
  5432:5432 \
  -n polyaxon
```

### LDAP

```sh
helm upgrade polyaxon polyaxon/polyaxon -f <(yq m <(cat << EOF
ldap:
  enabled: true
  serverUri: 'ldap://$(minikube ip).nip.io'
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

### Shell

```sh
kubectl exec -it \
  $(kubectl get pod -l 'app=polyaxon-polyaxon-api' -o jsonpath='{.items[0].metadata.name}' -n polyaxon) \
  -c polyaxon-api \
  -n polyaxon \
  -- /bin/bash
```

#### Remove

```sh
helm upgrade polyaxon polyaxon/polyaxon -f <(yq d <(helm get values polyaxon) ldap)
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
pip install -U polyaxon-cli
```

### Commands

```sh
polyaxon --help
```

### Examples

#### Configuration

```sh
polyaxon config set \
  --host 'polyaxon.$(minikube ip).nip.io' \
  --port '443' \
  --use_https true \
  --verify_ssl false
```

```sh
# Using CLI
polyaxon config -l

# Reading config file
cat ~/.polyaxon/.polyaxonconfig | jq
```

#### Login

```sh
polyaxon login

polyaxon whoami
```

#### Project

```sh
polyaxon project create \
  --name '[name]' \
  --description '[description]'
```

```sh
polyaxon init '[name]'
```

```sh
polyaxon project \
  -p '[name]' \
  git \
    --url="https://gitlab.$(minikube ip).nip.io/experiments/[name].git"
    --private
```

```sh
polyaxon run -f polyaxon_hyperparams.yaml
```

```sh
polyaxon notebook start -f polyaxon_notebook.yaml
```
