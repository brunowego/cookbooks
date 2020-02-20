# asdf-vm

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
# Plugin
## Add
asdf plugin-add [name]

## List
asdf plugin-list

## Update
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
