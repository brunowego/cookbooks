# Gomu

## Links

- [Code Repository](https://github.com/asim/go-micro/tree/master/cmd/gomu)

## CLI

### Installation

#### go get

```sh
go install github.com/asim/go-micro/cmd/gomu@latest
```

### Commands

```sh
gomu -h
```

### Usage

```sh
#
gomu new service <name>
gomu new service --jaeger <name>
gomu new service --skaffold <name>

#
gomu services

#
gomu describe service --format=yaml <name>

#
gomu stream

#
gomu new function helloworld

#
gomu new client <name>

#
make proto tidy

#
gomu run

#
gomu generate skaffold

#
gomu call <name> <Name>.Call '{"name": "John"}'

#
gomu stream server <name> <Name>.ServerStream '{"count": 10}'

#
gomu stream bidi <name> <Name>.BidiStream '{"stroke": 1}' '{"stroke": 2}' '{"stroke": 3}'
```
