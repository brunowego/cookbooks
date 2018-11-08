# Amazon Web Services

## Create

```sh
docker-machine create \
  --driver amazonec2 \
  --amazonec2-access-key '[token]' \
  --amazonec2-instance-type 't2.medium' \
  --amazonec2-region 'us-east-1' \
  [name]
```
