# Prowler

**Keywords:** Security Compliance

## Links

- [Code Repository](https://github.com/prowler-cloud/prowler)

## Related

- [CIS Amazon Web Services Foundations](https://d0.awsstatic.com/whitepapers/compliance/AWS_CIS_Foundations_Benchmark.pdf)

## Compliance Standards

- AWS Foundational Technical Review (FTR)
- Center for Internet Security (CIS)
- Federal Financial Institutions Examination Council (FFIEC)
- General Data Protection Regulation (GDPR)
- Health Insurance Portability and Accountability Act (HIPAA)
- ISO/IEC 27001
- National Security Framework (ENS)
- Payment Card Industry Data Security Standard (PCI DSS)
- Security Operations Center (SOC) 2

## CLI

### Requirements

- Unix-like Only
  - [AWS Command Line Interface (CLI)](/aws/aws-cli.md)
  - [detect-secrets](/detect-secrets.md)
  - [jq](/jq.md)

### Installation

#### Homebrew

```sh
brew install prowler
```

#### pip

```sh
pip3 install prowler
```

#### Unix-like

```sh
sudo curl -L 'https://github.com/prowler-cloud/prowler/archive/refs/tags/2.12.0.tar.gz' | \
  sudo tar -xzC /opt --no-same-owner --no-same-permissions && \
    sudo ln -s /opt/prowler-2.12.0 /opt/prowler
```

### Environment (Unix-like Only)

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
prowler <provider> -h
```

### Usage

```sh
#
prowler <provider> # aws, azure, gcp

#
prowler <provider> -M html
```
