# Sentry

## CLI

### Installation

#### Dependencies

- [Python 2](/python2.md)
- [PostgreSQL](/postgresql.md)
- [Redis](/redis.md)

#### PIP

```sh
pip install sentry
```

### Commands

```sh
sentry --help
```

### Configuration

```sh
sentry init
```

### Running

```sh
# Create PostgreSQL database.
psql \
  -h 127.0.0.1 \
  -U postgres \
  -c 'CREATE DATABASE sentry'

# Set in Sentry config file the password for Redis.
yq w -i ~/.sentry/config.yml '"redis.clusters".default.hosts[0].password' redis

# Set in Sentry python config the password for PostgreSQL
sed -i "/PASSWORD/ s/''/'postgres'/" ~/.sentry/sentry.conf.py

# Run migrations
sentry upgrade

# Running
nohup sentry run web &
nohup sentry run cron &
nohup sentry run worker &

echo -e '[INFO]\thttp://127.0.0.1:9000'

# Stop
pkill uwsgi
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/sentry#configuration)

### Install

```sh
kubectl create namespace sentry
```

```sh
helm install stable/sentry \
  -n sentry \
  --namespace sentry \
  --set user.email='admin@example.com' \
  --set service.type='ClusterIP' \
  --set ingress.enabled=true \
  --set ingress.hostname="sentry.$(minikube ip).nip.io"
```

### SSL

#### Dependencies

- [Kubernetes TLS Secret](/k8s-tls-secret.md)

#### Create

```sh
kubectl create secret tls example.tls-secret \
  --cert='/etc/ssl/certs/example/root-ca.crt' \
  --key='/etc/ssl/private/example/root-ca.key' \
  -n sentry
```

```sh
helm upgrade sentry stable/sentry -f <(yq m <(cat << EOF
ingress:
  tls:
    - secretName: example.tls-secret
      hosts:
        - sentry.$(minikube ip).nip.io
EOF
) <(helm get values sentry))
```

#### Remove

```sh
helm upgrade sentry stable/sentry -f <(yq d <(helm get values sentry) ingress.tls)

kubectl delete secret example.tls-secret -n sentry
```

### Status

```sh
kubectl rollout status deploy/sentry-web -n sentry
```

### Logs

```sh
kubectl logs -l 'app=sentry,role=web' -n sentry -f
kubectl logs -l 'app=sentry,role=worker' -n sentry -f
kubectl logs -l 'app=sentry,role=cron' -n sentry -f
```

### DNS

```sh
dig @10.96.0.10 sentry.sentry.svc.cluster.local +short
nslookup sentry.sentry.svc.cluster.local 10.96.0.10
```

#### ExternalDNS

```sh
dig @10.96.0.10 "sentry.$(minikube ip).nip.io" +short
nslookup "sentry.$(minikube ip).nip.io" 10.96.0.10
```

### Secret

```sh
kubectl get secret sentry \
  -o jsonpath='{.data.user-password}' \
  -n sentry | \
    base64 --decode; echo
```

### Delete

```sh
helm delete sentry --purge
kubectl delete namespace sentry --grace-period=0 --force
```
