# kops

## CLI

### Installation

#### Homebrew

```sh
brew install kops
```

#### Linux

```sh
sudo curl -L "https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64" -o /usr/local/bin/kops
```

```sh
sudo chmod +x /usr/local/bin/kops
```
