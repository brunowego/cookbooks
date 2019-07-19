# ssh-copy-id

## Installation

### Homebrew

```sh
brew install ssh-copy-id
```

## Examples

### Generate

```sh
ssh-keygen -b 4096 -C '[email]' -f ~/.ssh/id_rsa -q -t rsa -N ''
```

### Copy id

```sh
ssh-copy-id -i ~/.ssh/id_rsa [username]@[hostname]
```

### Test

```sh
ssh \
  -i ~/.ssh/id_rsa \
  [username]@[hostname]
```

#### Ignore Known Hosts

```sh
ssh \
  -i ~/.ssh/id_rsa \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  [username]@[hostname]
```
