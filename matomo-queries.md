# Matomo Queries

## Installed Version

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'install_version';
EOSQL
```

## Last Completed Full Archiving

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'LastCompletedFullArchiving';
EOSQL
```

## Last Full Archiving Start Time

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'LastFullArchivingStartTime'
EOSQL
```

## Last Run Archive Day

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'lastRunArchiveday_1'
EOSQL
```

## Last Run Archive Periods ()

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'lastRunArchiveperiods_1'
EOSQL
```

## Mobile Messaging Delegated Management

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'MobileMessaging_DelegatedManagement'
EOSQL
```

## Privacy Manager

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'PrivacyManager.doNotTrackEnabled'
EOSQL
```

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'PrivacyManager.ipAnonymizerEnabled'
EOSQL
```

## Sites Manager Default Timezone

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'SitesManager_DefaultTimezone'
EOSQL
```

## TransactionLevel

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'TransactionLevel.testOption'
EOSQL
```

## Update Check

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SET
    time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'UpdateCheck_LastTimeChecked'
EOSQL
```

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'UpdateCheck_LatestVersion'
EOSQL
```

## Task Scheduler

PHP serialization.

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'TaskScheduler.timetable'
EOSQL
```
