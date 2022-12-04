# sangrenel

<!--
https://lenses.io/blog/2020/10/the-importance-of-load-testing-kafka/
https://medium.com/selectstarfromweb/lets-load-test-kafka-f90b71758afb
https://medium.com/metrosystemsro/apache-kafka-how-to-test-performance-for-clients-configured-with-ssl-encryption-3356d3a0d52b
https://blog.clairvoyantsoft.com/benchmarking-kafka-e7b7c289257d
-->

## Links

- [Code Repository](https://github.com/jamiealquiza/sangrenel)

## Guides

- [Load Testing Apache Kafka on AWS](https://grey-boundary.io/load-testing-apache-kafka-on-aws/)

## CLI

### Dependencies

- [Apache Kafka](/apache/kafka.md)

### Installation

#### go get

```sh
go get -u github.com/jamiealquiza/sangrenel
```

### Commands

```sh
sangrenel --help
```

### Usage

```sh
#
sangrenel \
  -brokers '127.0.0.1:9092' \
  -topic 'example'

#
sangrenel \
  -brokers '127.0.0.1:9092' \
  -noop \
  -topic 'example'

#
sangrenel \
  -brokers '127.0.0.1:9092' \
  -compression 'snappy' \
  -message-batch-size 500 \
  -message-size 300 \
  -topic 'example' \
  -workers 1 \
  -writers-per-worker 5
```

### Issues

#### Miss Connection to Brokers

```log
2021/05/31 15:43:35 kafka: client has run out of available brokers to talk to (Is your cluster reachable?)
```

TODO
