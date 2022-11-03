# Maven Version Manager (MVNVM)

## Links

- [Main Website](https://mvnvm.org/)

## CLI

### Dependencies

- [UnZip](/unzip.md)

### Installation

#### Homebrew

```sh
brew install mvnvm
```

#### Linux

```sh
sudo curl \
  -L 'https://bitbucket.org/mjensen/mvnvm/raw/master/mvn' \
  -o /usr/local/bin/mvn && \
    sudo chmod +x /usr/local/bin/mvn
```

### Configuration

**Maven Versions:** [Maven Releases History](https://maven.apache.org/docs/history.html)

```sh
#
echo 'mvn_version=3.8.6' > ./mvnvm.properties

# Git ignore
echo '/mvnvm.properties' >> ~/.gitignore_global
```

### Commands

```sh
mvn -h
```

### Usage

```sh
# Show installed version
ls ~/.mvnvm

# Install pre-defined version
mvn
```

### Issues

#### Behind Proxy

```log
unzip:  cannot find zipfile directory in one of ~/.mvnvm/apache-maven-3.6.3-bin.zip or
        ~/.mvnvm/apache-maven-3.6.3-bin.zip.zip, and cannot find ~/.mvnvm/apache-maven-3.6.3-bin.zip.ZIP, period.
```

Copy from another host.
