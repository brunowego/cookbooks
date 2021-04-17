# Kafka

## Dependencies

### Linux

Need build from source `librdkafka`.

## Installation

Add to `./configure` the flag `--enable-omkafka`

## Configuration

```sh
sudo vim /etc/rsyslog.d/00-omkafka.conf
```

```conf
module(load="omkafka")

*.* action(
  type="omkafka"
  broker="[hostname]:9092"
  topic="[name]"
  confParam="compression.codec=snappy"
)
```

```conf
module(load="imuxsock")
module(load="imfile")
module(load="omkafka")

template(name="kafkamsg" type="string" string="%msg%")

ruleset(name="nkafka") {
  action(
    type="omkafka"
    topic="nginx-access"
    broker="[hostname]:9092"
    template="kafkamsg"
  )
  stop
}

input(
  type="imfile"
  ruleset="nkafka"
  File="/var/log/nginx/access.log"
  Tag="nginx-access"
)
```
