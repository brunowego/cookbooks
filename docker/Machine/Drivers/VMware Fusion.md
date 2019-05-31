# VMware Fusion

## Create

```sh
docker-machine create \
  --driver vmwarefusion \
  --vmwarefusion-cpu-count 4 \
  --vmwarefusion-disk-size 40000 \
  --vmwarefusion-memory-size 8192 \
  [name]
```

## Issues

### Error creating machine

> Error in driver during machine creation: exit status 255

```sh
docker-machine regenerate-certs default -f
```
