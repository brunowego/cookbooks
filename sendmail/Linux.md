# Linux

## Installation

### APT

```sh
sudo apt update
sudo apt -y install sendmail mailutils sendmail-bin
```

## Configuration

```sh
sudo vim /etc/mail/sendmail.mc
```

```sh
make -C /etc/mail
```

## Service

```sh
sudo systemctl restart sendmail
```

## Test

```sh
echo "Just testing my sendmail relay" | mail -s "Sendmail Relay" username@domain.com
```
