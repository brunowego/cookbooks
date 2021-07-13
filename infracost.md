# Infracost

## Links

- [Code Repository](https://github.com/infracost/infracost)
- [Main Website](https://infracost.io/)

## Guides

- [Usage-based resources](https://infracost.io/docs/usage_based_resources/)

## CLI

### Installation

#### Homebrew

```sh
brew install infracost
```

#### Linux Binary

```sh
curl -L 'https://github.com/infracost/infracost/releases/download/v0.9.3/infracost-linux-amd64.tar.gz' | \
  tar -xzC /usr/local/bin --transform s/-linux-amd64//
```

### Commands

```sh
infracost -h
```

### Bootstrap

```sh
# Get API token
infracost register

# Show credentials
cat ~/.config/infracost/credentials.yml

# Create inside the project
cat << EOF > ./infracost-usage.yml
version: 0.1
resource_usage: {}
EOF
```

### Usage

```sh
#
infracost breakdown \
  -p ./ \
  --show-skipped \
  --sync-usage-file \
  --terraform-plan-flags '-var-file=./vars/terraform.tfvars' \
  --usage-file ./infracost-usage.yml

#
infracost diff \
  -p ./ \
  --show-skipped \
  --sync-usage-file \
  --terraform-plan-flags '-var-file=./vars/terraform.tfvars' \
  --usage-file ./infracost-usage.yml
```
