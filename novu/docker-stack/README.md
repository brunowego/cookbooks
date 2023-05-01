# Docker Stack

## Running

```sh
#
git clone --depth 1 https://github.com/novuhq/novu && cd ./novu/docker

#
cp ./.env.example ./local/deployment/.env

#
docker-compose -f ./local/development/docker-compose.redis-cluster.yml up

#
docker-compose -f ./local/development/docker-compose.redis-cluster.yml down
```
