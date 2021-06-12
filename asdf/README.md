# asdf Version Manager

## Links

- [Code Repository](https://github.com/asdf-vm/asdf)
- [Main Website](https://asdf-vm.com/)
- [Plugin List](https://asdf-vm.com/#/plugins-all?id=plugin-list)

## Plugins

- [Apache Maven](/asdf/asdf-maven.md)
- [Bazel](/asdf/asdf-bazel.md)
- [Go](/asdf/asdf-go.md)
- [Helm](/asdf/asdf-helm.md)
- [Java](/asdf/asdf-java.md)
- [kubectl](/asdf/asdf-kubectl.md)
- [Minikube](/asdf/asdf-minikube.md)
- [Node.js](/asdf/asdf-nodejs.md)
- [PHP](/asdf/asdf-php.md)
- [Python](/asdf/asdf-python.md)
- [R](/asdf/asdf-r-project.md)
- [Ruby](/asdf/asdf-ruby.md)
- [Scala](/asdf/asdf-scala.md)

## CLI

### Dependencies

#### YUM

```sh
yum check-update
sudo yum -y install git
```

#### APT

```sh
sudo apt update
sudo apt -y install git
```

### Installation

#### Unix-like

##### Using Git

```sh
git clone 'https://github.com/asdf-vm/asdf.git' ~/.asdf
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# asdf
source "$HOME/.asdf/asdf.sh"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
asdf -h
```

### Usage

```sh
# Add Plugin
asdf plugin-add [name]

# List Plugin
asdf plugin-list

# Update Plugin
asdf plugin-update --all

# Install
asdf install [name] [version]

# Set Global
asdf global [name] [version]

# Reshim
asdf reshim [name] [version]

# Current
asdf current

# List
asdf list [name]

# Uninstall
asdf uninstall [name] [version]
```
