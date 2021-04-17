# Drone

## Run

```sh
docker run -d \
  -h drone \
  -e DRONE_GITLAB=true \
  -e DRONE_GITLAB_URL=[domain] \
  -e DRONE_GITLAB_CLIENT=[client] \
  -e DRONE_GITLAB_SECRET=[secret] \
  -e DRONE_SECRET=[password] \
  -e DRONE_OPEN=false \
  -e DRONE_ADMIN=[username]
  -v /var/lib/drone:/var/lib/drone \
  -p 80:8000 \
  --name drone \
  drone/drone:0.5
```

### Agent

```sh
docker run -d \
  -h drone-agent \
  -e DRONE_SERVER=[domain] \
  -e DRONE_SECRET=[secret] \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name drone-agent \
  drone/drone:0.5 agent
```

### Logs

```sh
docker logs drone
```
