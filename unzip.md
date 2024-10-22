# UnZip

## CLI

### Installation

#### Homebrew

```sh
brew install unzip
```

#### APT

```sh
sudo apt update
sudo apt -y install unzip
```

#### YUM

```sh
yum check-update
sudo yum -y install unzip
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y unzip
```

#### Chocolatey

```sh
choco install -y unzip
```

### Commands

```sh
unzip -hh
zipinfo -h
```

### Using

```sh
# Listing
unzip -l <filename>.zip
# or
zipinfo <filename>.zip

# Compressing With own directory
zip -r <filename>.zip <filepath>
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h unzip \
  --name unzip \
  --network workbench \
  docker.io/kubeless/unzip:latest
```
