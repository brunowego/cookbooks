# Docker

## Running

```sh
docker run -d \
  -h netdata \
  -p 19999:19999 \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  --name netdata \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  --restart always \
  netdata/netdata:v1.13.0
```

## Remove

```sh
docker rm -f netdata
```
