# Examples

## Init

```sh
docker swarm init --advertise-addr '10.100.1.1/24'
```

## Join

```sh
docker swarm join \
  --advertise-addr '10.100.1.1/24' \
  --token [token] \
  [manager_ip]:2377
```

## Leave

```sh
docker swarm leave
```
