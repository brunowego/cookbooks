# logrotate

## CLI

### Installation

#### Homebrew

```sh
brew install logrotate
```

#### YUM

```sh
yum check-update
sudo yum -y install logrotate
```

#### APT

```sh
sudo apt update
sudo apt -y install logrotate
```

#### Chocolatey

```sh
choco install -y logrotate
```

### Configuration

```sh
vim /etc/logrotate.conf
```

#### Apache

```sh
vim /etc/logrotate.d/apache
```

```txt
###ROOT###/var/log/httpd/*_log {
    missingok
    rotate 52
    compress
    delaycompress
    notifempty
    create 640 ###SITE### ###SITE###
    sharedscripts
    postrotate
        ###ROOT###/etc/init.d/apache reload
    endscript
}
```

### Commands

```sh
logrotate --help
```

### Usage

```sh
#
logrotate -f /etc/logrotate.conf
```
