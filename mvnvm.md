# Maven Version Manager

## CLI

### Dependencies

#### APT

```sh
sudo apt update
sudo apt -y install unzip
```

### Installation

#### Homebrew

```sh
brew install mvnvm
```

#### Linux

```sh
sudo curl -L 'https://bitbucket.org/mjensen/mvnvm/raw/master/mvn' -o /usr/local/bin/mvn && \
  sudo chmod +x /usr/local/bin/mvn
```

### Configuration

```sh
# 2.x
echo 'mvn_version=2.2.1' > ./mvnvm.properties

# 3.x
echo 'mvn_version=3.6.3' > ./mvnvm.properties

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
```
