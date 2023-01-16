# eksctl

**Keywords:** AWS Elastic Kubernetes Service

## Links

- [Code Repository](https://github.com/weaveworks/eksctl)
- [Main Website](https://eksctl.io/)

## CLI

### Installation

#### Homebrew

```sh
brew tap weaveworks/tap
brew install eksctl
```

#### Chocolatey

```sh
choco install -y eksctl
```

### Commands

```sh
eksctl -h
```

### Usage

```sh
#
eksctl info

#
eksctl get clusters

#
eksctl get nodegroup --cluster <name>

#
eksctl delete nodegroup \
  --cluster <name> \
  --name <nodegroup-name>

#
eksctl delete cluster <name>
```

<!--
eksctl create cluster -f ./deploy.yml

eksctl utils associate-iam-oidc-provider --cluster eksctl-eksctl-demo-cluster --approve
-->

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# eksctl
source <(eksctl completion zsh) # bash
```

```sh
source ~/.zshrc
```
