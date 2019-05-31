# Examples

##

```sh
kapacitor -url http://[hostname]:9092 [command]
```

## Stats

```sh
kapacitor stats general
```

```sh
kapacitor stats ingress
```

## Define

```sh
kapacitor define [name] -type batch -tick [script] -dbrp telegraf.autogen
```

```sh
kapacitor define [task-name] -type stream -tick [task-name].tick -dbrp telegraf.autogen
```

## Enable

```sh
kapacitor enable [name]
```

## List

```sh
kapacitor list tasks
```

## Show

```sh
kapacitor show [task-name]
```

## Delete

```sh
kapacitor delete tasks [task-name]
```
