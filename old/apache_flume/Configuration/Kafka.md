# Kafka

## Source

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#kafka-source)

### Required

```conf
<Agent1>.sources.<Source1>.channels = <Channel1>

<Agent1>.sources.<Source1>.type = org.apache.flume.source.kafka.KafkaSource
<Agent1>.sources.<Source1>.kafka.bootstrap.servers = [hostname]:9092
<Agent1>.sources.<Source1>.kafka.topics = [name]
```

## Sink

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#kafka-sink)

### Required

```conf
<Agent1>.sinks.<Sink1>.type = org.apache.flume.sink.kafka.KafkaSink
<Agent1>.sinks.<Sink1>.kafka.bootstrap.servers = [hostname]:9092
```
