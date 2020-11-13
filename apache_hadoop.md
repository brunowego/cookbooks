# Apache Hadoop

<!--
https://www.linkedin.com/learning/learning-hadoop-2/introducing-hadoop-cluster-components
-->

## References

- [Amazon Hadoop Instances](https://www.shodan.io/search?query=port%3A%2250070%22+org%3A%22amazon.com%22)

<!--
docker exec -i flume /bin/sh << EOSHELL
wget \
  -O /opt/flume/lib/hadoop-hdfs-2.7.4.jar \
  https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-hdfs/2.7.4/hadoop-hdfs-2.7.4.jar
EOSHELL
-->

<!--
https://www.jowanza.com/blog/which-hadoop-file-format-should-i-use
-->

## Helm

### Install

```sh
kubectl create namespace hadoop
```

```sh
helm install stable/hadoop \
  -n hadoop \
  --namespace hadoop \
  --set hdfs.webhdfs.enabled=true \
  --set persistence.nameNode.enabled=true \
  --set persistence.nameNode.storageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}') \
  --set persistence.nameNode.size=5Gi \
  --set persistence.dataNode.enabled=true \
  --set persistence.dataNode.storageClass=$(kubectl get storageclass -o jsonpath='{.items[0].metadata.name}') \
  --set persistence.dataNode.size=20Gi

  # concatenate with this to calc resources
  $(curl https://raw.githubusercontent.com/helm/charts/master/stable/hadoop/tools/calc_resources.sh | /bin/bash -s -- 50)
```

```sh
helm status hadoop
```

### Delete

```sh
helm delete hadoop --purge
kubectl delete namespace hadoop --grace-period=0 --force
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
export HADOOP_ENV_FILE=$(base64 <(cat << \EOF
HDFS_CONF_dfs_namenode_datanode_registration_ip___hostname___check=false

CORE_CONF_fs_defaultFS=hdfs://hadoop-dfs-namenode:8020
CORE_CONF_hadoop_http_staticuser_user=root
CORE_CONF_hadoop_proxyuser_hue_hosts=*
CORE_CONF_hadoop_proxyuser_hue_groups=*

HDFS_CONF_dfs_webhdfs_enabled=true
HDFS_CONF_dfs_permissions_enabled=false

YARN_CONF_yarn_log___aggregation___enable=true
YARN_CONF_yarn_resourcemanager_recovery_enabled=true
YARN_CONF_yarn_resourcemanager_store_class=org.apache.hadoop.yarn.server.resourcemanager.recovery.FileSystemRMStateStore
YARN_CONF_yarn_resourcemanager_fs_state___store_uri=/rmstate
YARN_CONF_yarn_nodemanager_remote___app___log___dir=/app-logs
YARN_CONF_yarn_log_server_url=http://hadoop-dfs-historyserver:8188/applicationhistory/logs/
YARN_CONF_yarn_timeline___service_enabled=true
YARN_CONF_yarn_timeline___service_generic___application___history_enabled=true
YARN_CONF_yarn_resourcemanager_system___metrics___publisher_enabled=true
YARN_CONF_yarn_resourcemanager_hostname=hadoop-dfs-resourcemanager
YARN_CONF_yarn_timeline___service_hostname=hadoop-dfs-historyserver
YARN_CONF_yarn_resourcemanager_address=hadoop-dfs-resourcemanager:8032
YARN_CONF_yarn_resourcemanager_scheduler_address=hadoop-dfs-resourcemanager:8030
YARN_CONF_yarn_resourcemanager_resource__tracker_address=hadoop-dfs-resourcemanager:8031
EOF
))
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h namenode \
  --env-file <(echo $HADOOP_ENV_FILE | base64 --decode) \
  -e CLUSTER_NAME='test' \
  -v hadoop-dfs-namenode:/hadoop/dfs/name \
  -p 50070:50070 \
  --name hadoop-dfs-namenode \
  --network workbench \
  docker.io/bde2020/hadoop-namenode:2.0.0-hadoop2.7.4-java8
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h datanode \
  --env-file <(echo $HADOOP_ENV_FILE | base64 --decode) \
  -e SERVICE_PRECONDITION='hadoop-dfs-namenode:50070' \
  -v hadoop-dfs-datanode:/hadoop/dfs/data \
  --name hadoop-dfs-datanode \
  --network workbench \
  docker.io/bde2020/hadoop-datanode:2.0.0-hadoop2.7.4-java8
```

<!-- ```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h resourcemanager \
  --env-file <(echo $HADOOP_ENV_FILE | base64 --decode) \
  -e SERVICE_PRECONDITION='hadoop-dfs-namenode:50070 hadoop-dfs-datanode:50075 hadoop-dfs-historyserver:8188' \
  --name hadoop-dfs-resourcemanager \
  --network workbench \
  docker.io/bde2020/hadoop-resourcemanager:2.0.0-hadoop2.7.4-java8
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h historyserver \
  --env-file <(echo $HADOOP_ENV_FILE | base64 --decode) \
  -e SERVICE_PRECONDITION='hadoop-dfs-namenode:50070 hadoop-dfs-datanode:50075 hadoop-dfs-resourcemanager:8088' \
  -v hadoop-dfs-historyserver:/hadoop/yarn/timeline \
  --name hadoop-dfs-historyserver \
  --network workbench \
  docker.io/bde2020/hadoop-historyserver:2.0.0-hadoop2.7.4-java8
``` -->

> Wait! This process take a while.

```sh
docker logs -f hadoop-dfs-namenode | sed '/Starting Web-server for hdfs/ q'
```

```sh
# Open
echo -e '[INFO]\thttp://127.0.0.1:50070'
```

### Test

Use [HdfsCLI](/hdfscli.md) to test.

### State

```sh
#
docker stop \
  hadoop-dfs-namenode \
  hadoop-dfs-datanode \
  hadoop-dfs-resourcemanager \
  hadoop-dfs-historyserver

#
docker start \
  hadoop-dfs-namenode \
  hadoop-dfs-datanode \
  hadoop-dfs-resourcemanager \
  hadoop-dfs-historyserver
```

### Remove

```sh
docker rm -f \
  hadoop-dfs-namenode \
  hadoop-dfs-datanode \
  hadoop-dfs-resourcemanager \
  hadoop-dfs-historyserver

docker volume rm \
  hadoop-dfs-namenode \
  hadoop-dfs-datanode \
  hadoop-dfs-historyserver
```
