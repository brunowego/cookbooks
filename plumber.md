# Plumber

**Keywords:** Messaging System Tool

## Links

- [Code Repository](https://github.com/batchcorp/plumber)

## Supported Messaging Systems

- ActiveMQ (STOMP protocol)
- Amazon Kinesis Streams (NEW)
- Amazon SNS (Publishing)
- Amazon SQS
- Apache Pulsar
- Azure Event Hub
- Azure Service Bus
- Google Cloud Platform PubSub
- Kafka
- KubeMQ
- MongoDB CDC (Change Data Capture)
- MQTT
- NATS
- NATS Streaming (Jetstream)
- NSQ
- Postgres CDC (Change Data Capture)
- RabbitMQ
- RabbitMQ Streams
- Redis-PubSub
- Redis-Streams

## CLI

### Installation

#### Homebrew

```sh
brew tap batchcorp/public
brew install plumber
```

### Commands

```sh
plumber --help
```

### Usage

```sh
#
plumber write kafka --topics test --input foo

#
plumber read kafka --topics test
```
