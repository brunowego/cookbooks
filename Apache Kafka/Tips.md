# Tips

## Sync via Netcat

### Producer

```sh
nc -k -l 42000 | kafkacat -b [hostname]:9092 -t [topic] -P -K :
```

### Consumer

```sh
kafkacat -b [hostname]:9092 -t [topic] -C -K : -u -q | nc 127.0.0.1 42000
```

## Improve Memory

```sh
export KAFKA_HEAP_OPTS="-Xms256m -Xmx2g"
```
