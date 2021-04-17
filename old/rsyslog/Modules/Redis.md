# Redis

## Dependencies

### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install hiredis-devel
```

### APT

```sh
sudo apt update
sudo apt -y install libhiredis-dev
```

## Installation

Add to `./configure` the flag `--enable-omhiredis`

## Configuration

```sh
sudo vim /etc/rsyslog.d/00-omhiredis.conf
```

### Mode template

```conf
module(load="omhiredis")

template(
  name="simple_count"
  type="string"
  string="HINCRBY testcount %programname% 1"
)

*.* action(
  name="count_redis"
  type="omhiredis"
  mode="template"
  template="simple_count"
)
```

### Mode queue

```conf
module(load="omhiredis")

*.* action(
  name="push_redis"
  type="omhiredis"
  mode="queue"
  key="testqueue"
)
```

### Mode publish

```conf
module(load="omhiredis")

*.* action(
  name="publish_redis"
  type="omhiredis"
  mode="publish"
  key="testpublish"
)
```
