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
curl https://archive.apache.org/dist/hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz | sudo tar -xzC /opt --no-same-owner --no-same-permissions
sudo ln -s /opt/hadoop-3.1.1 /opt/hadoop
```

## Environment

```sh
sudo tee /etc/profile.d/hadoop.sh << 'EOF'
export HADOOP_HOME="/opt/hadoop"
export PATH="$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo groupadd hadoop
```

```sh
sudo usermod -aG hadoop "$USER" && sudo su - "$USER"
```
