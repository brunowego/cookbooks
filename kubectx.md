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
# Current context
kubectx -c

# Unset context
kubectx -u

# Switch to last context
kubectx -

# Switch to another context
kubectx <context-name>

# Delete context entry
kubectx -d <context-name>
```

### Tips

#### Rename Context

```sh
kubectx <new-context-name>=<old-context-name>
```

### Issues

#### Oldest Version of Kubectl

```sh
signal: segmentation fault
error getting current context
```

Try update [kubectl](/kubectl/README.md)
