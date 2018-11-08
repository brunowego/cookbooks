# Cluster

## Create

```sh
docker-machine create -d virtualbox vm1
docker-machine create -d virtualbox vm2
```

## List

```sh
docker-machine ls
```

## Init Swarm

```sh
docker-machine ssh vm1 "docker swarm init --advertise-addr 192.168.99.100"
```

## Join Swarm

```sh
docker-machine ssh vm2 "docker swarm join --token <token> 192.168.99.100:2377"
```

## List Nodes

```sh
docker-machine ssh vm1 "docker node ls"
```
