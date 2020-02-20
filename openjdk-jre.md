# OpenJDK JRE - Java Runtime Environment

## CLI

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install openjdk-8-jre
```

#### YUM

```sh
yum check-update
sudo yum -y install java-1.8.0-openjdk
```

### Environment

#### Linux

```sh
# Java Home
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"
export PATH="$JAVA_HOME/bin:$PATH"
```

```sh
sudo su - "$USER"
```
