# RabbitMQ

<!--
https://linkedin.com/learning/learning-rabbitmq/connect-your-services-with-asynchronous-messaging-2

https://app.pluralsight.com/library/courses/rabbitmq-by-example/table-of-contents
https://app.pluralsight.com/library/courses/masstransit-rabbitmq-scaling-microservices/table-of-contents
-->

## References

- [Advanced Message Queuing Protocol (AMQP)]()

## CLI

### Installation

#### Homebrew

```sh
brew install rabbitmq
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# RabbitMQ
export RABBITMQ_HOME='/usr/local/opt/rabbitmq' # Homebrew
export PATH="$RABBITMQ_HOME/sbin:$PATH"
```

```sh
sudo su - "$USER"
```

### Service

```sh
# Homebrew
brew services start rabbitmq
```

### Commands

<!-- rabbitmq-defaults
rabbitmq-env
rabbitmq-server -->

```sh
rabbitmq-queues help
rabbitmq-upgrade help
rabbitmqctl help
rabbitmq-diagnostics help
rabbitmq-plugins help
rabbitmqadmin -h
```

### Usage

```sh
#
rabbitmq-plugins enable rabbitmq_management
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rabbitmq \
  -v rabbitmq-data:/var/lib/rabbitmq \
  -e RABBITMQ_DEFAULT_USER='admin' \
  -e RABBITMQ_DEFAULT_PASS='admin' \
  -p 5672:5672 \
  --name rabbitmq \
  --network workbench \
  docker.io/library/rabbitmq:3.8.2-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:5672'
```

```sh
# Management
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rabbitmq \
  -v rabbitmq-data:/var/lib/rabbitmq \
  -e RABBITMQ_DEFAULT_USER='admin' \
  -e RABBITMQ_DEFAULT_PASS='admin' \
  -p 5672:5672 \
  -p 15672:15672 \
  --name rabbitmq \
  --network workbench \
  docker.io/library/rabbitmq:3.8.2-management-alpine
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:15672'
```

| Login | Password |
| --- | --- |
| guest | guest |
| `admin` | `admin` |

### Remove

```sh
docker rm -f rabbitmq
```
