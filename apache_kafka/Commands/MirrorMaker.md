# MirrorMaker

## Running

```sh
kafka-mirror-maker \
 --consumer.config /opt/kafka/config/consumer.properties \
 --producer.config /opt/kafka/config/producer.properties \
 --num.streams [integer] \
 --whitelist [topic]
```

## Groups

```sh
kafka-consumer-groups \
 --bootstrap-server [hostname]:9092
 --describe
 --group [name]
```

## Checker

```sh
kafka-consumer-offset-checker \
 --group KafkaMirror \
 --zkconnect [hostname]:2181 \
 --topic [name]
```
