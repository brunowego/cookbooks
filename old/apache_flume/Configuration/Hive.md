# Hive

## Sink

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#hive-sink)

### Required

```conf
<Agent1>.sinks.<Sink1>.channel = <Channel1>

<Agent1>.sinks.<Sink1>.type = hive
<Agent1>.sinks.<Sink1>.hive.metastore = thrift://127.0.0.1:9083
<Agent1>.sinks.<Sink1>.hive.database = [db-name]
<Agent1>.sinks.<Sink1>.hive.table = [table-name]
```
