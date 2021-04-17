# Apache Spark

## Dependencies

### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-8-jre
```

### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk-devel
```

## Installation

### Homebrew

```sh
brew install apache-spark
```

### Linux

```sh
curl https://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz | sudo tar -xzC /usr/local
( cd /usr/local && sudo ln -s spark-2.4.3-bin-hadoop2.7 spark )
```

### Chocolatey

```sh
choco install -y spark
```

## Environment

### Linux

```sh
sudo tee /etc/profile.d/spark.sh << 'EOF'
export SPARK_HOME='/usr/local/spark'
export PATH="$SPARK_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```
