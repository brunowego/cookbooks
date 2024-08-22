# Docker Compose

## CLI

**Note:** Prefer to install using [asdf-docker-compose](/asdf/docker-compose.md).

### Dependencies

- [Docker CE Daemon](/docker/ce/daemon.md)

### Installation

```sh
# Darwin
curl \
  -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-Darwin-x86_64" \
  -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Linux
sudo curl \
  -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-Linux-x86_64" \
  -o /usr/local/bin/docker compose && \
    sudo chmod +x /usr/local/bin/docker-compose
```

<!--
brew install docker-compose
-->

#### Chocolatey

```sh
choco install -y docker-compose
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Docker Compose
export COMPOSE_DOCKER_CLI_BUILD=0
```

```sh
sudo su - "$USER"
```

### Commands

```sh
docker compose help
```

### Usage

```sh
#
docker compose config
```

### Tips

#### Command-line completion

```sh
# Using Antigen
antigen bundle docker-compose

# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 docker-compose\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

### Issues

#### Absolute Path

```log
ERROR: for my-app_php_1  Cannot create container for service php: invalid volume specification: '/host_mnt/Volumes/Workspace/github.com/my-org/my-app:.:rw': invalid mount config for type "bind": invalid mount path: '.' mount path must be absolute
```

Never use `./` at target bind volume.

## Scaffold

### Manifest

```yml
---
x-shared: &shared
  build:
    context: ./services/acme
    # args:
    #   GIT_TOKEN:

services:
  acme:
    <<: *shared
    image: docker.io/library/acme:latest
    container_name: as-acme
    hostname: acme
    volumes:
      - type: volume
        source: acme-data
        target: /path/to/data
      - type: volume
        source: acme-log
        target: /path/to/log
      - type: bind
        source: ./services/acme/conf.d
        target: /path/to/conf.d
    env_file: ./services/acme/.env
    environment:
      no_proxy: localhost,127.0.0.1
    # command: tail -f /dev/null
    ports:
      - target: 8080
        published: 8080
        protocol: tcp
    networks:
      - workbench
    restart: unless-stopped # always
    depends_on:
      - anything

volumes:
  acme-data:
    driver: local
  acme-log:
    name: acme-log
    external: true

networks:
  workbench:
    name: workbench
    external: true
```

### Makefile

```sh
#
echo 'COMPOSE_PROJECT_NAME=my-project' >> ./.env
echo 'DOCKER_NETWORK_SUBNET=10.1.1.0/24' >> ./.env
echo 'DOCKER_NETWORK_SUBNET=10.1.1.0/24' >> ./.example.env
echo '/.env' >> ./.gitignore

#
cat << EOF > ./Makefile
SHELL := /bin/sh

-include ./.env
-include ./mk.d/compose.mk
EOF

#
mkdir -p ./mk.d

#
cat << \EOF > ./mk.d/compose.mk
SHELL := /bin/sh

DOCKER ?= docker
DOCKER_COMPOSE ?= docker-compose

.DEFAULT_GOAL := compose/status

.PHONY: compose/init
compose/init: compose/nuke compose/up

.PHONY: compose/up
compose/up:
	@$(DOCKER) network create --subnet=${DOCKER_NETWORK_SUBNET} workbench || true
	@$(DOCKER) volume create --name=xxx-acme-log || true
	@$(DOCKER_COMPOSE) up -d --build $(service)

.PHONY: compose/start
compose/start:
	@$(DOCKER_COMPOSE) start $(service)

.PHONY: compose/stop
compose/stop:
	@$(DOCKER_COMPOSE) stop $(service)

.PHONY: compose/restart
compose/restart:
	@$(DOCKER_COMPOSE) restart $(service)

.PHONY: compose/down
compose/down:
	@$(DOCKER_COMPOSE) down
	@$(DOCKER) volume rm xxx-acme-log || true
	@$(DOCKER) network rm workbench || true

.PHONY: compose/kill
compose/kill:
	@$(DOCKER_COMPOSE) kill $(service)

.PHONY: compose/nuke
compose/nuke:
	@$(DOCKER_COMPOSE) rm --force --stop $(service)

.PHONY: compose/status
compose/status:
	@$(DOCKER_COMPOSE) ps $(service)
EOF

#
cat << EOF >> ./.editorconfig

[{*.mk,Makefile}]
indent_size = 4
indent_style = tab
EOF
```
