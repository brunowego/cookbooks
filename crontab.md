# crontab

## Links

- [Crontab Generator](https://crontab-generator.org/)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install cron
```

#### YUM

```sh
yum check-update
sudo yum -y install cronie
```

### Commands

```sh
man crontab
```

### Tips

#### Directly Read

```sh
cat /etc/crontab
```

#### Load Specific

```sh
crontab /etc/cron.d/[filename]
```
