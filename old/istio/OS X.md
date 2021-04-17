# Darwin

## Installation

```sh
curl -L https://github.com/istio/istio/releases/download/1.1.1/istio-1.1.1-osx.tar.gz | sudo tar -xzC /usr/local --transform s/istio-1.1.1/istio/
```

## Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Istio
export PATH="/usr/local/istio/bin:$PATH"
```

```sh
sudo su - "$USER"
```
