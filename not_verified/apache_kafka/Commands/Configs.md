# Configs

## Describe

```sh
kafka-configs --zookeeper [hostname]:2181 \
  --describe \
  --entity-type topics
```

## Add

```sh
kafka-configs --zookeeper [hostname]:2181 \
  --alter \
  --add-config retention.ms=600000 \
  --entity-type topics \
  --entity-name [name]
```

## Delete

```sh
kafka-configs --zookeeper [hostname]:2181 \
  --alter \
  --delete-config retention.ms \
  --entity-type topics
  --entity-name [name]
```
