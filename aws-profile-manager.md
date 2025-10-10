# AWS Profile Manager (a.k.a. AWS Profile Switcher)

**Keywords:** AWS Profile Switcher

## Links

- [Code Repository](https://github.com/99stealth/aws-profile-manager)

## CLI

### Installation

```sh
# Using pip
pipx install aws-profile-manager
```

### Commands

```sh
aws-profile-manager --help
```

### Environment

**Dependency:** [alias](/shellscript/alias.md)

```sh
#
echo "alias apm='aws-profile-manager'" >> ~/.aliases

#
source ~/.zshrc
```

### Usage

```sh
#
apm profile-current

#
apm profile-list
```

### Tips

#### Add Profile

```sh
#
export AWS_PROFILE_NAME='<name>'
export AWS_ACCESS_KEY_ID='<access-key>'
export AWS_SECRET_ACCESS_KEY='<secret-key>'

#
apm profile-add \
  --aws-profile-name "$AWS_PROFILE_NAME" \
  --aws-access-key-id "$AWS_ACCESS_KEY_ID" \
  --aws-secret-access-key "$AWS_SECRET_ACCESS_KEY"

#
apm profile-switch

#
apm profile-current

#
export AWS_DEFAULT_REGION='us-east-1'
aws configure get profile.default.region
```

#### Remove Profile

```sh
#
apm profile-remove \
  --aws-profile-name "$AWS_PROFILE_NAME" \
  --yes
```

#### Rotate Keys

```sh
#
apm rotate-keys
```

#### Monthly Rotate Keys

```sh
#
(crontab -l 2>/dev/null; echo '@monthly aws-profile-manager rotate-keys --aws-profile-name <name> --yes') | crontab -
```

### Issues

#### Missing Credentials File

```log
UnboundLocalError: cannot access local variable 'defaults_backup' where it is not associated with a value
```

```sh
#
cat ~/.aws/credentials

#
mkdir -p ~/.aws
touch ~/.aws/credentials

#
cat << EOF > ~/.aws/credentials
[default]

EOF
```
