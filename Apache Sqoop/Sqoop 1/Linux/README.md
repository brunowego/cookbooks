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
sudo mkdir /usr/local/sqoop && cd "$_"
```

```sh
curl https://archive.apache.org/dist/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz | sudo tar -xz --strip-components 1
```

## Environment

```sh
sudo tee /etc/profile.d/sqoop.sh << 'EOF'
export SQOOP_HOME="/usr/local/sqoop"
export PATH="$SQOOP_HOME/bin:$PATH"
EOF
```

```sh
sudo su - $USER
```

##

```sh
sudo mkdir -p /usr/local/accumulo
sudo mkdir -p /usr/local/zookeeper
```

```sh
sudo ln -s /usr/local/hive/hcatalog /usr/local/hcatalog
```