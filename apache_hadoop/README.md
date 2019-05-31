# Apache Hadoop

- [MapReduce](https://en.wikipedia.org/wiki/MapReduce)
- [HDFS](https://en.wikipedia.org/wiki/Apache_Hadoop#HDFS)
- [YARN](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html)

## User Interface

### HDFS

- [NameNode](http://[namenode]:9870)
- [DataNode](http://[datanode]:9864)
- [Secondary NameNode](http://[secondary-namenode]:9868)

### YARN

- [ResourceManager](http://[resource-manager]:8088)
- [NodeManager](http://[node-manager]:8042)
- [Timeline Server](http://[timeline-server]:8188)

## Deprecated Ports

- NameNode
  - 8020 → 9820
  - 50070 → 9870
  - 50470 → 9871
- DataNode
  - 50010 → 9866
  - 50020 → 9867
  - 50075 → 9864
  - 50475 → 9865
- Secondary NameNode
  - 50090 → 9868
  - 50091 → 9869
