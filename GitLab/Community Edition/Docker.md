# Docker

## Volume

```sh
docker volume create gitlab-redis-data
docker volume create gitlab-postgres-data
docker volume create gitlab-config
docker volume create gitlab-logs
docker volume create gitlab-data
```

## Running

```sh
docker run -d \
  -h redis.gitlab.local \
  -v gitlab-redis-data:/data \
  -p 6379:6379 \
  --name gitlab-redis \
  --restart always \
  redis:5.0.4-alpine3.9 redis-server --appendonly yes
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
gitlab_rails['redis_database'] = 1

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
  -p 8080:80 \
  -p 2222:22 \
  --name gitlab-ce \
  --restart always \
  --link gitlab-redis \
  --link gitlab-postgres \
  gitlab/gitlab-ce:11.10.4-ce.0
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

## Remove

```sh
docker rm -f gitlab-redis gitlab-postgres gitlab-ce
docker volume rm gitlab-redis-data gitlab-postgres-data gitlab-config gitlab-logs gitlab-data
```
