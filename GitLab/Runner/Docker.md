# Docker

## Volume

```sh
docker volume create gitlab-runner-config
```

## Running

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080/admin/runners"
```

```sh
docker run -d \
  -h runner.gitlab.local \
  -v gitlab-runner-config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name gitlab-runner \
  --restart always \
  --link gitlab-ce \
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

## Remove

```sh
docker rm -f gitlab-runner
docker volume rm gitlab-runner-config
```
