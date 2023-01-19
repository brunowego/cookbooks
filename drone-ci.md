# Drone CI

**Keywords:** Continuous Integration

## Links

- [Main Website](https://drone.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install drone-cli
```

### Commands

```sh
drone -h
```

### Usage

```sh
#
drone sign [group/repo]

#
drone secret add \
  --image=plugins/sftp-cache \
  [group/repo] SFTP_CACHE_SERVER [hostname]:22

#
drone secret add \
  --image=plugins/sftp-cache \
  [group/repo] SFTP_CACHE_PATH /cache

#
drone secret add \
  --image=plugins/sftp-cache \
  [group/repo] SFTP_CACHE_USERNAME [username]

#
drone secret add \
  --image=plugins/sftp-cache \
  [group/repo] SFTP_CACHE_PASSWORD [password]

#
drone secret ls [group/repo]
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
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
  --network workbench \
  docker.io/drone/drone:1.10.1
```

<!-- ### Agent

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h drone-agent \
  -e DRONE_SERVER=[domain] \
  -e DRONE_SECRET=[secret] \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name drone-agent \
  --network workbench \
  drone/drone:0.5 agent
``` -->

<!-- ## Run

```sh
sudo mkdir -p /etc/drone
sudo vim /etc/drone/dronerc

REMOTE_DRIVER=gitlab
REMOTE_CONFIG=http://gitlab.domain.tld?client_id=[client]&client_secret=[secret]
```

```sh
docker run -d \
  -h drone \
  -v /var/lib/drone:/var/lib/drone \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --env-file /etc/drone/dronerc \
  -p 80:8000 \
  --name drone \
  drone/drone:0.4.2
``` -->

<!-- # Drone Cache

```sh
docker run -d \
  --env DRONE_REPO=[group/repo] \
  --env DRONE_REPO_BRANCH=develop \
  --env DRONE_COMMIT_BRANCH=develop \

  --env PLUGIN_MOUNT=/drone/bundle \
  --env PLUGIN_RESTORE=false \
  --env PLUGIN_REBUILD=true \

  --env SFTP_CACHE_SERVER=[hostname]:22 \
  --env SFTP_CACHE_PATH=/cache \
  --env SFTP_CACHE_USERNAME=[username] \
  --env SFTP_CACHE_PASSWORD=[password] \
  plugins/sftp-cache
``` -->
