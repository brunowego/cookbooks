# Darwin

## Installation

### Homebrew

```sh
brew install safe-rm
```

```sh
ln -s /usr/local/bin/safe-rm /usr/local/bin/rm
```

```sh
sudo tee /etc/safe-rm.conf << EOF
/Applications
/Library
/Network
/System
/Users
/Volumes
EOF
```
