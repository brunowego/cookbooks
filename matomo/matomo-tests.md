# Matomo Tests

## References

- [Tests](https://developer.matomo.org/guides/tests)
- [UI Tests](https://developer.matomo.org/guides/tests-ui)

## Dependencies

- [ImageMagick](/imagemagick.md)

## PHP Tests

### Setup Development

### PHP CLI

```sh
phpbrew -d install \
  --name=5.6.32-fpm-dev \
  --mirror=https://www.php.net \
  --downloader=wget \
  --stdout \
  5.6.32 \
  +default +fpm +mysql
```

```sh
sed -i 's/;\(always_populate_raw_post_data\)/\1/g' "$(php -i | grep -oE /.+/php.ini)"
sed -i '/^memory_limit/ s/128M/8G/' "$(php -i | grep -oE /.+/php.ini)"
```

#### Database

```sh
# Remove MySQL container and volume if exists
docker rm -f matomo-mysql
docker volume rm mysql-data

# Run MySQL
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h matomo-mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='matomo' \
  -e MYSQL_PASSWORD='matomo' \
  -e MYSQL_DATABASE='matomo_dev' \
  -v matomo-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name matomo-mysql \
  docker.io/library/mysql:5.7
```

```sh
docker exec -i matomo-mysql /bin/sh << EOSHELL
cat << EOF > /etc/mysql/conf.d/increase.cnf
[mysqld]
max_allowed_packet = 128M

EOF
EOSHELL
```

```sh
docker restart matomo-mysql
```

#### Configuration

```sh
cd /path/to/matomo

# Remove matomo configuration if exists
rm ./config/config.ini.php
```

```sh
export \
  MATOMO_DATABASE_HOST='127.0.0.1' \
  MATOMO_DATABASE_USERNAME='matomo' \
  MATOMO_DATABASE_PASSWORD='matomo' \
  MATOMO_DATABASE_DBNAME='matomo_dev' \
  MATOMO_DATABASE_TABLES_PREFIX='matomodev_'

#
php -r 'print_r(get_defined_vars()["_SERVER"]);' | grep MATOMO_
```

```sh
# Start Server
nohup php -d memory_limit=8G -S 127.0.0.1:8080 &

# Tail Server
tail -f ./nohup.out

#
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

1. Welcome! -> Next
2. System Check -> Next
3. Database Setup -> Next
4. Creating the Tables -> Next
5. Super User
   - Super user login: `admin`
   - Password and Password (repeat): `Pa$$w0rd!`
   - Email: `admin@example.com`
   - Next
6. Setup a Website
   - Website name: `Example`
   - Website URL: `http://example.com`
   - Website time zone:
   - Next
7. Tracking code for Example -> Next
8. Congratulations -> Continue to Matomo

```sh
# Disable trusted host check
./console config:set \
  --section='General' \
  --key='enable_trusted_host_check' \
  --value='0'
```

```sh
#
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u root \
  -p'root' \
  -v <<-\EOSQL
CREATE DATABASE IF NOT EXISTS `matomo_test`;
GRANT ALL PRIVILEGES ON *.* TO 'matomo'@'%';
FLUSH PRIVILEGES;
EOSQL

#
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_dev | \
    sed 's/matomodev_//' | \
      mysql \
        -h 127.0.0.1 \
        -P 3306 \
        -u matomo \
        -p'matomo' \
        matomo_test

# Backup
mysqldump \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_test \
  > ./tmp/matomo_test.sql

#
du -h ./tmp/matomo_test.sql

# Restore
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -u matomo \
  -p'matomo' \
  matomo_test \
  < ./tmp/matomo_test.sql
```

```sh
#
./console development:enable

#
./console config:set \
  'database_tests.host="127.0.0.1"' \
  'database_tests.username="matomo"' \
  'database_tests.password="matomo"' \
  'database_tests.dbname="matomo_test"' \
  'database_tests.tables_prefix=""'

#
./console config:set \
  'tests.http_host="127.0.0.1"' \
  'tests.request_uri="/"' \
  'tests.port="8080"'
```

### Running

```sh
cp ./tests/PHPUnit/phpunit.xml.dist ./tests/PHPUnit/phpunit.xml
```

#### Unit

```sh
# Plugin Insights
./console tests:run \
  --options='--stop-on-error' \
  ./plugins/Insights/tests/Unit

# Complete
./console tests:run \
  --options='--stop-on-error' \
  --testsuite unit
```

#### Integration

```sh
# Plugin Insights
./console tests:run \
  --options='--stop-on-error' \
  ./plugins/Insights/tests/Integration

# Complete
./console tests:run \
  --options='--stop-on-error' \
  --testsuite integration
```

#### System

- [PHP Redis](/php-redis.md)
- [PHP LDAP](/php-ldap.md)

```sh
# Complete
./console tests:run \
  --options='--stop-on-error' \
  --testsuite system
```

#### Plugin

```sh
# Complete
./console tests:run \
  --options='--stop-on-error' \
  --testsuite plugin
```

#### User Interface

```sh
( cd ./tests/lib/screenshot-testing && npm install )
```

```sh
# Plugin Insights
./console tests:run-ui \
  --plugin Insights

#
./console tests:run-ui \
  ./plugins/Insights/tests/UI
```

```sh
# xdebug.coverage_enable=0
# ./console tests:coverage
# ./console tests:run-ui
# ./console tests:sync-ui-screenshots
```
