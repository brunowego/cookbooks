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
curl https://archive.apache.org/dist/kafka/2.1.0/kafka_2.11-2.1.0.tgz | sudo tar -xzC /opt
sudo ln -s /opt/kafka_2.11-2.1.0 /opt/kafka
```

## Environment

```sh
sudo tee /etc/profile.d/kafka.sh << 'EOF'
export KAFKA_HOME="/opt/kafka"
export PATH="$KAFKA_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```
