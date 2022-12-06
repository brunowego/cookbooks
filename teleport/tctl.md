# tctl

Admin tool for the Teleport Access Plane.

## Commands

```sh
tctl help
```

### Usage

```sh
tctl status
```

#### Users

```sh
#
tctl users ls

#
tctl users add \
  --logins 'root,ubuntu,ec2-user' \
  --roles 'editor,access' \
  '<username>'

#
tctl users update \
  --set-logins 'root,ubuntu,ec2-user' \
  --set-roles 'editor,access' \
  '<username>'

#
tctl users reset \
  '<username>'

#
tctl users rm '<username>'
```

#### Tokens

```sh
#
tctl tokens ls

tctl tokens add \
  --type db

tctl tokens add \
  --type app \
  --app-name '<app-name>' \
  --app-uri '<app-uri>'
```
