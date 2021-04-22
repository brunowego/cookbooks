# GitLab Runner

## Docker

### Dependencies

- [GitLab CE](/gitlab_ce.md)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h runner \
  -v /etc/ssl/certs/example.com/server:/etc/gitlab-runner/ssl \
  -v gitlab-runner-data:/home/gitlab-runner\
  -v gitlab-runner-config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name gitlab-runner \
  --network workbench \
  gitlab/gitlab-runner:alpine-v13.5.0
```

```sh
docker exec -i gitlab-runner gitlab-runner register \
  --tag-list=docker,dind \
  --non-interactive \
  --registration-token t0ken \
  --run-untagged \
  --locked=false \
  --url 'https://gitlab-ce' \
  --executor docker \
  --docker-image docker:stable \
  --docker-volumes '/var/run/docker.sock:/var/run/docker.sock' \
  --docker-network-mode bridge \
  --tls-ca-file /etc/gitlab-runner/ssl/server.pem \
  --docker-extra-hosts=gitlab.example.com:$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' gitlab-ce)
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/admin/runners'
```

### Remove

```sh
docker rm -f gitlab-runner

docker volume rm gitlab-runner-data gitlab-runner-config
```

### Issues

#### Missing hostname in certificate

```log
ERROR: Registering runner... failed                 runner=t0ken status=couldn't execute POST against https://gitlab-ce/api/v4/runners: Post https://gitlab-ce/api/v4/runners: x509: certificate is valid for example.com, *.example.com, localhost, not gitlab-ce
```

Add `gitlab-ce` to `mkcert`.

## CLI

### Installation

#### Homebrew

```sh
brew install gitlab-runner
```

### Service

#### Homebrew

```sh
brew services start gitlab-runner
```

### Commands

```sh
gitlab-runner -h
```

### Tips

####

```sh
#
gitlab-runner run
```

####

```sh
gitlab-runner exec docker build_job
```

####

```sh
gitlab-runner register

gitlab-runner install

gitlab-runner start

gitlab-runner exec shell build_job
```

####

```sh
# Register
gitlab-runner register \
  --tag-list=docker,dind \
  --non-interactive \
  --registration-token t0ken \
  --run-untagged \
  --locked=false \
  --url 'http://127.0.0.1:8080' \
  --executor docker \
  --docker-image docker:stable \
  --docker-volumes '/var/run/docker.sock:/var/run/docker.sock' \
  --docker-network-mode bridge

# List
gitlab-runner list

# Unregister
gitlab-runner unregister -n $(hostname)
```
