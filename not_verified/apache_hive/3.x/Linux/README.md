# Linux

## Dependencies

1. Hadoop
2. HBase
3. PostgreSQL or MySQL

### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-7-jre
```

### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk
```

## Installation

```sh
curl https://archive.apache.org/dist/hive/hive-3.1.1/apache-hive-3.1.1-bin.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/apache-hive-3.1.1-bin /opt/apache-hive
```

## Environment

```sh
sudo tee /etc/profile.d/hive.sh << 'EOF'
export HIVE_HOME="/opt/apache-hive"
export PATH="$HIVE_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin hive
```

```sh
sudo usermod -aG hive "$USER" && sudo su - "$USER"
```
