# openfortivpn

## CLI

### Installation

#### Homebrew

```sh
brew install openfortivpn
```

#### APT

```sh
sudo apt update
sudo apt -y install openfortivpn
```

### Commands

```sh
openfortivpn -h
```

### Configuration

```sh
# Linux
sudo install -dm 755 -o root -g root /etc/openfortivpn/stefanini

cat << EOF | sudo tee > /etc/openfortivpn/stefanini/config
host = [domain]
port = 443
username = [username]
password = [password]
trusted-cert = [hash]
EOF

sudo openfortivpn -c /etc/openfortivpn/stefanini/config

# Darwin
sudo install -dm 755 -o "$USER" -g admin /usr/local/etc/openfortivpn/stefanini

cat << EOF > /usr/local/etc/openfortivpn/stefanini/config
host = [domain]
port = 443
username = [username]
password = [password]
trusted-cert = [hash]
EOF

sudo openfortivpn -c /usr/local/etc/openfortivpn/stefanini/config
```
