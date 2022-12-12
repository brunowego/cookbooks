# Kubeshark

**Keywords:** TCPDump/Wireshark for Kubernetes

![Diagram](/assets/images/kubeshark/diagram.png)

## Links

- [Code Repository](https://github.com/kubeshark/kubeshark)
- [Main Website](https://kubeshark.co/)

## CLI

### Installation

#### Darwin Binary

```sh
#
curl \
  -L 'https://github.com/kubeshark/kubeshark/releases/download/37.0/kubeshark_darwin_amd64' \
  -o /usr/local/bin/kubeshark

#
chmod +x /usr/local/bin/kubeshark
```

#### Linux Binary

```sh
#
curl \
  -L 'https://github.com/kubeshark/kubeshark/releases/download/37.0/kubeshark_linux_amd64' \
  -o /usr/local/bin/kubeshark

#
chmod +x /usr/local/bin/kubeshark
```

### Commands

```sh
kubeshark -h
```

### Installation

```sh
#
kubeshark tap

#
kubeshark check

#
kubeshark config
```

### Usage

```sh
#
kubeshark logs

#
kubeshark view

#
kubeshark clean
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Kubeshark
source <(kubeshark completion zsh) # bash
```

```sh
source ~/.zshrc
```
