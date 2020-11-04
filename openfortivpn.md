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
sudo install -dm 755 -o root -g root /etc/openfortivpn/[company]

cat << EOF | sudo tee /etc/openfortivpn/[company]/config
host = [domain]
port = 443
username = [username]
password = [password]
trusted-cert = [hash]
EOF

sudo openfortivpn -c /etc/openfortivpn/[company]/config

# Darwin
sudo install -dm 755 -o "$USER" -g admin /usr/local/etc/openfortivpn/[company]

cat << EOF > /usr/local/etc/openfortivpn/[company]/config
host = [domain]
port = 443
username = [username]
password = [password]
trusted-cert = [hash]
EOF

sudo openfortivpn -c /usr/local/etc/openfortivpn/[company]/config
```
