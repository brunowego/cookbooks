# Examples

## Register

```sh
sudo gitlab-runner register \
  --tag-list=docker,dind \
  --non-interactive \
  --registration-token t0ken \
  --run-untagged \
  --locked=false \
  --url "http://$(docker-machine ip):8080" \
  --executor docker \
  --docker-image docker:stable \
  --docker-volumes '/var/run/docker.sock:/var/run/docker.sock' \
  --docker-network-mode bridge
```

## List

```sh
sudo gitlab-runner list
```

## Unregister

```sh
sudo gitlab-runner unregister -n $(hostname)
```
