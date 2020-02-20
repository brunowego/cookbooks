# GitLab Runner

## Docker

### Running

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/admin/runners'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h runner \
  -v gitlab-runner-config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name gitlab-runner \
  gitlab/gitlab-runner:alpine-v11.10.1
```

```sh
docker exec -i \
  gitlab-runner gitlab-runner register \
  --tag-list=docker,dind \
  --non-interactive \
  --registration-token t0ken \
  --run-untagged \
  --locked=false \
  --url 'http://gitlab-ce' \
  --executor docker \
  --docker-image docker:stable \
  --docker-volumes '/var/run/docker.sock:/var/run/docker.sock' \
  --docker-network-mode bridge
```

### Remove

```sh
docker rm -f gitlab-runner
docker volume rm gitlab-runner-config
```

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

#### Register

```sh
sudo gitlab-runner register \
  --tag-list=docker,dind \
  --non-interactive \
  --registration-token t0ken \
  --run-untagged \
  --locked=false \
  --url "http://127.0.0.1:8080" \
  --executor docker \
  --docker-image docker:stable \
  --docker-volumes '/var/run/docker.sock:/var/run/docker.sock' \
  --docker-network-mode bridge
```

#### List

```sh
sudo gitlab-runner list
```

#### Unregister

```sh
sudo gitlab-runner unregister -n $(hostname)
```
