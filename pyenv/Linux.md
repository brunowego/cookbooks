# Linux

## Dependencies

### Zypper

```sh
sudo zypper refresh
sudo zypper install -y git-core curl tar gzip make gcc-c++ zlib-devel libffi-devel libopenssl-devel libbz2-devel readline-devel sqlite3-devel
```

### YUM

```sh
sudo yum check-update
sudo yum -y install git curl tar gzip make gcc-c++ zlib-devel libffi-devel openssl-devel bzip2-devel readline-devel sqlite-devel
```

### APT

```sh
sudo apt update
sudo apt -y install git curl tar gzip make g++ zlib1g-dev libffi-dev libbz2-dev libreadline-dev libsqlite3-dev
```

> Build OpenSSL from source before install python version 3.x

## Installation

```sh
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

## Environment

```sh
sudo tee /etc/profile.d/pyenv.sh << 'EOF'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
EOF
```

```sh
sudo su - $USER
```
