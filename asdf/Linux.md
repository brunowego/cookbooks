# Linux

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install git
```

### APT

```sh
sudo apt update
sudo apt -y install git
```

## Installation

```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.6.0
```

## Environment

```sh
sudo tee /etc/profile.d/asdf.sh << 'EOF'
source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
EOF
```

```sh
sudo su - $USER
```
