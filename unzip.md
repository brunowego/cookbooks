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

#### Chocolatey

```sh
choco install -y unzip
```

### Commands

```sh
unzip -hh
zipinfo -h
```

### Examples

#### Listing

```sh
unzip -l [filename].zip
# or
zipinfo [filename].zip
```

#### Compressing With own directory

```sh
zip -r [filename].zip [filepath]
```
