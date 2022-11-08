# ssh-copy-id

## CLI

### Installation

#### Homebrew

```sh
brew install ssh-copy-id
```

#### APT

```sh
sudo apt update
sudo apt -y install openssh-client
```

#### YUM

```sh
yum check-update
sudo yum -y install openssh-clients
```

#### Chocolatey

```sh
choco install -y ssh-copy-id
```

### Usage

```sh
# Generate
ssh-keygen \
  -q \
  -b 4096 \
  -C '<email>' \
  -N '' \
  -t rsa \
  -f ~/.ssh/id_rsa

# Copy id
ssh-copy-id \
  -i ~/.ssh/id_rsa \
  <username>@<hostname>

# Test
ssh \
  -i ~/.ssh/id_rsa \
  <username>@<hostname>

# Ignore Known Hosts
ssh \
  -i ~/.ssh/id_rsa \
  -o UserKnownHostsFile=/dev/null \
  -o StrictHostKeyChecking=no \
  <username>@<hostname>
```
