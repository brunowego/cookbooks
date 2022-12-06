# Teleport Linux Server Service

## Docs

- [Guides](https://github.com/gravitational/teleport/tree/master/docs/pages/server-access/guides)

## Configuration

```sh
#
tctl users add teleport-admin --roles=editor,access --logins=root,ubuntu,ec2-user

#
tsh login --proxy=teleportvm.b5pr4wd569rd.instruqt.io:443 --user=teleport-admin

#
tsh ls

#
tsh ssh root@my-first-host

#
tctl tokens add --type=node --ttl=10m

#
teleport start \
  --roles=node \
  --token=2198985b615ec139388aa843889fecc7 \
  --ca-pin=sha256:ae2b157699afc590dc14f62f6f67292bb13dbd677ce2356b79cc21537fe786b1 \
  --auth-server=10.5.3.75:3025

sudo teleport start --roles=node --token=MxL9okdcwpoMNCZWrMqZ --auth-server=teleportvm.b5pr4wd569rd.instruqt.io:443
```

### Usage

```sh
#
tsh login \
  --proxy <host> \
  --user <email>

tsh ssh <username>@<hostname>

tsh ssh -o ForwardAgent=yes <username>@<hostname>

tsh ssh -o AddKeysToAgent=yes <username>@<hostname>

#
tsh logout
```

<!-- ### Tips

####

```sh
ln -s /path/to/tsh /path/to/ssh

ssh <username>@<hostname>
``` -->
