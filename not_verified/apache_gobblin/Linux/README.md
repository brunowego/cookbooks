# Linux

## Dependencies

### APT

```sh
sudo apt update
sudo apt -y install curl openjdk-7-jdk
```

### YUM

```sh
yum check-update
sudo yum -y install curl java-1.8.0-openjdk-devel
```

## Installation

```sh
curl -L https://github.com/apache/incubator-gobblin/archive/release-0.14.0.tar.gz | tar -xzC /tmp
```

```sh
curl -L https://github.com/apache/incubator-gobblin/raw/0.14.0/gradle/wrapper/gradle-wrapper.jar -o /tmp/incubator-gobblin-release-0.14.0/gradle/wrapper/gradle-wrapper.jar
```

```sh
( cd /tmp/incubator-gobblin-release-0.14.0 && ./gradlew build -x findbugsMain -x test -x rat -x checkstyleMain -x javadoc )
```

```sh
sudo tar -xzf /tmp/incubator-gobblin-release-0.14.0/apache-gobblin-incubating-bin-0.14.0.tar.gz -C /opt --transform s/gobblin-dist/gobblin-0.14.0/
rm -fR /tmp/incubator-gobblin-release-0.14.0
sudo ln -s /opt/gobblin-0.14.0 /opt/gobblin
```

## Environment

```sh
sudo tee /etc/profile.d/gobblin.sh << 'EOF'
export GOBBLIN_HOME="/opt/gobblin"
export PATH="$GOBBLIN_HOME/bin:$PATH"
EOF
```

```sh
sudo su - "$USER"
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin gobblin
```

```sh
sudo usermod -aG gobblin "$USER" && sudo su - "$USER"
```
