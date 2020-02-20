# Squid

## Docker

### Dependencies

- [Stunnel](/stunnel.md#docker)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h squid \
  -p 3128:3128 \
  --name squid \
  docker.io/brunowego/squid:4.8-r0
```

```sh
docker exec -i squid /bin/sh << EOSHELL
cat << EOF >> /etc/squid/squid.conf
never_direct allow all

cache_peer 127.0.0.1 parent 40443 0 proxy-only login=[username]:[password]

EOF
EOSHELL
```

```sh
docker restart squid
```

### Remove

```sh
docker rm -f squid
```

## CLI

### Installation

#### Homebrew

```sh
brew install squid
```

#### APT

```sh
sudo apt update
sudo apt -y install squid3
```

#### YUM

```sh
yum check-update
sudo yum -y install squid
```

### Environment

#### Darwin

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# check if exists
echo $PATH | grep '/usr/local/sbin'
```

```sh
# Squid
export PATH="/usr/local/sbin:$PATH"
```

```sh
sudo su - "$USER"
```

### Service

```sh
# Homebrew
brew services start squid

# Systemd
sudo systemctl enable --now squid
```

### Commands

```sh
squid -h
```

### Examples

#### Auth

##### Dependencies

###### APT

```sh
sudo apt update
sudo apt -y install apache2-utils
```

##### Configuration

```sh
# Linux
sudo tee -a /etc/squid/squid.conf << EOF
auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/passwords
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
EOF
```

```sh
sudo htpasswd -c /etc/squid/passwords [username]
```

```sh
sudo systemctl restart squid
```

#### Cache Peer

- [Reference](http://www.squid-cache.org/Doc/config/cache_peer/)

##### Linux

```sh
cat << EOF | sudo tee -a /etc/squid/squid.conf
never_direct allow all

cache_peer 127.0.0.1 parent 40443 0 proxy-only login=[username]:[password]

EOF
```

```sh
sudo systemctl restart squid
```

##### Darwin

```sh
cat << EOF | sudo tee -a /usr/local/etc/squid.conf
never_direct allow all

cache_peer 127.0.0.1 parent 40443 0 proxy-only login=[username]:[password]

EOF
```

```sh
brew services restart squid
```

### Tips

#### Defaults

```conf
*.local, 169.254/16
```

#### Clients

Provide proxy services for:

- Any: `all`
- Single Host: `192.168.0.1`
- Subnet: `192.168.1.0/24`
- Subnet: `10.0.0.0/16`

### Issues

#### Local Net

```sh
# Linux
sudo sed -i '/acl localnet src 172.16.0.0\/12/ s/^#//g' /etc/squid/squid.conf
sudo sed -i '/http_access allow localnet/ s/^#//g' /etc/squid/squid.conf
```

```sh
# Systemd
sudo systemctl restart squid
```

#### Docker Subnet

```sh
# Linux
sudo sed -i '/^acl localnet src .*/a acl localnet src 1.1.0.0\/16' /etc/squid/squid.conf
```

```sh
# Systemd
sudo systemctl restart squid
```

### Logs

#### Ubuntu

```sh
sudo tail -f /var/log/squid/access.log
sudo tail -f /var/log/squid/cache.log
```
