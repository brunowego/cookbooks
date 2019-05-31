# Netcat

## Source

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#netcat-tcp-source)

```conf
<Agent>.sources.<Source>.channels = <Channel1> <Channel2>

<Agent>.sources.<Source>.type = netcat
<Agent>.sources.<Source>.bind = 127.0.0.1
<Agent>.sources.<Source>.port = 44444
```

## Test

```sh
nc 127.0.0.1 44444
```
