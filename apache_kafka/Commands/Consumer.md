# Consumer

## Topic

```sh
kafka-console-consumer --bootstrap-server [hostname]:9092 --topic [name] --from-beginning
```

## Groups

### List

```sh
kafka-consumer-groups --bootstrap-server [hostname]:9092 --list
```

### Describe

```sh
kafka-consumer-groups --bootstrap-server [hostname]:9092 --describe --group [name]
```

### Reset offset

```sh
kafka-consumer-groups --bootstrap-server [hostname]:9092 --reset-offsets --group [name]
```

### Delete

```sh
kafka-consumer-groups --bootstrap-server [hostname]:9092 --delete --group [name]
```
