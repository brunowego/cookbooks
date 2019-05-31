# Kafka

## Source

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#kafka-source)

### Required

```conf
<Agent>.sources.<Source>.channels = <Channel1> <Channel2>

<Agent>.sources.<Source>.type = org.apache.flume.source.kafka.KafkaSource
<Agent>.sources.<Source>.kafka.bootstrap.servers = [hostname]:9092
<Agent>.sources.<Source>.kafka.topics = [name]
```

## Sink

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#kafka-sink)

### Required

```conf
<Agent>.sinks.<Sink>.type = org.apache.flume.sink.kafka.KafkaSink
<Agent>.sinks.<Sink>.kafka.bootstrap.servers = [hostname]:9092
```
