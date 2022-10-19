# Prowler - AWS Security Tool

## Links

- [Code Repository](https://github.com/toniblyx/prowler)
- [CIS Amazon Web Services Foundations](https://d0.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf)

## CLI

### Requirements

- [AWS Command Line Interface (CLI)](/aws/aws-cli.md)
- [detect-secrets](/detect-secrets.md)
- [jq](/jq.md)

### Installation

#### Unix-like

```sh
sudo curl -L 'https://github.com/toniblyx/prowler/archive/refs/tags/2.4.1.tar.gz' | \
  sudo tar -xzC /opt --no-same-owner --no-same-permissions && \
    sudo ln -s /opt/prowler-2.4.1 /opt/prowler
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Prowler
export PATH="/opt/prowler:$PATH"
```

```sh
sudo su - "$USER"
```

### Commands

```sh
prowler -h
```

### Usage

```sh
#
prowler \
  -p custom-profile \
  -r us-east-1

#
prowler \
  -c check310
```
