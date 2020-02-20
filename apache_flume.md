# Apache Flume

## CLI

### Installation

#### Homebrew

```sh
brew install flume
```

### Issues

#### GC overhead limit exceeded

```sh
sudo sed -ri "0,/# export JAVA_OPTS=(.*)/ s//export JAVA_OPTS=\1/" /opt/apache-flume/conf/flume-env.sh
```

```sh
sudo sed -i 's/-Xms100m -Xmx2000m/-Xms1g -Xmx2g/g' /opt/apache-flume/conf/flume-env.sh
```
