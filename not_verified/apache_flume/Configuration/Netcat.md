# Netcat

## Source

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#netcat-tcp-source)

```conf
<Agent1>.sources.<Source1>.channels = <Channel1>

<Agent1>.sources.<Source1>.type = netcat
<Agent1>.sources.<Source1>.bind = 127.0.0.1
<Agent1>.sources.<Source1>.port = 44444
```

## Test

```sh
nc 127.0.0.1 44444
```
