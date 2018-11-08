# Linux

## Dependencies

### APT

```sh
sudo apt update
sudo apt -y install libssl-dev
```

### YUM

```sh
sudo yum check-update
sudo yum -y install openssl-devel
```

## Installation

```sh
curl https://www.stunnel.org/downloads/stunnel-5.50.tar.gz | tar -xzC /tmp
( cd /tmp/stunnel-5.50 && ./configure && make && sudo make install ) && rm -r /tmp/stunnel-5.50
```
