# Docker Context

## References

- [Protect the Docker daemon socket](https://docs.docker.com/engine/security/protect-access/)

## Dependencies

***Run on remote***

```sh
docker version
```

## Commands

```sh
docker context --help
```

## Configuration

```sh
#
docker context ls

#
docker context create \
  --docker 'host=ssh://[username]@[hostname]' \
  --description 'Remote Docker engine' \
  [my-remote-docker-engine]

#
docker context use [my-remote-engine]

# or, using environment variable
export DOCKER_HOST='ssh://[username]@[hostname]'

#
docker info
```

## Usage

```sh
# List
docker context ls

# Use
docker context use default

# Info
docker info

# Remove
docker context rm [my-remote-engine]
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
