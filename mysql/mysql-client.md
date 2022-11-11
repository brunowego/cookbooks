# MySQL Client

<!-- ## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h centos \
  --name centos \
  --network workbench \
  docker.io/library/centos:7.6.1810 /bin/bash
``` -->

## CLI

### Installation

#### Homebrew

```sh
brew install mysql-client
```

#### APT

```sh
sudo apt update
sudo apt -y install mysql-client
```

#### YUM

```sh
yum check-update
sudo yum -y install mysql
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y mysql-client
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# MySQL Client
export PATH="/usr/local/opt/mysql-client/bin:$PATH" # Homebrew
```

```sh
sudo su - "$USER"
```

### Commands

```sh
mysql --help
```

### Usage

```sh
#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root'

#
mysql \
  -h "$DB_HOST" \
  -P "$DB_PORT" \
  -u "$DB_USERNAME" \
  -p"$DB_PASSWORD"
```

## Library Python

### Dependencies

#### APK

```sh
apk add build-base mariadb-dev
```

### Installation

```sh
pip3 install mysqlclient
```
