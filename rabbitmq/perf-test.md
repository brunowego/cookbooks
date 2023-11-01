# RabbitMQ Performance Testing Tool (perf-test)

## Links

- [Code Repository](https://github.com/rabbitmq/rabbitmq-perf-test)
- [Main Website](https://rabbitmq.com/java-tools.html)

## Guides

- [RabbitMQ PerfTest](https://rabbitmq.github.io/rabbitmq-perf-test/stable/htmlsingle/)

## CLI

### Installation

#### Linux Binary

```sh
curl \
  -Lo /usr/local/bin/perf-test \
  'https://github.com/rabbitmq/rabbitmq-perf-test/releases/download/v2.15.0/perf-test_linux_x86_64' &&
    chmod +x /usr/local/bin/perf-test
```

### Commands

```sh
perf-test --help
```

### Usage

```sh
#
perf-test \
  -h amqp://127.0.0.1:5672 \
  -qp 'perf-test-%d' \
  -qpf 1 \
  -qpt 10 \
  -x 10 \
  -y 3 \
  -C 100 \
  -qa x-queue-type=quorum \
  -ad false \
  -f persistent
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h perf-test \
  -e RABBITMQ_PERF_TEST_LOGGERS='com.rabbitmq.perf=debug,com.rabbitmq.perf.Producer=debug' \
  --name perf-test \
  --network host \
  docker.io/pivotalrabbitmq/perf-test:latest --help
```

## Kubectl

### Running

```sh
#
export K8S_NAMESPACE='my-app'
```

```sh
#
kubectl run -it --rm \
  perf-test \
  --env 'RABBITMQ_PERF_TEST_LOGGERS=com.rabbitmq.perf=debug,com.rabbitmq.perf.Producer=debug' \
  --image docker.io/pivotalrabbitmq/perf-test:latest \
  -n "$K8S_NAMESPACE" \
    -- \
      -h amqp://admin:admin@rabbitmq-server-0.rabbitmq-nodes.my-app:5672 \
      -u my_app_q
```

#### Producer and Consumer

```sh
# Producer
kubectl run -it --rm \
  perf-test \
  --env 'RABBITMQ_PERF_TEST_LOGGERS=com.rabbitmq.perf=debug,com.rabbitmq.perf.Producer=debug' \
  --image docker.io/pivotalrabbitmq/perf-test:latest \
  -n "$K8S_NAMESPACE" \
    -- \
      -h amqp://admin:admin@rabbitmq-server-0.rabbitmq-nodes.my-app:5672 \
      -u my_app_q \
      -y 0

# Consumer
kubectl run -it --rm \
  perf-test \
  --env 'RABBITMQ_PERF_TEST_LOGGERS=com.rabbitmq.perf=debug,com.rabbitmq.perf.Producer=debug' \
  --image docker.io/pivotalrabbitmq/perf-test:latest \
  -n "$K8S_NAMESPACE" \
    -- \
      -h amqp://admin:admin@rabbitmq-server-0.rabbitmq-nodes.my-app:5672 \
      -u my_app_q \
      -x 0
```

```sh
#
kubectl run -it --rm \
  perf-test \
  --env 'RABBITMQ_PERF_TEST_LOGGERS=com.rabbitmq.perf=debug,com.rabbitmq.perf.Producer=debug' \
  --image docker.io/pivotalrabbitmq/perf-test:latest \
  -n "$K8S_NAMESPACE" \
    -- \
      -h amqp://admin:admin@rabbitmq-server-0.rabbitmq-nodes.my-app:5672 \
      -u my_app4_q \
      -x 200 \
      -C 10 \
      -y 0
```

### Issues

#### Access Refused

```log
Main thread caught exception: com.rabbitmq.client.AuthenticationFailureException: ACCESS_REFUSED - Login was refused using authentication mechanism PLAIN. For details see the broker logfile.
```

Missing username and password (ex. `amqp://admin:admin@127.0.0.1`)
