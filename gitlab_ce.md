# GitLab Community Edition

## Helm

### References

- [Advanced configuration](https://gitlab.com/charts/gitlab/blob/master/doc/advanced/index.md)

### Dependencies

- cert-manager
- nginx-ingress

### Install

```sh
helm repo add gitlab https://charts.gitlab.io/
helm repo update
```

```sh
kubectl create namespace gitlab
```

```sh
helm install gitlab/gitlab \
  -n gitlab-ce \
  --namespace gitlab \
  --set global.edition=ce \
  --set global.ingress.configureCertmanager=false \
  --set global.ingress.class=nginx \
  --set nginx-ingress.enabled=false \
  --set certmanager.install=false
```

```sh
kubectl rollout status deploy/gitlab-ce-gitlab-monitor -n gitlab
```

```sh
kubectl get secret gitlab-ce-minio-secret -o jsonpath='{.data.accesskey}' -n gitlab | base64 --decode; echo
kubectl get secret gitlab-ce-minio-secret -o jsonpath='{.data.secretkey}' -n gitlab | base64 --decode; echo
```

```sh
kubectl get secret gitlab-ce-gitlab-initial-root-password -o jsonpath='{.data.password}' -n gitlab | base64 --decode; echo
```

### Issues

#### Rails Secret

> MountVolume.SetUp failed for volume "init-migrations-secrets" : secret "gitlab-ce-rails-secret" not found

```sh
helm get values gitlab-ce > ./gitlab-ce.yaml
```

```sh
tee -a ./gitlab-ce.yaml << EOF
shared-secrets:
  image:
    tag: 28a3e18b1d65ab0e7a8e086b3c6e6ebbed4aeca3
EOF
```

```sh
helm upgrade gitlab-ce gitlab/gitlab -f ./gitlab-ce.yaml
```

```sh
rm ./gitlab-ce.yaml
```

### Delete

```sh
helm delete gitlab-ce --purge
kubectl delete namespace gitlab --grace-period=0 --force
```

## Docker

### Volume

```sh
docker volume create gitlab-redis-data
docker volume create gitlab-postgres-data
docker volume create gitlab-config
docker volume create gitlab-logs
docker volume create gitlab-data
```

### Running

```sh
docker run -d \
  -h redis.gitlab.local \
  -e REDIS_PASSWORD=gitlab \
  -v gitlab-redis-data:/data \
  -p 6379:6379 \
  --name gitlab-redis \
  --restart always \
  redis:5.0.5-alpine3.9 /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
```

```sh
docker run -d \
  -h postgres.gitlab.local \
  -e POSTGRES_DB=gitlab \
  -e POSTGRES_USER=gitlab \
  -e POSTGRES_PASSWORD=gitlab \
  -v gitlab-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name gitlab-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h ce.gitlab.local \
  -e GITLAB_OMNIBUS_CONFIG="$(cat << 'EOF'
gitlab_rails['initial_root_password'] = 'Pa$$w0rd!'
gitlab_rails['initial_shared_runners_registration_token'] = 't0ken'

gitlab_rails['time_zone'] = 'America/Sao_Paulo'

redis['enable'] = false
gitlab_rails['redis_host'] = 'gitlab-redis'
gitlab_rails['redis_password'] = 'gitlab'
gitlab_rails['redis_database'] = 0

postgresql['enable'] = false
gitlab_rails['db_host'] = 'gitlab-postgres'
gitlab_rails['db_username'] = 'gitlab'
gitlab_rails['db_password'] = 'gitlab'
gitlab_rails['db_database'] = 'gitlab'
EOF
)" \
  -v gitlab-config:/etc/gitlab \
  -v gitlab-logs:/var/log/gitlab \
  -v gitlab-data:/var/opt/gitlab \
  -v /etc/localtime:/etc/localtime:ro \
  -p 2222:22 \
  -p 8080:80 \
  --name gitlab-ce \
  --restart always \
  --link gitlab-redis \
  --link gitlab-postgres \
  gitlab/gitlab-ce:11.10.4-ce.0
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

### Remove

```sh
docker rm -f gitlab-redis gitlab-postgres gitlab-ce
docker volume rm gitlab-redis-data gitlab-postgres-data gitlab-config gitlab-logs gitlab-data
```
