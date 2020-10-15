# Apache Ambari

<!-- https://cwiki.apache.org/confluence/display/AMBARI/Installation+Guide+for+Ambari+2.7.4
https://github.com/TaylorZhou/TaylorZhou.github.io/blob/master/_posts/2019-01-29-%E4%BD%BF%E7%94%A8docker%E6%90%AD%E5%BB%BAambari%E8%BF%90%E8%A1%8C%E7%8E%AF%E5%A2%83.md
https://github.com/gaelfoppolo/self-service-data-analytics/blob/master/doc-admin/Ranger/ranger_install.md
-->

## Host

### Dependencies

- [Apache Maven Proxy](/apache_maven#proxy)

#### YUM

```sh
yum check-update
sudo yum -y install wget maven
```

### Installation

#### Linux

```sh
wget -O - 'http://www.apache.org/dist/ambari/ambari-2.7.4/apache-ambari-2.7.4-src.tar.gz' | tar -xz
cd apache-ambari-2.7.4-src
mvn versions:set -DnewVersion=2.7.4.0.0

pushd ambari-metrics
mvn versions:set -DnewVersion=2.7.4.0.0
popd

# Ubuntu
mvn -B clean install jdeb:jdeb \
  -DnewVersion=2.7.4.0.0 \
  -DbuildNumber=b730f30585dd67c10d3b841317100f17d4b2c5f1 \
  -DskipTests \
  -Dpython.ver='python >= 2.6'

# CentOS
mvn -B clean install rpm:rpm \
  -DnewVersion=2.7.4.0.0 \
  -DbuildNumber=b730f30585dd67c10d3b841317100f17d4b2c5f1 \
  -DskipTests \
  -Dpython.ver='python >= 2.6'
```

## Docker

<!-- 7180 -->

## REST API

```sh
export AMBARI_USERNAME=admin
export AMBARI_PASSWORD=admin
export AMBARI_HOST=localhost
export AMBARI_PORT=7180
```

### Cluster

```sh
#
curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters" | jq

#
export AMBARI_CLUSTER_NAME=$(curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters" | \
    jq '.items[0].Clusters.cluster_name' | tr -d '"')
```

### Component

```sh
AMBARI_COMPONENT_LIST=./ambari_component_list.json

cat /dev/null > "${AMBARI_COMPONENT_LIST}"
```

```sh
#
componentList=$(curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/components/" | \
    jq '.items[].ServiceComponentInfo.component_name' | tr -d '"')

#
for componentName in $componentList; do
  curl \
    -s \
    -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
    -H 'X-Requested-By: ambari' \
    -X GET \
    "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/components/${componentName}?fields=ServiceComponentInfo/state" | \
      tee -a ${AMBARI_COMPONENT_LIST}
done
```

### Service

```sh
AMBARI_SERVICE_LIST=./ambari_service_list.json
cat /dev/null > "${AMBARI_SERVICE_LIST}"
```

```sh
#
serviceList=$(curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/services/" | \
    jq '.items[].ServiceInfo.service_name' | tr -d '"')

#
for serviceName in $serviceList; do
  curl \
    -s \
    -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
    -H 'X-Requested-By: ambari' \
    -X GET \
    "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/services/${serviceName}?fields=ServiceInfo/state" | \
      tee -a ${AMBARI_SERVICE_LIST}
done
```

#### Ranger

```sh
curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/services/RANGER/components/RANGER_ADMIN" | jq
```

#### ZooKeeper

```sh
curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/services/ZOOKEEPER/components/ZOOKEEPER_SERVER" | jq
```

#### Knox

```sh
curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/services/KNOX/components/KNOX_GATEWAY" | jq
```

#### Hive

```sh
curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://${AMBARI_HOST}:${AMBARI_PORT}/api/v1/clusters/${AMBARI_CLUSTER_NAME}/services/HIVE/components/HIVE_SERVER" | jq
```

#### HBase

```sh
curl \
  -s \
  -u "${AMBARI_USERNAME}:${AMBARI_PASSWORD}" \
  -H 'X-Requested-By: ambari' \
  -X GET \
  "http://dxl1big00011.dispositivos.bb.com.br:7180/api/v1/clusters/BBDesenvolvimento/services/ZOOKEEPER/components/ZOOKEEPER_SERVER" | jq
```

## Library

### Installation

```sh
# As user dependency
pip install -U ambari

# As project dependency
echo 'ambari==0.1.7' >> ./requirements.txt
```

### REPL

```sh
export AMBARI_URL='http://localhost:8080'
export AMBARI_USERNAME='admin'
export AMBARI_PASSWORD='admin'
```

```py
>>> from ambari.client import Client
>>> import os
>>>
>>> client = Client(os.environ['AMBARI_URL'], username=os.environ['AMBARI_USERNAME'], passwd=os.environ['AMBARI_PASSWORD'])
>>>
>>> print('\n'.join([str(s.name) for s in client.cluster.services]))
>>>
>>> service = client.cluster.get_service('ZOOKEEPER')
>>> zkServer = service.get_component('ZOOKEEPER_SERVER')
>>> zkServer.info.get('host_components')
>>>
>>> print('\n'.join([str(h.status) for h in zkServer.host_components]))
>>> print('\n'.join([str(h.info) for h in zkServer.host_components]))
>>>
>>> exit()
```
