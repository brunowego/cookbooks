# Linux

## Installation

```sh
git clone --branch v1.0.0rc5 --single-branch --depth 1 https://github.com/confluentinc/confluent-kafka-python.git
( cd confluent-kafka-python && C_INCLUDE_PATH=/usr/local/librdkafka/include LIBRARY_PATH=/usr/local/librdkafka/lib python setup.py build )
```

```sh
pip install -U confluent-kafka-python/ && rm -r confluent-kafka-python
```
