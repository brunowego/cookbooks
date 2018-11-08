# Settings

## Global

```conf
reporting-disabled = false
```

```conf
bind-address = "0.0.0.0:8088"
```

## Metastore

```conf
[meta]
  dir = "/var/lib/influxdb/meta"
  retention-autocreate = true
  logging-enabled = true
```

## Data

```conf
[data]
  dir = "/var/lib/influxdb/data"
  index-version = "inmem"
  wal-dir = "/var/lib/influxdb/wal"
  wal-fsync-delay = "0s"
  trace-logging-enabled = false
  query-log-enabled = true
  cache-max-memory-size = 1073741824
  cache-snapshot-memory-size = 26214400
  cache-snapshot-write-cold-duration = "10m0s"
  compact-full-write-cold-duration = "4h0m0s"
  max-concurrent-compactions = 0
  max-series-per-database = 1000000
  max-values-per-tag = 100000
```

## Query management

```conf
[coordinator]
  write-timeout = "10s"
  max-concurrent-queries = 0
  query-timeout = "0s"
  log-queries-after = "0s"
  max-select-point = 0
  max-select-series = 0
  max-select-buckets = 0
```

## Retention Policy

```conf
[retention]
  enabled = true
  check-interval = "30m0s"
```

## Shard precreation

```conf
[shard-precreation]
  enabled = true
  check-interval = "10m0s"
  advance-period = "30m0s"
```

## Monitoring

```conf
[monitor]
  store-enabled = true
  store-database = "_internal"
  store-interval = "10s"
```

## HTTP endpoint

```conf
[http]
  enabled = true
  bind-address = "0.0.0.0:8086"
  auth-enabled = false
  realm = "InfluxDB"
  log-enabled = true
  write-tracing = false
  pprof-enabled = true
  https-enabled = false
  https-certificate = "/etc/ssl/influxdb.pem"
  https-private-key = ""
  shared-secret = ""
  max-row-limit = 0
  max-connection-limit = 0
  unix-socket-enabled = false
  bind-socket = "/var/run/influxdb.sock"
  max-body-size = 25000000
```

## Subscription

```conf
[subscriber]
  enabled = true
  http-timeout = "30s"
  insecure-skip-verify = false
  ca-certs = ""
  write-concurrency = 40
  write-buffer-size = 1000
```

## Graphite

```conf
[[graphite]]
  enabled = false
  bind-address = ":2003"
  database = "graphite"
  retention-policy = ""
  protocol = "tcp"
  batch-size = 5000
  batch-pending = 10
  batch-timeout = "1s"
  consistency-level = "one"
  separator = "."
  udp-read-buffer = 0
```

## CollectD

```conf
[[collectd]]
  enabled = false
  bind-address = ":25826"
  database = "collectd"
  retention-policy = ""
  batch-size = 5000
  batch-pending = 10
  batch-timeout = "10s"
  read-buffer = 0
  typesdb = "/usr/share/collectd/types.db"
  security-level = "none"
  auth-file = "/etc/collectd/auth_file"
  parse-multivalue-plugin = "split"
```

## OpenTSDB

```conf
[[opentsdb]]
  enabled = false
  bind-address = ":4242"
  database = "opentsdb"
  retention-policy = ""
  consistency-level = "one"
  tls-enabled = false
  certificate = "/etc/ssl/influxdb.pem"
  batch-size = 1000
  batch-pending = 5
  batch-timeout = "1s"
  log-point-errors = true
```

## UDP

```conf
[[udp]]
  enabled = false
  bind-address = ":8089"
  database = "udp"
  retention-policy = ""
  batch-size = 5000
  batch-pending = 10
  read-buffer = 0
  batch-timeout = "1s"
  precision = ""
```

## Continuous queries

```conf
[continuous_queries]
  log-enabled = true
  enabled = true
  query-stats-enabled = false
  run-interval = "1s"
```
