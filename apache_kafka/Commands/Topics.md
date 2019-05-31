# Topics

## List

```sh
kafka-topics --zookeeper [hostname]:2181 --list
```

## Describe

```sh
kafka-topics --zookeeper [hostname]:2181 --describe
```

### Topic

```sh
kafka-topics --zookeeper [hostname]:2181 --describe --topic [name]
```

### Overrides

```sh
kafka-topics --zookeeper [hostname]:2181 --describe --topics-with-overrides
```

## Create

```sh
kafka-topics --zookeeper [hostname]:2181 \
 --create \
 --topic [name] \
 --partitions 1 \
 --replication-factor 1 \
 --if-not-exists
```

### Config

```sh
kafka-topics --zookeeper [hostname]:2181 \
 --create \
 --topic [name] \
 --partitions 6 \
 --replication-factor 1 \
 --if-not-exists \
 --config cleanup.policy=delete \
 --config delete.retention.ms=60000
```

## Alter

```sh
kafka-topics --zookeeper [hostname]:2181 \
  --alter \
  --config retention.ms=600000 \
  --topic [name]
```

## Delete

```sh
kafka-topics --zookeeper [hostname]:2181 --delete --topic [name]
```
