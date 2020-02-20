# Docker Swarm

## CLI

### Installation

#### Homebrew

```sh
brew install docker-swarm
```

### Commands

```sh
docker swarm --help
```

### Configuration

#### Network

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

#### Manager

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

#### Worker

```sh
docker-machine create \
  $(echo $DOCKER_MACHINE_CREATE_OPTS) \
  --virtualbox-cpu-count 1 \
  --virtualbox-disk-size 20000 \
  --virtualbox-hostonly-cidr '10.100.1.1/24' \
  --virtualbox-memory 2048 \
  worker1
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
```

#### Init and Join

```sh
# List
docker-machine ls

# Init Swarm
docker-machine ssh manager1 'docker swarm init --advertise-addr 10.100.1.100'

# Join Swarm
docker-machine ssh worker1 'docker swarm join --token <token> 10.100.1.100:2377'

# List Nodes
docker-machine ssh manager1 'docker node ls'

# Environment
eval "$(docker-machine env manager1)"
```

#### Leave

```sh
docker-machine ssh manager1 'docker swarm leave -f'
docker-machine ssh worker1 'docker swarm leave'
```
