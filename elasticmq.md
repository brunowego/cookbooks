# ElasticMQ

<!--
https://github.com/zoellner/offline-sqs-bug/blob/master/sqs-default-queues.conf
https://github.com/andrewcavetester/intergov/blob/master/tests/local_elasticmq.conf
-->

## References

- [Amazon SQS](/amazon-sqs.md)

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
  -h elasticmq \
  -p 9324:9324 \
  --name elasticmq \
  --network workbench \
  docker.io/softwaremill/elasticmq:0.15.7
```

```sh
docker exec -i elasticmq /bin/sh << EOSHELL
cat << EOF > /opt/elasticmq.conf
include classpath("application.conf")

rest-sqs {
    enabled = true
    bind-port = 9324
    bind-hostname = "0.0.0.0"
    sqs-limits = strict
}

queues {
    test_queue {
        defaultVisibilityTimeout = 3 seconds
        delay = 1 seconds
        receiveMessageWait = 1 seconds
    }
}

EOF
EOSHELL
```

```sh
docker restart elasticmq
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9324'
```

### Remove

```sh
docker rm -f elasticmq
```

### Tips

#### TCP State

```sh
nmap -p 9324 [hostname]
```
