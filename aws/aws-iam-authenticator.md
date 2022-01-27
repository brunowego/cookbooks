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
  sudo curl \
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

<!-- ### Tips

####

```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: kube-system
  name: aws-iam-authenticator
  labels:
    k8s-app: aws-iam-authenticator
data:
  config.yaml: |
    clusterID: $(CLUSTER_FULLNAME)
    server:
      mapRoles:
      - roleARN: arn:aws:iam::[id]:role/GoogleApps-Admins
        username: '{{SessionName}}'
        groups:
        - system:masters
      - roleARN: arn:aws:iam::[id]:role/GoogleApps-Developers
        username: '{{SessionName}}'
        groups:
        - system:masters
``` -->

### Issues

#### Missing CLI

```log
Unable to connect to the server: getting credentials: exec: exec: "aws-iam-authenticator": executable file not found in $PATH
```

Missing AWS IAM Authenticator CLI in PATH.
