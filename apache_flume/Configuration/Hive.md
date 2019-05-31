# Hive

## Sink

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#hive-sink)

### Required

```conf
<Agent>.sinks.<Sink>.channel = <Channel>

<Agent>.sinks.<Sink>.type = hive
<Agent>.sinks.<Sink>.hive.metastore = thrift://127.0.0.1:9083
<Agent>.sinks.<Sink>.hive.database = [db-name]
<Agent>.sinks.<Sink>.hive.table = [table-name]
```
