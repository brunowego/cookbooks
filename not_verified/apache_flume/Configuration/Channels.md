# Channels

## Types

### Memory

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#memory-channel)

#### Required

```conf
<Agent1>.channels.<Channel1>.type = memory
```

### File

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#file-channel)

#### Required

```sh
sudo install -dm 775 -o flume -g flume /var/flume
```

```conf
<Agent1>.channels.<Channel1>.type = file
<Agent1>.channels.<Channel1>.checkpointDir = /var/flume/checkpoint
<Agent1>.channels.<Channel1>.dataDirs = /var/flume/data
```

### Kafka

TODO
