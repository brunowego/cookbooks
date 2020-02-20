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
curl https://archive.apache.org/dist/incubator/druid/0.13.0-incubating/apache-druid-0.13.0-incubating-bin.tar.gz | sudo tar -xzC /opt --no-same-owner --no-same-permissions
sudo ln -s /opt/apache-druid-0.13.0-incubating /opt/apache-druid
```

## Environment

```sh
sudo tee /etc/profile.d/druid.sh << 'EOF'
export DRUID_HOME="/opt/apache-druid"
export PATH="$DRUID_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo chmod -R o+x /opt/apache-druid/bin
```

```sh
sudo useradd -Mrs /sbin/nologin druid
```

```sh
sudo usermod -aG druid "$USER" && sudo su - "$USER"
```
