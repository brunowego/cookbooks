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

## APK

```sh
sudo apk update
sudo apk add curl bash openjdk8-jre
```

## Installation

```sh
sudo mkdir /usr/local/hadoop && cd "$_"
```

```sh
curl https://archive.apache.org/dist/hadoop/common/hadoop-2.9.2/hadoop-2.9.2.tar.gz | sudo tar -xz --strip-components 1
```

## Environment

```sh
sudo tee /etc/profile.d/hadoop.sh << 'EOF'
export HADOOP_HOME="/usr/local/hadoop"
export HADOOP_CONF_DIR="/etc/hadoop"
export PATH="$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo ln -s ${HADOOP_HOME}${HADOOP_CONF_DIR} $HADOOP_CONF_DIR
```

```sh
sudo groupadd hadoop
```

```sh
sudo usermod -aG hadoop "$USER" && sudo su - "$USER"
```
