# MySQL Server

<!--
https://app.pluralsight.com/paths/skill/mysql
-->

## References

- [Epoch Converter](https://www.epochconverter.com/programming/mysql)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
# 5.x
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='dev' \
  -e MYSQL_PASSWORD='dev' \
  -e MYSQL_DATABASE='dev' \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name mysql \
  --network workbench \
  docker.io/library/mysql:5.7

# 8.x
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='dev' \
  -e MYSQL_PASSWORD='dev' \
  -e MYSQL_DATABASE='dev' \
  -v mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name mysql \
  --network workbench \
  docker.io/library/mysql:8.0 \
    --default-authentication-plugin=mysql_native_password
```

### Utils

#### Dump

```sh
#
docker exec -i mysql mysqldump --help

#
docker run -it --rm \
  -v $(pwd)/dump:/dump \
  docker.io/library/mysql:latest sh -c 'mysqldump \
    --column-statistics=0 \
    -h <hostname> \
    -P 3306 \
    -u root \
    -p"root" \
    <database> > /dump/<filename>.sql'
```

#### Import

```sh
#
docker exec -i mysql mysqlimport --help

#
docker run -it --rm \
  -v $(pwd)/import:/import \
  docker.io/library/mysql:latest sh -c 'mysqlimport \
    -h <hostname> \
    -P 3306 \
    -u root \
    -p"root" \
    <database> \
    /import/<filename>.sql'
```

### Issues

<!-- ####

```log
2019-10-23T16:58:12.893902Z 5 [Warning] InnoDB: Cannot open table <db-name>/[table-name] from the internal data dictionary of InnoDB though the .frm file for the table exists. Please refer to http://dev.mysql.com/doc/refman/5.7/en/innodb-troubleshooting.html for how to resolve the issue.
```

```sh
docker exec mysql sh -c 'echo "innodb_force_recovery = 1" >> /etc/mysql/mysql.conf.d/mysqld.cnf'
```

```sh
docker restart mysql
``` -->

### Remove

```sh
#
docker rm -f mysql

#
docker volume rm mysql-data
```

## Helm

### References

- [Configuration](https://github.com/helm/charts/tree/master/stable/mysql#configuration)

### Repository

```sh
helm repo add bitnami 'https://charts.bitnami.com/bitnami'
helm repo update
```

### Install

```sh
#
kubectl create ns mysql-system
# kubectl create ns database

#
helm search repo -l bitnami/mysql

#
helm install mysql bitnami/mysql \
  --namespace mysql-system \
  --version 9.4.4 \
  -f <(cat << EOF
auth:
  rootPassword: root
  username: dev
  password: dev
  database: dev
EOF
)
```

<!--
kubectl port-forward \
  --address 0.0.0.0 \
  -n mysql-system \
  svc/mysql \
  3306:3306
-->

<!-- ### NGINX Ingress

```sh
helm upgrade nginx-ingress stable/nginx-ingress -f <(yq w <(helm get values nginx-ingress) tcp.3306 mysql/mysql:3306)
``` -->

### Status

```sh
kubectl rollout status deploy/mysql -n mysql-system
```

### Logs

```sh
kubectl logs \
  -l 'app=mysql' \
  -n mysql-system \
  -f
```

### Secret

```sh
kubectl get secret mysql \
  -o jsonpath='{.data.mysql-root-password}' \
  -n mysql-system | \
    base64 -d; echo
```

### Delete

```sh
helm uninstall mysql -n mysql-system

kubectl delete ns mysql-system \
  --grace-period=0 \
  --force
```

## CLI

### Dependencies

- [MySQL Client](/mysql/client.md)

### Installation

#### 5.x

##### Homebrew

```sh
brew install mysql@5.7
```

##### YUM

```sh
yum check-update

# Repo: Community Release
sudo yum -y localinstall https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

## Version 5.5
sudo yum-config-manager --disable mysql57-community && \
  sudo yum-config-manager --enable mysql55-community && \
  sudo yum -y install mysql-community-server

## Version 5.6
sudo yum-config-manager --disable mysql57-community && \
  sudo yum-config-manager --enable mysql56-community && \
  sudo yum -y install mysql-community-server

## Version 5.7
sudo yum -y install mysql-community-server

# Repo: Software Collections
sudo yum -y install rh-mysql57-mysql-server
```

#### 8.x

##### Homebrew

```sh
brew install mysql
```

##### YUM

```sh
yum check-update

# Repo: Community Release
sudo yum -y localinstall https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
sudo yum -y install mysql-community-server
```

##### Chocolatey

```sh
choco install -y mysql
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# MySQL Server 5.7
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# MySQL Server 8.x
export PATH="/usr/local/opt/mysql/bin:$PATH"
```

```sh
sudo su - "$USER"
```

### Service

```sh
# Homebrew
brew services list
brew services start mysql@5.7 # 5.7
brew services start mysql # 8.x

# Linux
sudo systemctl enable --now mysqld
```

### Health Check

```sh
# Process Running
ps -ef | grep mysql

# Listen Port
lsof -i :3306
```

### Configuration

#### Bind Address

```sh
# Darwin
sudo sed -i '/^bind-address/ s/127.0.0.1/0.0.0.0/g' /usr/local/etc/my.cnf

# Linux
sudo /usr/bin/sh -c 'echo -e "\nbind-address=0.0.0.0" >> /etc/my.cnf'
sudo /usr/bin/sh -c 'echo "skip-grant-tables" >> /etc/my.cnf'

# Homebrew
brew services restart mysql@5.7 # 5.7
brew services restart mysql # 8.x

# Linux
sudo systemctl restart mysqld
```

#### Password Definition

```sh
# Homebrew
mysql_secure_installation

# Or
mysql -u root -p -v <<-\EOSQL
UPDATE mysql.user
  SET authentication_string=PASSWORD('root'), plugin='mysql_native_password'
  WHERE user='root'
  AND host='localhost';
FLUSH PRIVILEGES;
EOSQL
```

#### Create User

```sh
# Current Root Password
grep 'temporary password' /var/log/mysqld.log # Linux

# Change Root Password
mysql -u root -p --connect-expired-password -ve 'SET PASSWORD = PASSWORD("<password>")'

# Create
mysql -u root -p -ve 'CREATE USER "<username>"@"%" IDENTIFIED BY "<password>"'
```

### Watch Logs

```sh
# Homebrew
/usr/libexec/PlistBuddy \
  -c 'Add :StandardOutPath string "/usr/local/var/log/mysql@5.7/mysql-stdout.log"' \
  "$(brew --prefix mysql@5.7)"/homebrew.mxcl.mysql@5.7.plist

/usr/libexec/PlistBuddy \
  -c 'Add :StandardErrorPath string "/usr/local/var/log/mysql@5.7/mysql-stderr.log"' \
  "$(brew --prefix mysql@5.7)"/homebrew.mxcl.mysql@5.7.plist

#
mkdir -p /usr/local/var/log/mysql@5.7

#
brew services restart mysql@5.7

#
tail -f /usr/local/var/log/mysql@5.7/mysql-stdout.log
tail -f /usr/local/var/log/mysql@5.7/mysql-stderr.log
```

### Usage

```sh
#
mysql -u root -p -ve 'CREATE DATABASE IF NOT EXISTS `<db-name>` DEFAULT CHARACTER SET utf8mb4'
mysql -u root -p -ve "CREATE USER '<user-name>'@'%' IDENTIFIED BY '<user-password>'"
mysql -u root -p -ve 'GRANT ALL PRIVILEGES ON `<db-name>`.* TO "<user-name>"@"%"'
mysql -u root -p -ve 'FLUSH PRIVILEGES'

# Connect
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root'
```

### Tips

#### Clone Database

```sh
#
mysql \
  -h <host> \
  -P 3306 \
  -u <username> \
  -p \
  -ve 'CREATE DATABASE IF NOT EXISTS `<db-name>`'

#
mysqldump \
  -h <host> \
  -P 3306 \
  -u <username> \
  -p'<password>' \
  <db-name> | \
    mysql \
      -h <host> \
      -P 3306 \
      -u <username> \
      -p'<password>' \
      <db-name>

#
ps <pid>
```

#### Dump Database

```sh
# To file
mysqldump \
  -h <host> \
  -P 3306 \
  -u <username> \
  -p'<password>' \
  --databases <database> \
  > <filename>.sql

# To PostgreSQL
mysqldump \
  -h <host> \
  -P 3306 \
  -u <username> \
  -p'<password>' \
  --databases <database>
  --extended-insert=FALSE \
  --no-create-info \
  --compact \
  --compatible=postgresql
  > <filename>.sql
```

#### Import Database

```sh
# From file
mysql \
  -h <host> \
  -P 3306 \
  -u <username> \
  -p'<password>' \
  <database> \
  < <filename>.sql

## Alternatives
mysqlimport \
  -h <host> \
  -P 3306 \
  -u <username> \
  -p'<password>' \
  <database> \
  <filename>.sql
```

#### SSH Tunnel

```sh
ssh \
  -p <port> \
  -N \
  -L 3307:<hostname>:3306 \
  <username>@<hostname>

mysql \
  -h 127.0.0.1 \
  -P 3307
```

#### Git ignore

```sh
echo '/dump*.sql' >> ~/.gitignore_global
```

<!-- #### Diff

https://stackoverflow.com/questions/225772/compare-two-mysql-databases

TODO -->

#### Proxy NGINX

Add to `/usr/local/etc/nginx/nginx.conf` the below code:

```conf
stream {
    upstream mysql {
        server <hostname>:3306;
    }

    server {
        listen 3306;

        proxy_connect_timeout 1s;
        proxy_pass mysql;
    }
}
```

```sh
# Homebrew
## 5.7
brew services restart mysql@5.7

## 8.x
brew services restart mysql

# Test
sudo nginx -t
```

#### Shell

```sh
#! /bin/sh
set -e

MYSQL="mysql -u root -p${MYSQL_ROOT_PASSWORD}"

echo 'Creating [scope]: [name]'

$MYSQL <<-EOSQL
<sql>
EOSQL
```

#### Comment Locks

```sh
sed -i 's/^LOCK\ TABLES/\-\-\ LOCK\ TABLES/g' <filename>
```

```sh
sed -i 's/^UNLOCK\ TABLES/\-\-\ UNLOCK\ TABLES/g' <filename>
```

#### Drop

```sh
export MYSQL=mysql -h 127.0.0.1 -u root -p'root'
export MYSQL_DROP_QUERIES='SELECT CONCAT("DROP TABLE IF EXISTS `", table_name, "` CASCADE;") FROM information_schema.TABLES WHERE TABLE_SCHEMA = "<database>"'
export MYSQL_DROP=$(${MYSQL} -Bse ${MYSQL_DROP_QUERIES})
```

```sh
${MYSQL} -Bse "${MYSQL_DROP}" <database>
```

### Issues

#### GTIDs

```log
Warning: A partial dump from a server that has GTIDs will by default include the GTIDs of all transactions, even those that changed suppressed parts of the database. If you don't want to restore GTIDs, pass --set-gtid-purged=OFF. To make a complete dump, pass --all-databases --triggers --routines --events.
```

```sh
mysqldump \
  ...
  --set-gtid-purged=OFF \
  ...
```

#### Column Statistics

```log
mysqldump: Couldn't execute '...': Unknown table 'COLUMN_STATISTICS' in information_schema (1109)
```

```sh
mysqldump \
  ...
  --column-statistics=0 \
  ...
```

#### Connection Allowed

```log
Host '0.0.0.0' is not allowed to connect to this MySQL server"
```

```sh
mysql -u root -p -ve "GRANT ALL PRIVILEGES ON *.* TO '<username>'@'%'"
mysql -u root -p -ve 'FLUSH PRIVILEGES'
```

#### Policy Password

```log
ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
```

```sql
UNINSTALL PLUGIN validate_password;
```

#### GTID

```log
ERROR 1193 (HY000): Unknown system variable 'GTID_PURGED'
```

```sh
mysqldump \
  -h <host> \
  -P 3306 \
  -u <username> \
  -p<password> \
  --set-gtid-purged OFF \
  --databases <database> \
  > <filename>
```

#### Authentication plugin

```log
Unable to load authentication plugin 'caching_sha2_password'.
```

```sh
# Linux
mysqld --default-authentication-plugin=mysql_native_password
```

### Uninstall

```sh
# Homebrew
brew services stop mysql@5.7

brew uninstall mysql@5.7

rm -fR /usr/local/var/mysql
rm /usr/local/etc/my.cnf*
```
