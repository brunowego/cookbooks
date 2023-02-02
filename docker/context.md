# Docker Context

## References

- [Protect the Docker daemon socket](https://docs.docker.com/engine/security/protect-access/)

## Dependencies

**_Run on remote_**

```sh
docker version
```

## Commands

```sh
docker context --help
```

## Usage

| Target Environment | Context Name | API Endpoint                  |
| ------------------ | ------------ | ----------------------------- |
| Local Host         | `default`    | `unix:///var/run/docker.sock` |
| Remote Host        | `remote`     | `ssh://user@remotemachine`    |
| Docker-in-Docker   | `dind`       | `tcp://127.0.0.1:2375`        |

```sh
# List
docker context ls

# Create Context
docker context create \
  --docker 'host=ssh://[username]@[ip-address]' \
  --kubernetes config-file="$HOME/.kube/config" \
  --description 'My Remote Docker Engine' \
  [my-remote]

docker context export [my-remote] --kubeconfig

# Use
docker context use default
docker context use [my-remote]

# or, using environment variable
export DOCKER_HOST='ssh://[username]@[hostname]'

# Info
docker info

# Remove
docker context rm [my-remote]
```

## Issues

### SSH Connection Issue

```log
error during connect: Get "http://docker/v1.24/containers/json": command [ssh -l [username] -- [hostname] docker system dial-stdio] has exited with exit status 255, please make sure the URL is valid, and Docker 18.09 or later is installed on the remote host: stderr=Cannot execute command-line and remote command.
```

```sh
ssh -l [username] -- [hostname] docker system dial-stdio
```

Remove `RemoteCommand zsh -l` and `RequestTTY force` from `~/.ssh/config`.
