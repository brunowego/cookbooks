# Percona XtraBackup

<!--
https://github.com/bajrang0789/ubuntu-mysql-inc-xtrabackup
-->

## CLI

### Installation

#### Homebrew

```sh
brew install percona-xtrabackup
```

#### YUM

```sh
# Version 2.3
yum check-update

# Repo: EPEL
sudo yum -y install percona-xtrabackup

# Version 2.4
sudo yum -y localinstall https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.4/binary/redhat/7/x86_64/percona-xtrabackup-24-2.4.4-1.el7.x86_64.rpm

# Version 8.0
sudo yum -y localinstall https://www.percona.com/downloads/Percona-XtraBackup-LATEST/Percona-XtraBackup-8.0-7/binary/redhat/7/x86_64/percona-xtrabackup-80-8.0.7-1.el7.x86_64.rpm
```

#### APT

```sh
sudo apt update
sudo apt -y install percona-xtrabackup
```

### Commands

```sh
xtrabackup -?
innobackupex -?
xbstream -?
```

### Examples

<!-- ####

```sh
sudo mkdir -p /var/lib/mysql
sudo mkdir -p /var/data/mysql/backup
```

```sh
sudo innobackupex \
  --host='127.0.0.1' \
  --port='3306' \
  --user='root' \
  --password='root' \
  --databases='[db-name]' \
  --parallel=4 \
  /var/data/mysql/backup
``` -->

<!-- ####

```sh
mysqld -v | grep data_dir
```

```sh
sudo systemctl stop mysqld
```

```sh
rm -rf /var/lib/mysql/*
```

```sh
cat xtrabackup.stream | xbstream -x -C /var/lib/mysql
```

```sh
xtrabackup --prepare --target-dir=/var/lib/mysql
```

```sh
chown -R mysql:mysql /var/lib/mysql
```

```sh
# Systemd
sudo systemctl start mysqld
``` -->

#### Backup with compress (Parallel enabled)

```sh
xtrabackup \
  --backup \
  --parallel=4 \
  --compress \
  --compress-threads=4 \
  --host='127.0.0.1' \
  --user='root' \
  --password='root' \
  --databases='[db-name]'
```

#### List Backup Files

```sh
ls ~/xtrabackup_backupfiles
```

#### Decompress it

```sh
xtrabackup \
  --parallel=4 \
  --decompress
```

#### Then prepare as normal

```sh
xtrabackup --prepare

# xtrabackup --prepare --target-dir=/var/lib/mysql
```
