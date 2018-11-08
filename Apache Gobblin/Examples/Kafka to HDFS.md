# Kafka to HDFS

## Configuration

```sh
sudo -u gobblin tee /etc/gobblin/kafka-hdfs.pull << EOF
job.name=PullTextFromKafka2HDFS
job.group=Kafka
job.description=Pull text data from Kafka to HDFS.
job.description=This is a job that runs forever, copies an input Kafka topic to an output HDFS.
job.lock.enabled=true

kafka.brokers=[hostname]:9092

source.class=org.apache.gobblin.source.extractor.extract.kafka.UniversalKafkaSource
gobblin.source.kafka.extractorType=DESERIALIZER
kafka.deserializer.type=BYTE_ARRAY
extract.namespace=org.apache.gobblin.extract.kafka

topic.whitelist=[topic]

writer.builder.class=org.apache.gobblin.writer.SimpleDataWriterBuilder
writer.file.path.type=tablename
writer.output.format=txt

mr.job.max.mappers=1

metrics.reporting.file.enabled=true
metrics.reporting.file.suffix=txt

bootstrap.with.offset=latest
EOF
```
