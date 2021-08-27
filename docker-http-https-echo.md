# docker-http-https-echo

## Links

- [Code Repository](https://github.com/mendhak/docker-http-https-echo)
- [Main Website](https://code.mendhak.com/docker-http-https-echo/)

## Running

```sh
docker run -t --rm \
  -p 8080:8080 \
  -p 8443:8443 \
  --name http-https-echo \
  docker.io/mendhak/http-https-echo:18
```
