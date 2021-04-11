# Apache Livy

https://www.jowanza.com/blog/creating-a-spark-server-for-every-job-with-livy

## Host

### Dependencies

- Apache Spark

#### APT

```sh
sudo apt update
sudo apt -y install wget unzip openjdk-7-jre
```

#### YUM

```sh
yum check-update
sudo yum -y install wget unzip java-1.8.0-openjdk-devel
```

### Installation

#### Linux

```sh
( cd /usr/local && sudo wget -O tmp.zip https://archive.apache.org/dist/incubator/livy/0.6.0-incubating/apache-livy-0.6.0-incubating-bin.zip && sudo unzip tmp.zip && sudo rm tmp.zip )
( cd /usr/local && sudo ln -s apache-livy-0.6.0-incubating-bin livy )
```

### Configuration

#### Linux

```sh
sudo useradd -Mrs /sbin/nologin livy
```

```sh
sudo usermod -aG livy "$USER" && sudo su - "$USER"
```

```sh
( cd /usr/local/livy/conf && sudo mv ./log4j.properties.template ./log4j.properties )
```

### Environment

#### Linux

```sh
sudo install -dm 775 -o livy -g livy /var/log/livy
```

```sh
sudo tee /etc/profile.d/livy.sh << 'EOF'
export LIVY_HOME='/usr/local/livy'
export LIVY_LOG_DIR='/var/log/livy'
export PATH="$LIVY_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```
