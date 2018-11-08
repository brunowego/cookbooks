# Hadoop Distributed File System (HDFS)

## Environment

```sh
sudo useradd -g hadoop -Mrs /sbin/nologin hdfs
```

```sh
sudo install -dm 775 -o hdfs -g hadoop /var/log/hadoop
```

```sh
sudo sed -i 's|^#export HADOOP_LOG_DIR=.*|export HADOOP_LOG_DIR=/var/log/hadoop|g' ${HADOOP_CONF_DIR}/hadoop-env.sh
```

```sh
sudo sed -i "/^export JAVA_HOME/s|\${JAVA_HOME}|$(dirname $(dirname $(readlink -f $(which java))))|g" ${HADOOP_CONF_DIR}/hadoop-env.sh
```

## Configuration

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'fs.defaultFS' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v "hdfs://$(hostname -f):8020" ${HADOOP_CONF_DIR}/core-site.xml
```

```sh
sudo install -dm 775 -o hdfs -g hadoop //hadoop
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'dfs.namenode.name.dir' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v 'file:///var/data/hadoop/dfs/name' ${HADOOP_CONF_DIR}/hdfs-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'dfs.namenode.checkpoint.dir' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'file:///var/data/hadoop/dfs/namesecondary' ${HADOOP_CONF_DIR}/hdfs-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'dfs.datanode.data.dir' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'file:///var/data/hadoop/dfs/data' ${HADOOP_CONF_DIR}/hdfs-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'dfs.permissions.superusergroup' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'hadoop' ${HADOOP_CONF_DIR}/hdfs-site.xml
```

```sh
sudo -u hdfs -g hadoop ${HADOOP_HOME}/bin/hdfs namenode -format
```

## Service

### NameNode

```sh
sudo tee /usr/lib/systemd/system/hdfs-namenode.service << EOF
[Unit]
Description=Hadoop NameNode
After=network.target

[Service]
Type=forking
User=hdfs
Group=hadoop
ExecStart=${HADOOP_HOME}/sbin/hadoop-daemon.sh --script hdfs start namenode
ExecStop=${HADOOP_HOME}/sbin/hadoop-daemon.sh --script hdfs stop namenode
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=default.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hdfs-namenode
```

#### Test

```sh
hdfs dfs -mkdir -p /user/$USER
```

#### Logs

```sh
tail -f /var/log/hadoop/hadoop-hdfs-namenode-*.log
```

```sh
tail -f /var/log/hadoop/hadoop-hdfs-namenode-*.out
```

### DataNode

```sh
sudo tee /usr/lib/systemd/system/hdfs-datanode.service << EOF
[Unit]
Description=Hadoop DataNode
Wants=hdfs-namenode.service
After=network.target

[Service]
Type=forking
User=hdfs
Group=hadoop
ExecStart=${HADOOP_HOME}/sbin/hadoop-daemon.sh --script hdfs start datanode
ExecStop=${HADOOP_HOME}/sbin/hadoop-daemon.sh --script hdfs stop datanode
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=default.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hdfs-datanode
```

#### Logs

```sh
tail -f /var/log/hadoop/hadoop-hdfs-datanode-*.log
```

```sh
tail -f /var/log/hadoop/hadoop-hdfs-datanode-*.out
```

### Secondary NameNode

```sh
sudo tee /usr/lib/systemd/system/hdfs-secondarynamenode.service << EOF
[Unit]
Description=Hadoop Secondary NameNode
After=network.target

[Service]
Type=forking
User=hdfs
Group=hadoop
ExecStart=${HADOOP_HOME}/sbin/hadoop-daemon.sh --script hdfs start secondarynamenode
ExecStop=${HADOOP_HOME}/sbin/hadoop-daemon.sh --script hdfs stop secondarynamenode
SuccessExitStatus=143
Restart=on-failure

[Install]
WantedBy=default.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now hdfs-secondarynamenode
```

#### Logs

```sh
tail -f /var/log/hadoop/hadoop-hdfs-secondarynamenode-*.log
```

```sh
tail -f /var/log/hadoop/hadoop-hdfs-secondarynamenode-*.out
```

## Logs

```sh
tail -f /var/log/hadoop/SecurityAuth-*.audit
```
