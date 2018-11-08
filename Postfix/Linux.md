# Linux

## Installation

### APT

```sh
sudo apt update
sudo apt install postfix
```

## Configuration

```sh
sudo vim /etc/postfix/main.cf
```

```cf
myhostname = domain.com
```

```sh
sudo vim /etc/postfix/virtual
```

```txt
username@domain.com username
```

```sh
sudo postmap /etc/postfix/virtual
sudo systemctl restart postfix
```

```sh
vim /var/mail/username
```

```sh
sudo apt install mailutils
sudo mail
```

```sh
sudo ufw allow 25
```
