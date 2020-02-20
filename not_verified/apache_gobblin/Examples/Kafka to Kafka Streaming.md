# Kafka to Kafka Streaming

## Dependencies

```sh
( cd /opt/gobblin/lib && sudo curl -O https://repo1.maven.org/maven2/org/apache/gobblin/gobblin-kafka-09/0.14.0/gobblin-kafka-09-0.14.0.jar )
( cd /opt/gobblin/lib && sudo curl -O http://central.maven.org/maven2/org/apache/kafka/kafka-clients/0.9.0.1/kafka-clients-0.9.0.1.jar )
( cd /opt/gobblin/lib && sudo curl -O https://repo1.maven.org/maven2/org/apache/kafka/kafka_2.11/0.9.0.1/kafka_2.11-0.9.0.1.jar )
```

## Configuration

```sh
tee /etc/gobblin/streaming-kafka-kafka.pull << EOF
job.name=PullKafka2KafkaStreaming
job.group=Kafka
job.description=This is a job that runs forever, copies an input Kafka topic to an output Kafka topic.
job.lock.enabled=false

task.executionMode=STREAMING
task.data.root.dir=${job.work.dir}/task-data

kafka.brokers=[hostname]:9092

gobblin.streaming.kafka.topic.key.deserializer=org.apache.kafka.common.serialization.StringDeserializer
gobblin.streaming.kafka.topic.value.deserializer=org.apache.kafka.common.serialization.ByteArrayDeserializer
gobblin.streaming.kafka.consumerConfig.partition.assignment.strategy=org.apache.kafka.clients.consumer.RangeAssignor
gobblin.streaming.kafka.topic.singleton=[topic]

source.class=org.apache.gobblin.source.extractor.extract.kafka.KafkaSimpleStreamingSource

converter.classes=org.apache.gobblin.converter.SamplingConverter
converter.sample.ratio=0.10

writer.builder.class=org.apache.gobblin.kafka.writer.KafkaDataWriterBuilder
writer.kafka.topic=[topic]
writer.kafka.producerConfig.bootstrap.servers=[hostname]:9092
writer.kafka.producerConfig.value.serializer=org.apache.kafka.common.serialization.ByteArraySerializer

data.publisher.type=org.apache.gobblin.publisher.NoopPublisher
EOF
```
