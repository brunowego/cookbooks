# Sendmail

## Installation

### APT

```sh
sudo apt update
sudo apt -y install sendmail
```

### YUM

```sh
yum check-update
sudo yum -y install sendmail
```

## Commands

```sh
man sendmail
```

## Test

```sh
echo 'Subject: Sending an email using sendmail' | sendmail -v touser@example.com
```
