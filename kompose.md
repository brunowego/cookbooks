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
kompose convert \
  -o ./.k8s/base/ \
  --with-kompose-annotation=false \
  -f ./docker-compose.yaml

#
kubectl apply -f .

#
kubectl get pod
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# kompose
source <(kompose completion zsh) # bash
```

```sh
source ~/.zshrc
```

#### Remove Creation Timestamp

```sh
find ./.k8s \
  -type f \
  -iname \*.yaml \
  -exec sed -i '/creationTimestamp: null/d' {} \;
```

#### Remove Status

```sh
find ./.k8s \
  -type f \
  -iname \*.yaml \
  -exec sed -i '/status: /d' {} \;
```

<!-- #### Consistent Indent Sequences -->
