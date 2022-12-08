# Teleport Linux Server Service

## Docs

- [Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/server-access/guides)

## Example

### Dependencies

- [Ubuntu](/ubuntu/README.md#kubectl)
  - [Teleport CLI / APT](../README.md#apt)
- [CentOs](/centos.md#kubectl)
  - [Teleport CLI / YUM](../README.md#yum)

### Installation

```sh
#
tctl tokens add \
  --type node \
  --ttl 10m

#
export TELEPORT_AUTH_SERVER='<teleport-domain>:443'
export TELEPORT_TOKEN='<token>'
export TELEPORT_CA_PIN='<ca-pin>'

#
teleport start \
  --roles node \
  --auth-server "$TELEPORT_AUTH_SERVER" \
  --token "$TELEPORT_TOKEN" \
  --ca-pin "$TELEPORT_CA_PIN" \
  --insecure
```

### Usage

```sh
#
tsh ls

#
tsh ssh <username>@<hostname>

#
tsh logout
```

<!-- ### Tips

####

```sh
tsh ssh -o ForwardAgent=yes <username>@<hostname>
tsh ssh -o AddKeysToAgent=yes <username>@<hostname>
```

####

```sh
ln -s /path/to/tsh /path/to/ssh

ssh <username>@<hostname>
``` -->

### Issues

#### Failure to Start Node Sessions

```log
ERRO Error during temporary user cleanup: user: lookup groupname teleport-system: no such process srv/usermgmt.go:373
```

Issue with [the solution](https://github.com/gravitational/teleport/issues/18981).

```sh
#
teleport version
```
