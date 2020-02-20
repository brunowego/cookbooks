# Darwin

## Installation

### Homebrew

```sh
brew install zookeeper kafka
```

## Service

### Homebrew

```sh
brew services start zookeeper
brew services start kafka
```

## Logs

```sh
tail -f /usr/local/var/log/kafka/kafka_output.log
```
