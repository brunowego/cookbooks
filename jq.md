# jq

## CLI

### Installation

#### Homebrew

```sh
brew install jq
```

#### APT

```sh
sudo apt update
sudo apt -y install jq
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install jq
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y jq
```

#### Chocolatey

```sh
choco install -y jq
```

#### RPM

- [RPM resource jq(x86-64)](https://rpmfind.net/linux/rpm2html/search.php?query=jq(x86-64))

```sh
curl -LO https://rpmfind.net/linux/opensuse/tumbleweed/repo/oss/x86_64/libjq1-1.6-2.4.x86_64.rpm
sudo rpm -vi libjq1-1.6-2.4.x86_64.rpm && rm -f libjq1-1.6-2.4.x86_64.rpm

curl -LO https://rpmfind.net/linux/opensuse/tumbleweed/repo/oss/x86_64/jq-1.6-2.4.x86_64.rpm
sudo rpm -vi jq-1.6-2.4.x86_64.rpm && rm -f jq-1.6-2.4.x86_64.rpm
```

### Usage

```sh
# Single line
jq '.example.email |= "jdoe@example.com"' [filename] | sponge [filename]

# Multiple lines
jq '.example.name |= "John Doe"' jq '.example.email |= "jdoe@example.com"' [filename] | sponge [filename]

# Remove
jq 'del(.example.name, .example.email)' [filename] | sponge [filename]
```
