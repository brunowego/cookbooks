# Master

## Assign Static IP Addresses

```sh
ip a
```

## Adjust Hosts File

```sh
sudo tee -a /etc/hosts << EOF
192.168.1.101	kafka1
192.168.1.102	kafka2
192.168.1.103	kafka3
EOF
```

## Create Firewall Rules

### ZooKeeper

```sh
sudo tee /etc/firewalld/services/zooKeeper.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<service>
	<short>ZooKeeper</short>
	<description>Firewall rule for ZooKeeper ports</description>
	<port protocol="tcp" port="2888"/>
	<port protocol="tcp" port="3888"/>
	<port protocol="tcp" port="2181"/>
</service>
EOF
```

### Kafka

```sh
sudo tee /etc/firewalld/services/kafka.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<service>
	<short>Kafka</short>
	<description>Firewall rule for Kafka port</description>
	<port protocol="tcp" port="9092"/>
</service>
EOF
```

### Activate New Rules

```sh
sudo systemctl restart firewalld
```

```sh
sudo firewall-cmd --permanent --add-service=zooKeeper
sudo firewall-cmd --permanent --add-service=kafka
```

```sh
sudo systemctl restart firewalld
```

```sh
sudo firewall-cmd --list-services
```

## Create Kafka User

```sh
sudo adduser kafka
sudo passwd kafka
```

```sh
su kafka
```

## Install ZooKeeper and Kafka

```sh
wget https://apache.forsale.plus/kafka/1.0.0/kafka_2.11-1.0.0.tgz
tar -xzf kafka_2.11-1.0.0.tgz
```

### Create Directories

```sh
mkdir -p /home/kafka/zookeeper/data
mkdir -p /home/kafka/kafka/kafka-logs
```

## ZooKeeper Configuration

```sh
vim kafka_2.11-1.0.0/config/zookeeper.properties
```

```properties
dataDir=/home/kafka/zookeeper/data

server.1=kafka1:2888:3888
server.2=kafka2:2888:3888
server.3=kafka3:2888:3888

initLimit=5
syncLimit=2
```

```sh
echo "1" > /home/kafka/zookeeper/data/myid
```

<!-- https://progressive-code.com/post/19/Setup-a-single-Apache-Kafka-node-on-CentOS-7 -->
<!-- https://progressive-code.com/post/17/Setup-a-Kafka-cluster-with-3-nodes-on-CentOS-7 -->
