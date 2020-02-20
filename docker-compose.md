# Docker Compose

## CLI

### Installation

#### Darwin

```sh
curl \
  -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-Darwin-x86_64" \
  -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose
```

#### Linux

```sh
sudo curl \
  -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-Linux-x86_64" \
  -o /usr/local/bin/docker-compose && \
    sudo chmod +x /usr/local/bin/docker-compose
```

#### Chocolatey

```sh
choco install -y docker-compose
```

### Commands

```sh
docker-compose help
```

### Scaffold

```yaml
# Docker Compose Version
version: '3.7'

# Template
x-shared: &shared
  build:
    context: ./services/acme

# Services
services:
  acme:
    # <<: *shared
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
    restart: always
    depends_on:
      - anything

# Volumes
volumes:
  acme-data:
    driver: local

## External
volumes:
  acme-log:
    name: acme-log
    external: true

# Network

## External
networks:
  workbench:
    name: workbench
    external: true
```

### Tips

#### Completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 docker-compose\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```
