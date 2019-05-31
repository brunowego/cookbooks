# Linux

## Installation

### APT

```sh
sudo apt update
sudo apt -y install postgresql-server postgresql-contrib
```

### Yum

```sh
sudo yum check-update
sudo yum -y install postgresql-server postgresql-contrib
```

## Initialize

```sh
sudo postgresql-setup initdb
```

## Service

```sh
sudo systemctl enable --now postgresql
```

## Configuration

### Local

```sh
sudo -u postgres psql -c 'ALTER USER postgres PASSWORD "postgres"'
```

```sh
sudo sed -i '/^local/s/peer/md5/g' /var/lib/pgsql/data/pg_hba.conf
```

```sh
sudo systemctl restart postgresql
```

### Host

```sh
sudo sed -i 's/^#listen_addresses =/listen_addresses =/' /var/lib/pgsql/data/postgresql.conf
```

```sh
sudo sed -i "/^listen_addresses/s/'localhost'/'*'\t/g" /var/lib/pgsql/data/postgresql.conf
```

```sh
sudo sh -c 'echo -e "host\tall\t\tall\t\t0.0.0.0/0\t\tmd5" >> /var/lib/pgsql/data/pg_hba.conf'
```

```sh
sudo systemctl restart postgresql
```

## Checking

```sh
ss -nlt | grep 5432
```

## Logs

```sh
sudo tail -f /var/lib/pgsql/initdb.log
```

```sh
sudo tail -f /var/lib/pgsql/data/pg_log/postgresql-Thu.log
```
