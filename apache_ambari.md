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
