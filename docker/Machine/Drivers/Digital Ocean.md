# Digital Ocean

## Create

```sh
docker-machine create \
  --driver digitalocean \
  --digitalocean-access-token '[token]' \
  --digitalocean-image centos-7-x64 \
  --digitalocean-region 'sfo2' \
  --digitalocean-size 's-4vcpu-8gb' \
  [name]
```
