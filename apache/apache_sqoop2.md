# Apache Sqoop 2

## CLI

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-7-jre
```

#### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk
```

### Installation

```sh
curl https://archive.apache.org/dist/sqoop/1.99.7/sqoop-1.99.7-bin-hadoop200.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/sqoop-1.99.7-bin-hadoop200 /opt/sqoop
```

### Environment

```sh
sudo tee /etc/profile.d/sqoop.sh << 'EOF'
export SQOOP_HOME="/opt/sqoop"
export PATH="$SQOOP_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

### Commands

```sh
sqoop help
```

### Configuration

```sh
sudo useradd -Mrs /sbin/nologin sqoop
```

```sh
sudo usermod -aG sqoop "$USER" && sudo su - "$USER"
```

#### Hadoop

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'hadoop.proxyuser.sqoop2.hosts' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v '*' ${HADOOP_CONF_DIR}/core-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'hadoop.proxyuser.sqoop2.groups' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v '*' ${HADOOP_CONF_DIR}/core-site.xml
```

```sh
sed -i '/^allowed.system.users/ s/##.*/sqoop2/g' ${HADOOP_CONF_DIR}/container-executor.cfg
```

### Usage

#### Job

```sh
# List
sqoop job --list

# Show
sqoop job --show myjob

# Execute
sqoop job --exec myjob

#
sqoop job --create myjob \
  -- import \
  --connect jdbc:mysql://localhost/db \
  --username root \
  --table employee \
  --m 1
```

#### Server

```sh
# Start
sqoop2-server start

# Stop
sqoop2-server stop
```

#### Shell

```sh
sqoop2-shell
```

#### Tool

```sh
# Upgrade
sqoop2-tool upgrade

# Verify
sqoop2-tool verify
```

### Verify

You should be able to list a HDFS for example:

```sh
hadoop dfs -ls
```

### Logs

```sh
tail -f /opt/sqoop/@LOGDIR@/sqoop.log
```

```sh
tail -f /opt/sqoop/@LOGDIR@/audit.log
```
