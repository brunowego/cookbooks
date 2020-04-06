# Hadoop Distributed File System (HDFS)

## Environment

```sh
sudo useradd -g hadoop -Mrs /bin/false hdfs
```

```sh
sudo install -dm 775 -o hdfs -g hadoop /var/log/hadoop
```

```sh
sudo sed -i 's|^# export HADOOP_LOG_DIR=.*|export HADOOP_LOG_DIR=/var/log/hadoop|g' /opt/hadoop/etc/hadoop/hadoop-env.sh
```

```sh
sudo sed -i "s|^# export JAVA_HOME=|export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))|g" /opt/hadoop/etc/hadoop/hadoop-env.sh
```

## Configuration

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'fs.defaultFS' /opt/hadoop/etc/hadoop/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v 'hdfs://127.0.0.1:8020' /opt/hadoop/etc/hadoop/core-site.xml
```

```sh
sudo install -dm 775 -o hdfs -g hadoop /var/data/hadoop
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'dfs.namenode.name.dir' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v 'file:///var/data/hadoop/dfs/name' /opt/hadoop/etc/hadoop/hdfs-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'dfs.namenode.checkpoint.dir' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'file:///var/data/hadoop/dfs/namesecondary' /opt/hadoop/etc/hadoop/hdfs-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'dfs.datanode.data.dir' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'file:///var/data/hadoop/dfs/data' /opt/hadoop/etc/hadoop/hdfs-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'dfs.permissions.superusergroup' /opt/hadoop/etc/hadoop/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'hadoop' /opt/hadoop/etc/hadoop/hdfs-site.xml
```

```sh
sudo -u hdfs -g hadoop /opt/hadoop/bin/hdfs namenode -format
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
ExecStart=/opt/hadoop/bin/hdfs --daemon start namenode
ExecStop=/opt/hadoop/bin/hdfs --daemon stop namenode
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
ExecStart=/opt/hadoop/bin/hdfs --daemon start datanode
ExecStop=/opt/hadoop/bin/hdfs --daemon stop datanode
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
ExecStart=/opt/hadoop/bin/hdfs --daemon start secondarynamenode
ExecStop=/opt/hadoop/bin/hdfs --daemon stop secondarynamenode
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
