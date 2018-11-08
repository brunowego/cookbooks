# Linux

## Dependencies

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
curl https://archive.apache.org/dist/sqoop/1.99.7/sqoop-1.99.7-bin-hadoop200.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/sqoop-1.99.7-bin-hadoop200 /opt/sqoop
```

## Environment

```sh
sudo tee /etc/profile.d/sqoop.sh << 'EOF'
export SQOOP_HOME="/opt/sqoop"
export PATH="$SQOOP_HOME/bin:$PATH"
EOF
```

```sh
sudo su - $USER
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin sqoop
```

```sh
sudo usermod -aG sqoop $USER && sudo su - $USER
```

## Verify

You should be able to list a HDFS for example:

```sh
hadoop dfs -ls
```

## Logs

```sh
tail -f /opt/sqoop/@LOGDIR@/sqoop.log
```

```sh
tail -f /opt/sqoop/@LOGDIR@/audit.log
```
