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
curl https://archive.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/apache-flume-1.9.0-bin /opt/apache-flume
```

## Environment

```sh
sudo tee /etc/profile.d/flume.sh << 'EOF'
export FLUME_HOME="/opt/apache-flume"
export PATH="$FLUME_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin flume
```

```sh
sudo usermod -aG flume "$USER" && sudo su - "$USER"
```
