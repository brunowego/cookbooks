# Channels

## Types

### Memory

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#memory-channel)

#### Required

```conf
<Agent>.channels.<Channel>.type = memory
```

### File

- [User Guide](https://flume.apache.org/FlumeUserGuide.html#file-channel)

#### Required

```sh
sudo install -dm 775 -o flume -g flume /var/flume
```

```conf
<Agent>.channels.<Channel>.type = file
<Agent>.channels.<Channel>.checkpointDir = /var/flume/checkpoint
<Agent>.channels.<Channel>.dataDirs = /var/flume/data
```

### Kafka

TODO
