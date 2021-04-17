# Admin

## Pre-flight

```sh
sudo install -dm 775 -o gobblin -g gobblin /var/log/gobblin
```

```sh
export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
export GOBBLIN_FWDIR=/opt/gobblin
export GOBBLIN_LOG_DIR=/var/log/gobblin
```

## Jobs

```sh
/opt/gobblin/bin/gobblin-admin.sh jobs -l
```
