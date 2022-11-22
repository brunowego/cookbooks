# AWS Profile Manager (a.k.a. AWS Profile Switcher)

**Keywords:** AWS Profile Switcher

## Links

- [Code Repository](https://github.com/99stealth/aws-profile-manager)

## CLI

### Installation

#### pip

```sh
pip3 install -U aws-profile-manager
```

### Commands

```sh
aws-profile-manager --help
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# AWS Profile Manager
alias apm='aws-profile-manager'
```

```sh
source ~/.zshrc
```

### Usage

```sh
#
apm profile-current

#
apm profile-list

#
export AWS_PROFILE_NAME=''
export AWS_ACCESS_KEY_ID=''
export AWS_SECRET_ACCESS_KEY=''

#
apm profile-add \
  --aws-profile-name "$AWS_PROFILE_NAME" \
  --aws-access-key-id "$AWS_ACCESS_KEY_ID" \
  --aws-secret-access-key "$AWS_SECRET_ACCESS_KEY" \

#
apm profile-switch

#
export AWS_DEFAULT_REGION='us-east-1'
aws configure get profile.default.region

#
apm profile-remove \
  --aws-profile-name "$AWS_PROFILE_NAME" \
  --yes

#
apm rotate-keys
```

### Tips

#### Monthly Rotate Keys

```sh
#
(crontab -l 2>/dev/null; echo '@monthly aws-profile-manager rotate-keys --aws-profile-name <name> --yes') | crontab -
```
