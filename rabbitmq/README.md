# RabbitMQ

<!--
https://linkedin.com/learning/learning-rabbitmq/connect-your-services-with-asynchronous-messaging-2

https://app.pluralsight.com/library/courses/rabbitmq-by-example/table-of-contents
https://app.pluralsight.com/library/courses/masstransit-rabbitmq-scaling-microservices/table-of-contents

https://www.rabbitmq.com/management-cli.html
https://www.rabbitmq.com/cli.html
https://www.rabbitmq.com/plugins.html
https://www.rabbitmq.com/prometheus.html
https://www.rabbitmq.com/installing-plugins.html
https://github.com/search?q=%22kind%3A+RabbitmqCluster%22+%22rabbitmq_peer_discovery_k8s%22&type=Code
https://github.com/bitnami/charts/tree/master/bitnami/rabbitmq
-->

## Links

- [Plugins](https://www.rabbitmq.com/plugins.html)

## References

- [Advanced Message Queuing Protocol (AMQP)](/amqp.md)

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
