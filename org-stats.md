# org-stats

## Links

- [Code Repository](https://github.com/caarlos0/org-stats)

## CLI

### Installation

#### Homebrew

```sh
brew tap caarlos0/tap
brew install org-stats
```

#### APT

```sh
echo 'deb [trusted=yes] https://apt.fury.io/caarlos0/ /' | \
  sudo tee /etc/apt/sources.list.d/caarlos0.list

sudo apt update
sudo apt -y install org-stats
```

#### YUM

```sh
echo '[caarlos0]
name=caarlos0
baseurl=https://yum.fury.io/caarlos0/
enabled=1
gpgcheck=0' | \
  sudo tee /etc/yum.repos.d/caarlos0.repo

sudo yum check-update
sudo yum -y install org-stats
```

### Commands

```sh
org-stats -h
```

### Usage

```sh
#
export GITHUB_TOKEN=''

#
org-stats \
  -o [org-name]
```
