# International Components for Unicode (ICU)

## Library

### Installation

#### Homebrew

```sh
#
brew list --versions icu4c

# Darwin 10.x
brew tap magrathealabs/mlabs
brew install icu4c@58.1
brew link icu4c@58.1 --force

# Darwin >= 11
brew install icu4c
```

### YUM

```sh
yum check-update
sudo yum -y install libicu-devel
```
