# Kafka to Kafka Simple

## Configuration

```sh
tee /etc/gobblin/simple-kafka-kafka.pull << EOF
job.name=PullKafka2KafkaSimple
job.group=Kafka
job.description=This is a job that runs forever, copies an input Kafka topic to an output Kafka topic.
job.lock.enabled=true

kafka.brokers=[hostname]:9092

source.class=org.apache.gobblin.source.extractor.extract.kafka.UniversalKafkaSource
gobblin.source.kafka.extractorType=DESERIALIZER
kafka.deserializer.type=BYTE_ARRAY
extract.namespace=org.apache.gobblin.extract.kafka

bootstrap.with.offset=latest
topic.whitelist=[topic]

writer.builder.class=org.apache.gobblin.kafka.writer.KafkaDataWriterBuilder
writer.kafka.topic=[topic]
writer.kafka.producerConfig.bootstrap.servers=[hostname]:9092
writer.kafka.producerConfig.value.serializer=org.apache.kafka.common.serialization.ByteArraySerializer
writer.output.format=TEXT

data.publisher.type=org.apache.gobblin.publisher.NoopPublisher
EOF
```
