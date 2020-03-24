# Matomo Queries

##

```sh
mysql \
  -h 127.0.0.1 \
  -P 3306 \
  -D matomo_dev \
  -u matomo \
  -p'matomo' \
  -v <<-\EOSQL

EOSQL
```

## Installed Version

```sql
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'install_version';
```

## Last Completed Full Archiving

```sql
SET time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'LastCompletedFullArchiving';
```

## Last Full Archiving Start Time

```sql
SET time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'LastFullArchivingStartTime'
```

## Last Run Archive Day

```sql
SET time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'lastRunArchiveday_1'
```

## Last Run Archive Periods ()

```sql
SET time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'lastRunArchiveperiods_1'
```

## Mobile Messaging Delegated Management

```sql
SET time_zone = 'America/Sao_Paulo';

SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'MobileMessaging_DelegatedManagement'
```

## Privacy Manager

```sql
SET time_zone = 'America/Sao_Paulo';

SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'PrivacyManager.doNotTrackEnabled'
```

```sh
SET time_zone = 'America/Sao_Paulo';

SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'PrivacyManager.ipAnonymizerEnabled'
```

## Sites Manager Default Timezone

```sql
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'SitesManager_DefaultTimezone'
```

## TransactionLevel

```sql
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'TransactionLevel.testOption'
```

## Update Check

```sql
SET time_zone = 'America/Sao_Paulo';

SELECT
    CAST(from_unixtime(option_value, '%Y-%m-%d %h:%i:%s') AS DATETIME)
FROM
    matomo_option
WHERE
    option_name = 'UpdateCheck_LastTimeChecked'
```

```sql
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'UpdateCheck_LatestVersion'
```

## Task Scheduler

PHP serialization.

```sql
SELECT
    option_value
FROM
    matomo_option
WHERE
    option_name = 'TaskScheduler.timetable'
```

##

```sql
SELECT
    DISTINCT idaction_url,
    COUNT(idaction_url) AS counts
FROM
    matomo_log_link_visit_action
WHERE
    server_time > '2020-03-09 12:00:00'
    AND server_time <= '2020-03-09 13:00:00'
GROUP BY
    idaction_url
ORDER BY
    counts DESC;
```

## Last Visit Action

```sql
SELECT
    MAX(server_time)
FROM
    matomo_log_link_visit_action;
```

## Last 1 Minute Visits Actions

```sql
SET time_zone = 'America/Sao_Paulo';
SET time_zone = 'UTC';

SELECT DATE_SUB(NOW(), INTERVAL 1 MINUTE);

SELECT
    COUNT(1)
FROM
    matomo_log_link_visit_action
WHERE
    server_time > DATE_SUB(NOW(), INTERVAL 1 MINUTE);
```

```sql
SELECT
    COUNT(1)
FROM
    matomo_log_link_visit_action
WHERE
    server_time > DATE_SUB(
        (
            SELECT
                MAX(server_time)
            FROM
                matomo_log_link_visit_action
        ),
        INTERVAL 1 MINUTE
    );
```
