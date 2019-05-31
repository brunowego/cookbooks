# Linux

## Installation

### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-7-jre
```

### YUM

```sh
sudo yum check-update
sudo yum -y install curl java-1.8.0-openjdk
```

## Installation

```sh
curl https://archive.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz | sudo tar -xzC /opt
sudo ln -s /opt/zeppelin-0.8.1-bin-all /opt/zeppelin
```

## Environment

```sh
sudo tee /etc/profile.d/zeppelin.sh << 'EOF'
export ZEPPELIN_HOME="/opt/zeppelin"
export PATH="$ZEPPELIN_HOME/bin:$PATH"
EOF
```

```sh
sudo su - $USER
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin zeppelin
```

```sh
sudo usermod -aG zeppelin $USER && sudo su - $USER
```
