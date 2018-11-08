# Linux

## Dependencies

### APT

```sh
sudo apt update
sudo apt -y install openjdk-8-jre
```

### YUM

```sh
sudo yum check-update
sudo yum -y install java-1.8.0-openjdk
```

## Installation

```sh
curl -sLH "Cookie: oraclelicense=accept-securebackup-cookie" \
 http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jre-8u191-linux-x64.tar.gz | sudo tar -xzC /opt
sudo ln -s /opt/jre1.8.0_191 /opt/java
```

## Environment

```sh
sudo tee /etc/profile.d/java.sh << 'EOF'
export JAVA_HOME="$(dirname $(dirname $(readlink -f $(which java))))"
export PATH="$JAVA_HOME/bin:$PATH"
EOF
```

```sh
sudo su - $USER
```
