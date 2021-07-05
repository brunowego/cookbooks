# RabbitMQ

**Keywords:** Message-Based System

<!--
https://linkedin.com/learning/learning-rabbitmq/connect-your-services-with-asynchronous-messaging-2

https://app.pluralsight.com/library/courses/rabbitmq-by-example/table-of-contents
https://app.pluralsight.com/library/courses/masstransit-rabbitmq-scaling-microservices/table-of-contents

https://rabbitmq.com/management-cli.html
https://rabbitmq.com/cli.html
https://rabbitmq.com/installing-plugins.html
https://github.com/search?q=%22kind%3A+RabbitmqCluster%22+%22rabbitmq_peer_discovery_k8s%22&type=Code
https://github.com/bitnami/charts/tree/master/bitnami/rabbitmq
-->

## Alternatives

- [Apache ActiveMQ](/apache/apache-activemq.md)
- [AWS SQS](/aws/aws-sqs.md)
- Azure Service Bus

## Glossary

- Remote Procedure Call (RPC)
- Advanced Message Queuing Protocol (AMQP)
- Message Queuing Telemetry Transport (MQTT)
- Simple Text Oriented Message Protocol (STOMP)

## Links

- [Main Website](https://rabbitmq.com)
- [Plugins](https://rabbitmq.com/plugins.html)
- [Grafana Dashboards](https://grafana.com/orgs/rabbitmq)

## Guides

- [Notify me when RabbitMQ has a problem](https://blog.rabbitmq.com/posts/2021/05/alerting/)
- [Configuration](https://rabbitmq.com/configure.html)
- [Monitoring](https://rabbitmq.com/monitoring.html)
- [Monitoring with Prometheus & Grafana](https://rabbitmq.com/prometheus.html)
- [Troubleshooting Network Connectivity](https://rabbitmq.com/troubleshooting-networking.html)
- [Clustering Guide](https://rabbitmq.com/clustering.html)

## Solution

### Protocols in RabbitMQ

- [AMQP](/amqp.md)
- [MQTT](/mqtt.md)
- STOMP

## CLI

### Installation

#### Homebrew

```sh
brew install rabbitmq
```

#### Chocolatey

```sh
choco install rabbitmq
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

**Homebrew**

```sh
# RabbitMQ
export RABBITMQ_HOME='/usr/local/opt/rabbitmq'
export PATH="$RABBITMQ_HOME/sbin:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
rabbitmq-queues help
rabbitmq-upgrade help
rabbitmqctl help
rabbitmq-diagnostics help
rabbitmq-plugins help
rabbitmqadmin -h
```

<!--
rabbitmq-defaults
rabbitmq-env
-->

### Usage

```sh
#
export RABBITMQ_NODE_IP_ADDRESS='localhost'
export RABBITMQ_NODE_PORT='4369'
export RABBITMQ_NODENAME="rabbit@${RABBITMQ_NODE_IP_ADDRESS}"

#
rabbitmqctl cluster_status

#
rabbitmq-plugins \
  -q list \
  --enabled \
  --minimal

#
rabbitmq-diagnostics -q alarms

#
rabbitmq-diagnostics -q memory_breakdown \
  --unit 'MB'

#
rabbitmq-diagnostics -q listeners

#
rabbitmq-diagnostics -q ping
rabbitmq-diagnostics -q status
rabbitmq-diagnostics -q check_running
rabbitmq-diagnostics -q check_local_alarms
rabbitmq-diagnostics -q check_port_connectivity
rabbitmq-diagnostics -q check_virtual_hosts
rabbitmq-diagnostics -q node_health_check
```

### Tips

#### User Management

```sh
#
rabbitmqctl add_user \
  -- 'guest' 'guest'

#
rabbitmqctl set_user_tags \
  'guest' 'guest'

#
rabbitmqctl set_permissions \
  -p / \
  'guest' \
  '.*' \
  '.*' \
  '.*'

#
rabbitmqctl delete_user 'guest'
```

<!-- #### REST API

```sh
curl \
  -su 'guest:guest' \
  -X GET 'http://127.0.0.1:15672/api/nodes/rabbit@hostname/memory' | \
    jq

curl \
  -su 'guest:guest' \
  -X GET 'http://127.0.0.1:15672/api/nodes/rabbit@hostname/memory' | \
    jq '.memory.total.allocated'
``` -->
