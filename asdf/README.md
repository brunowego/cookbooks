# ASDF Version Manager

## Plugins

- [Bazel](/asdf/asdf-bazel.md)
- [Go Programming Language](/asdf/asdf-go.md)
- [Helm](/asdf/asdf-helm.md)
- [Java](/asdf/asdf-java.md)
- [kubectl](/asdf/asdf-kubectl.md)
- [Apache Maven](/asdf/asdf-maven.md)
- [Minikube](/asdf/asdf-minikube.md)
- [Node.js](/asdf/asdf-nodejs.md)
- [PHP: Hypertext Preprocessor](/asdf/asdf-php.md)
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

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
```

### Environment

```sh
sudo tee /etc/profile.d/asdf.sh << 'EOF'
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
EOF
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
