# HDFS

## Dependencies

```sh
sudo sed -ri 's|^#FLUME_CLASSPATH=""|FLUME_CLASSPATH="/opt/hadoop/share/hadoop/common/*:/opt/hadoop/share/hadoop/common/lib/*:/opt/hadoop/share/hadoop/hdfs/*:/opt/hadoop/share/hadoop/hdfs/lib/*"|g' /opt/apache-flume/conf/flume-env.sh
```

```sh
sudo usermod -aG hadoop flume
```

```sh
sudo -u flume `which hdfs` dfs -mkdir -p /user/flume
```

## Sink

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#hdfs-sink)

### Required

```conf
<Agent>.sinks.<Sink>.channel = <Channel>

<Agent>.sinks.<Sink>.type = hdfs
<Agent>.sinks.<Sink>.hdfs.path = hdfs://[hostname]:9000/user/flume/events/%Y/%m/%d
```
