# Commands

## Metadata list

```sh
kafkacat -L -b [hostname]:9092
```

### Specific topic

```sh
kafkacat -L -b [hostname]:9092 -t [topic]
```

## Produce

```sh
kafkacat -P -b [hostname]:9092 -t [topic]
```

## Consume

```sh
kafkacat -C -b [hostname]:9092 -t [topic]
```

## Consume group

```sh
kafkacat -b [hostname]:9092 -G [group] [topic] [topic]
```

## Query mode

```sh
kafkacat -Q -b [hostname]:9092 -t [topic]:[partition]:[timestamp]
```
