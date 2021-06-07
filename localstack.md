# LocalStack

<!--
https://app.getcommandeer.com/download

https://www.youtube.com/watch?v=2IUrUkH4mvQ
-->

## Links

- [Code Repository](https://github.com/localstack/localstack)
- [Main Website](https://localstack.cloud/)

## CLI

### Dependencies

- [Docker CE (Daemon)](/docker/docker-ce.md#daemon)

### Installation

#### Homebrew

```sh
brew install localstack
```

### Commands

```sh
localstack -h
```

### Usage

```sh
#
localstack start
```

<!--
serverless
cognito
dynamodb
iam
kinesis
rds
s3
sts
-->

```sh
#
DEBUG=1 \
SERVICES=serverless,cognito,rds \
  localstack start

#
localstack status
```

```sh
http :4566
http :4566/health
```

```sh
#
aws configure # temp

#
aws \
  --endpoint-url http://localhost:4566 \
  s3 mb s3://mostly-code-local-bucket

#
aws \
  --endpoint-url http://localhost:4566 \
  s3 ls

#
aws \
  --endpoint-url http://localhost:4566 \
  dynamodb list-tables
```
