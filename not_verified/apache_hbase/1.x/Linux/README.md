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
sudo mkdir /usr/local/hbase && cd "$_"
```

```sh
curl https://archive.apache.org/dist/hbase/1.4.9/hbase-1.4.9-bin.tar.gz | sudo tar -xz --strip-components 1
```

## Environment

```sh
sudo tee /etc/profile.d/hbase.sh << 'EOF'
export HBASE_HOME="/usr/local/hbase"
export PATH="$HBASE_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin hbase
```

```sh
sudo usermod -aG hbase "$USER" && sudo su - "$USER"
```
