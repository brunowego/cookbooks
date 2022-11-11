# Jelastic

## Links

- [Org. Repository](https://github.com/jelastic/)
- [Main Website](https://jelastic.com/)
- [Dashboard](https://app.jelastic.saveincloud.net/)
- [Status Page](https://status.saveincloud.com/)

## Docs

- [Platform CLI Overview](https://virtuozzo.com/application-platform-docs/cli/?lang=en)

## CLI

### Installation

#### Bash

```sh
#
curl \
  -L 'ftp://ftp.jelastic.com/pub/cli/jelastic-cli.jar' \
  -o '/tmp/jelastic-cli.jar'

#
java -jar -Duser.home="$HOME" /tmp/jelastic-cli.jar setup
```

### Commands

```sh
~/jelastic/help
```

### Usage

```sh
~/jelastic/users/authentication/signin \
  --login '<email>' \
  --password '<password>' \
  --platformUrl '<url>'
```

### Tips

#### SSH Key Config

```sh
#
cat << EOF >> ~/.ssh/config
Host gate.jelastic.saveincloud.net
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa.<company-name>
EOF
```
