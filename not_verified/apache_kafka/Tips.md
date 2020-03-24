# Tips

## Sync via Netcat

### Producer

```sh
nc -k -l 42000 | \
  kafkacat \
    -Pb [hostname]:9092 \
    -t [topic] \
    -K :
```

### Consumer

```sh
kafkacat \
  -Cb [hostname]:9092 \
  -t [topic] \
  -K : \
  -u \
  -q | \
    nc 127.0.0.1 42000
```

## Improve Memory

```sh
export KAFKA_HEAP_OPTS='-Xms256m -Xmx2g'
```
