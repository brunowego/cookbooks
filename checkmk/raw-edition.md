# Checkmk Raw Edition

## Links

- [Main Website](https://checkmk.com/product/raw-edition)

## Docker

### Running

```sh
docker container run \
  -dit \
  -p 8080:5000 \
  -p 8000:8000 \
  --tmpfs /opt/omd/sites/cmk/tmp:uid=1000,gid=1000 \
  -v checkmk-sites:/omd/sites \
  --name checkmk \
  -v /etc/localtime:/etc/localtime:ro \
  --restart always \
  docker.io/checkmk/check-mk-free:2.1.0p18

#
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

| Login      | Password                              |
| ---------- | ------------------------------------- |
| `cmkadmin` | `$(docker container logs -f checkmk)` |
