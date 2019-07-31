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
sudo yum check-update
sudo yum -y install epel-release
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

### Examples

#### Single line

```sh
jq '.example.email |= "johndoe@example.com"' [filename] | sponge [filename]
```

#### Multiple lines

```sh
jq '.example.name |= "John Doe"' jq '.example.email |= "johndoe@example.com"' [filename] | sponge [filename]
```

#### Remove

```sh
jq 'del(.example.name, .example.email)' [filename] | sponge [filename]
```
