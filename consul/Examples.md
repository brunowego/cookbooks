# Examples

## Docker

```sh
consul members -http-addr=$(docker-machine ip):8500
```

## Validate

```sh
consul validate -quiet /etc/consul.d
```

## Agent

```sh
consul agent -dev
```

```sh
consul agent \
  -bind=$(ip route get 1 | awk '{print $NF;exit}') \
  -client=0.0.0.0 \
  -data-dir=/tmp/consul \
  -server \
  -ui
```

## Leave

```sh
consul force-leave
```

## Members

```sh
consul members
```
