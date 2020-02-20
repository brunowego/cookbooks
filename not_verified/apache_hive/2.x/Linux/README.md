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
sudo mkdir /usr/local/hive && cd "$_"
```

```sh
curl https://archive.apache.org/dist/hive/hive-2.3.4/apache-hive-2.3.4-bin.tar.gz | sudo tar -xz --strip-components 1
```

## Environment

```sh
sudo tee /etc/profile.d/hive.sh << 'EOF'
export HIVE_HOME="/usr/local/hive"
export HIVE_CONF_DIR="/etc/hive"
export PATH="$HIVE_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo ln -s ${HIVE_HOME}/conf $HIVE_CONF_DIR
```

```sh
sudo useradd -Mrs /sbin/nologin hive
```

```sh
sudo usermod -aG hive "$USER" && sudo su - "$USER"
```

```sh
sudo usermod -aG hadoop hive
```
