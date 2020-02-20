# ssh-copy-id

## CLI

### Installation

#### Homebrew

```sh
brew install ssh-copy-id
```

### Usage

```sh
# Generate
ssh-keygen -b 4096 -C '[email]' -f ~/.ssh/id_rsa -q -t rsa -N ''

# Copy id
ssh-copy-id -i ~/.ssh/id_rsa [username]@[hostname]

# Test
ssh \
  -i ~/.ssh/id_rsa \
  [username]@[hostname]

# Ignore Known Hosts
ssh \
  -i ~/.ssh/id_rsa \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  [username]@[hostname]
```
