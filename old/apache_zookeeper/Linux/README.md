# Linux

## Dependencies

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
curl https://archive.apache.org/dist/zookeeper/zookeeper-3.4.13/zookeeper-3.4.13.tar.gz | sudo tar -xzC /opt --no-same-owner --no-same-permissions
sudo ln -s /opt/zookeeper-3.4.13 /opt/zookeeper
```

## Environment

```sh
sudo tee /etc/profile.d/zookeeper.sh << 'EOF'
export ZOOKEEPER_HOME="/opt/zookeeper"
export PATH="$ZOOKEEPER_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```
