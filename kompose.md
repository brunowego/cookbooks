# kompose

## References

- [Main Website](https://kompose.io/)
- [Code Repository](https://github.com/kubernetes/kompose)

## CLI

### Installation

#### Homebrew

```sh
brew install kompose
```

#### Linux Binary

```sh
curl \
  -L "https://github.com/kubernetes/kompose/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kompose/releases/latest | grep tag_name | cut -d '"' -f 4)/kompose-linux-amd64" \
  -o /usr/local/bin/kompose && \
    sudo chmod +x /usr/local/bin/kompose
```

### Commands

```sh
kompose -h
```

### Usage

```sh
#
cat ./docker-compose.yml

#
kompose convert

#
kubectl apply -f .

#
kubectl get pod
```
