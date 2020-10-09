# Stunnel

## References

- [Downloads](https://www.stunnel.org/downloads.html)

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h stunnel \
  -p 8443:8443 \
  --name stunnel \
  docker.io/brunowego/stunnel:5.48-r0
```

```sh
docker exec -i stunnel /bin/sh << EOSHELL
cat << EOF > /etc/stunnel/conf.d/https.conf
[https]
client = yes
accept = 8443
connect = [hostname]:443
verify = 2
CAfile = /etc/ssl/certs/stunnel.pem
TIMEOUTclose = 300
TIMEOUTidle = 30

EOF
EOSHELL
```

```sh
docker restart stunnel
```

### Remove

```sh
docker rm -f stunnel
```

## CLI

### Installation

#### Homebrew

```sh
brew install stunnel
```

#### Source

##### Dependencies

###### APT

```sh
sudo apt update
sudo apt -y install g++ make libssl-dev
```

###### YUM

```sh
yum check-update
sudo yum -y install gcc-c++ make openssl-devel
```

##### Build & Install

```sh
curl https://www.stunnel.org/downloads/stunnel-5.56.tar.gz | tar -xzC /tmp
( cd /tmp/stunnel-5.56 && ./configure && make && sudo make install ) && rm -r /tmp/stunnel-5.56
```

> Make sure the package has not been updated.

### Configuration

```sh
# Darwin
sudo /bin/sh -c 'echo "include = /usr/local/etc/stunnel/conf.d" > /usr/local/etc/stunnel/stunnel.conf'

# Linux
( cd /usr/local/etc/stunnel && sudo cp stunnel.conf-sample stunnel.conf)

sudo sed -ri "s/^;include = (.*)/include = \1/g" /usr/local/etc/stunnel/stunnel.conf
```

> Remove or comment `[gmail-pop3]`, `[gmail-imap]` and `[gmail-smtp]` from `/usr/local/etc/stunnel/stunnel.conf`

```sh
# Linux
sudo sed -i '62,69 s/^/;/' /usr/local/etc/stunnel/stunnel.conf
sudo sed -i '71,78 s/^/;/' /usr/local/etc/stunnel/stunnel.conf
sudo sed -i '80,87 s/^/;/' /usr/local/etc/stunnel/stunnel.conf
```

```sh
stunnel
```

##### HTTPS

```sh
# Darwin
sudo mkdir -p /usr/local/etc/stunnel/conf.d

sudo tee /usr/local/etc/stunnel/conf.d/https.conf << EOF
[https]
client = yes
accept = 40443
connect = [hostname]:443
verify = 2
CAfile = /etc/ssl/certs/[certificate].pem
TIMEOUTclose = 300
TIMEOUTidle = 30
EOF
```

```sh
stunnel
```

### Commands

```sh
stunnel -help
```

### Tips

#### Accept Incoming

```sh
# Linux
sudo sed -i '/^accept/ s/127.0.0.1://' /etc/stunnel/stunnel.conf

sudo pkill stunnel
sudo /usr/sbin/stunnel
```

#### Kill Process

```sh
pkill stunnel
```
