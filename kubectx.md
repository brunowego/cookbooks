# Kubernetes Contexts (kubectx)

## CLI

### Installation

#### Homebrew

```sh
brew install kubectx
```

#### Linux

```sh
#
sudo curl \
  -L 'https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx' \
  -o /usr/local/bin/kubectx

#
sudo curl \
  -L 'https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens' \
  -o /usr/local/bin/kubens

#
sudo chmod +x /usr/local/bin/{kubectx,kubens}
```

### Commands

```sh
kubectx -h
kubens -h
```

### Usage

```sh
# Unset context
kubectx -u

# Delete context entry
kubectx -d <cluster-name>
```
