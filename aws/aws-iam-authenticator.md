# AWS IAM Authenticator

## Guides

- [Installing aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

## CLI

### Installation

#### Homebrew

```sh
brew install aws-iam-authenticator
```

#### Linux Binary

```sh
KUBEKUTR_VERSION="$(curl -s https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${KUBEKUTR_VERSION}/aws-iam-authenticator_${KUBEKUTR_VERSION}_linux_amd64" \
    -o /usr/local/bin/aws-iam-authenticator && \
      sudo chmod +x /usr/local/bin/aws-iam-authenticator
```

#### Darwin Binary

```sh
KUBEKUTR_VERSION="$(curl -s https://api.github.com/repos/kubernetes-sigs/aws-iam-authenticator/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  sudo curl \
    -L "https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v${KUBEKUTR_VERSION}/aws-iam-authenticator_${KUBEKUTR_VERSION}_darwin_amd64" \
    -o /usr/local/bin/aws-iam-authenticator && \
      sudo chmod +x /usr/local/bin/aws-iam-authenticator
```

### Commands

```sh
aws-iam-authenticator help
```
