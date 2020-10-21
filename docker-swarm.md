# Docker Swarm

## CLI

### Dependencies

- [Oracle VM VirtualBox](/virtualbox.md)
- [Docker Machine](/docker-machine.md)
- [Docker Stack](/docker-stack.md)

### Installation

#### Homebrew

```sh
brew install docker-swarm
```

### Commands

```sh
docker swarm --help
```

## Cluster Provision

### Network

```sh
# Prevent if exists
docker network rm docker_gwbridge

# Create
docker network create \
  --subnet '10.11.0.0/16' \
  --opt com.docker.network.bridge.name=docker_gwbridge \
  --opt com.docker.network.bridge.enable_ip_masquerade=true \
  --opt com.docker.network.bridge.enable_icc=false \
  docker_gwbridge
```

### Manager

```sh
docker-machine create \
  $(echo $DOCKER_MACHINE_CREATE_OPTS) \
  --virtualbox-cpu-count 1 \
  --virtualbox-disk-size 20000 \
  --virtualbox-hostonly-cidr '10.100.1.1/24' \
  --virtualbox-memory 2048 \
  manager1
```

```sh
docker-machine ssh manager1 << EOF
docker network create \
  --subnet '10.11.0.0/16' \
  --opt com.docker.network.bridge.name=docker_gwbridge \
  --opt com.docker.network.bridge.enable_ip_masquerade=true \
  --opt com.docker.network.bridge.enable_icc=false \
  docker_gwbridge
EOF
```

### Worker

```sh
docker-machine create \
  $(echo $DOCKER_MACHINE_CREATE_OPTS) \
  --virtualbox-cpu-count 2 \
  --virtualbox-disk-size 20000 \
  --virtualbox-hostonly-cidr '10.100.1.1/24' \
  --virtualbox-memory 4096 \
  worker1

docker-machine create \
  $(echo $DOCKER_MACHINE_CREATE_OPTS) \
  --virtualbox-cpu-count 2 \
  --virtualbox-disk-size 20000 \
  --virtualbox-hostonly-cidr '10.100.1.1/24' \
  --virtualbox-memory 4096 \
  worker2
```

```sh
docker-machine ssh worker1 << EOF
docker network create \
  --subnet '10.11.0.0/16' \
  --opt com.docker.network.bridge.name=docker_gwbridge \
  --opt com.docker.network.bridge.enable_ip_masquerade=true \
  --opt com.docker.network.bridge.enable_icc=false \
  docker_gwbridge
EOF

docker-machine ssh worker2 << EOF
docker network create \
  --subnet '10.11.0.0/16' \
  --opt com.docker.network.bridge.name=docker_gwbridge \
  --opt com.docker.network.bridge.enable_ip_masquerade=true \
  --opt com.docker.network.bridge.enable_icc=false \
  docker_gwbridge
EOF
```

### Init and Join

```sh
# List
docker-machine ls

# Init Swarm
docker-machine ssh manager1 "docker swarm init --advertise-addr $(docker-machine ip manager1)"

export DOCKER_SWARM_TOKEN=''

# Join Swarm
docker-machine ssh worker1 "docker swarm join --token $DOCKER_SWARM_TOKEN $(docker-machine ip manager1):2377"
docker-machine ssh worker2 "docker swarm join --token $DOCKER_SWARM_TOKEN $(docker-machine ip manager1):2377"

# List Nodes
docker-machine ssh manager1 'docker node ls'

# Environment
eval "$(docker-machine env manager1)"
```

### Leave

```sh
docker-machine ssh manager1 'docker swarm leave -f'
docker-machine ssh worker1 'docker swarm leave'
docker-machine ssh worker2 'docker swarm leave'
```

### State

```sh
docker-machine stop $(docker-machine ls --format '{{.Name}}')

docker-machine start $(docker-machine ls --format '{{.Name}}')

docker-machine ls
```

### Remove

```sh
docker-machine rm -y $(docker-machine ls --format '{{.Name}}')
```
