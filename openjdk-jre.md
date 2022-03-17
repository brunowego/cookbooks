# OpenJDK JRE - Java Runtime Environment

<!--
https://www.java.com/en/download/manual.jsp
-->

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

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y java-1_8_0-openjdk
```

### Environment

#### Linux

***Warning:*** Not use if are using [jabba](/jabba.md).

```sh
# Java Home
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"
export PATH="$JAVA_HOME/bin:$PATH"
```

```sh
sudo su - "$USER"
```
