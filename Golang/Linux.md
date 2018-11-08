# Linux

## Installation

```sh
curl https://dl.google.com/go/go1.12.1.linux-amd64.tar.gz | sudo tar -xzC /usr/local
```

## Environment

```sh
sudo tee /etc/profile.d/golang.sh << 'EOF'
export GOBIN="$HOME/go/bin"
export GOLANG_HOME="/usr/local/go"
export PATH="$GOLANG_HOME/bin:$GOBIN:$PATH"
EOF
```

```sh
sudo su - $USER
```
