# Examples

##

```sh
export ETCDCTL_API=3
```

```sh
etcdctl member list
etcdctl put foo bar
etcdctl get foo
```

##

```sh
etcdctl set /hello world
```

```sh
curl -L -X PUT http://0.0.0.0:2379/v2/keys/hello -d value='world'
```

```sh
curl -L http://0.0.0.0:2379/v2/keys/hello
```

```sh
etcdctl set /hello world
```
