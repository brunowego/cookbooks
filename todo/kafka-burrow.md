# Kafka Burrow

<!--
https://github.com/linkedin/Burrow
-->

TODO

<!--
## Producer
  producer:
    image: tarosaiba/kafka-train-producer
    ports:
      - "1323:1323"
    environment:
      KAFKA_BROKER: "kafka:9092"
      KAFKA_TOPIC: "test_topic"
    depends_on:
      - "kafka-topic-ui"


## Consumer
  consumer:
    image: tarosaiba/kafka-train-consumer
    environment:
      KAFKA_BROKER: "kafka:9092"
      KAFKA_TOPIC: "test_topic"
    depends_on:
      - "kafka-topic-ui"


# Management

## Kafka burrow
  kafka-burrow:
    image: tarosaiba/kafka-burrow:latest
    ports:
      - "8888:8000"
    restart: always
    environment:
      KAFKA_SERVER: kafka:9092
      ZOOKEEPER_SERVER: zookeeper:2181
    depends_on:
      - "kafka"
      - "zookeeper" -->
