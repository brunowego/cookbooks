# MySQL Queries

## Client

```sh
export MYSQL_HOST=127.0.0.1

# REPL
mysql -u root -p'root'

# Execute
mysql -u root -p'root' -ve 'SELECT VERSION()'

# Here document
mysql -u root -p'root' -v <<-\EOSQL
SELECT VERSION();
EOSQL

# Docker
docker exec -it mysql /usr/bin/mysql -u root -p'root'
```

```sql
quit;
```

## User

```sql
-- Create
CREATE USER '[username]'@'%' IDENTIFIED BY '[password]';

-- Add Privileges
GRANT ALL PRIVILEGES ON `[db-name]`.* TO '[username]'@'%';

-- Flush
FLUSH PRIVILEGES;

-- Change Password
ALTER USER '[username]'@'%' IDENTIFIED BY '[password]';

-- Show Users Info
SELECT User FROM mysql.user;

-- Grants
SHOW GRANTS;
SHOW GRANTS FOR CURRENT_USER;
SHOW GRANTS FOR CURRENT_USER();
SHOW GRANTS FOR '[username]'@'%';

-- Remove
DROP USER '[username]'@'%';
```

## Logs

```sql
-- List Variables
SHOW VARIABLES LIKE 'general_log%';

-- General Log
SELECT @@general_log;

SET GLOBAL general_log = 'ON'; -- OFF

-- General Log file
SELECT @@general_log_file;

-- Error Log File
SELECT CONCAT(@@datadir, @@log_error);

-- Log Slow
SHOW VARIABLES LIKE 'slow_query_log';

SET GLOBAL slow_query_log = 'ON'; -- OFF

--
SHOW VARIABLES LIKE 'log_queries_not_using_indexes'

SET GLOBAL log_queries_not_using_indexes = 'ON'

--
SHOW VARIABLES LIKE 'slow_query_log_file';

SET GLOBAL slow_query_log_file = '/var/lib/mysql/mysql-slow.log';

--
SHOW VARIABLES LIKE 'log_slow_rate%';

--
SHOW VARIABLES LIKE 'long_query_time';

SET GLOBAL long_query_time = 20
```

## Table

```sql
-- Drop
SELECT
    CONCAT('DROP TABLE IF EXISTS `', table_name, '` CASCADE;')
FROM
    information_schema.TABLES
WHERE
    TABLE_SCHEMA = '[dbname]';
```

## Select

```sql
-- Socket Path
SELECT @@socket;

-- Data Directory
SELECT @@datadir;

-- Base Directory
SELECT @@basedir;

-- Pid file
SELECT @@pid_file;

-- Character Set
SELECT @@character_set_database;

-- Version
SELECT VERSION();

-- Database
SELECT DATABASE();

-- Current User
SELECT CURRENT_USER()
```

## Find

```sql
-- Duplicates
SELECT
    DISTINCT(column_name) AS column,
    COUNT(column_name) AS columnCount
FROM
    table_name
GROUP BY
    column_name
HAVING
    columnCount > 1
```

## Where

```sql
-- Between
SELECT
    *
FROM
    table_name
WHERE
    column_name BETWEEN '2010-11-11'
    AND '2010-11-30'

-- Simple compare
SELECT
    *
FROM
    table_name
WHERE
    YEAR(column_name) = '2010'

-- Having
SELECT
    *
FROM
    table_name
HAVING
    column_name > CURDATE()
```

## Update

```sql
-- Replace
UPDATE
    table_name
SET
    column_name = REPLACE(column_name, 'find string', 'to string');

-- Multiple update
SELECT
    *
FROM
    table
WHERE
    id IN (1, 2, 3,...)

-- Reset primary key
SET
    @temp = 0;
UPDATE
    table_name
SET
    column_name = @temp: = (@temp + 1);

-- Remove Anything Before (E-mail example)
SELECT
    SUBSTRING(email, INSTR(email, '@') + 1)
FROM
    table_name
UPDATE
    table_name
SET
    column_name = SUBSTRING(email, INSTR(email, '@') + 1)

-- Remove Anything After (E-mail example)
SELECT
    SUBSTRING_INDEX(email, '@', 1)
FROM
    table_name
UPDATE
    table_name
SET
    email = SUBSTRING_INDEX(email, '@', 1)

-- Update Date - Invert date format
UPDATE
    table_name
SET
    column_name = DATE_FORMAT(STR_TO_DATE(column_name, '%d/%m/%Y'), '%Y-%m-%d');
```

## Utils

```sql
-- Compute a cyclic redundancy check value
SELECT CRC32('MySQL');

-- Megabyte
SELECT
    TABLE_SCHEMA AS 'Database',
    SUM(data_length + index_length) / 1024 / 1024 AS 'Size (MB)'
FROM
    information_schema.TABLES
GROUP BY
    TABLE_SCHEMA;

-- Gigabyte
SELECT
    TABLE_SCHEMA AS 'Database',
    SUM(data_length + index_length) / 1024 / 1024 / 1024 AS 'Size (GB)'
FROM
    information_schema.TABLES
GROUP BY
    TABLE_SCHEMA;

-- Uptime
SELECT
    TIME_FORMAT(SEC_TO_TIME(VARIABLE_VALUE), '%Hh %im') AS Uptime
FROM
    performance_schema.global_status
WHERE
    VARIABLE_NAME = 'Uptime';

-- Rows Count
SELECT
    TABLE_NAME,
    TABLE_ROWS
FROM
    information_schema.TABLES
WHERE
    TABLE_SCHEMA = '[dbname]';

-- Select by domain and distinct
SELECT
    DISTINCT (
        SUBSTR(
            email,
            INSTR(email, '@') + 1,
            LENGTH(email) - (INSTR(email, '@') + 1) - LENGTH(SUBSTRING_INDEX(email, '.', -1))
        )
    )
FROM
    table_name
GROUP BY
    email

-- Select by domain with @
SELECT
    SUBSTR(email, INSTR(email, '@'), INSTR(email, '.'))
FROM
    table_name

-- Select the 15 more domain existing in list
SELECT
    SUBSTRING_INDEX(email, '@', -1) as Domain,
    count(*) as Total
FROM
    table_name
GROUP BY
    Domain
ORDER BY
    Total DESC
LIMIT
    15

-- Select id, account and domain from email
SELECT
    id,
    SUBSTRING(
        email
        FROM
            1 FOR POSITION('@' IN email) -1
    ) AS account,
    SUBSTRING(
        email
        FROM
            POSITION('@' IN email) + 1
    ) AS domain
FROM
    table_name
ORDER BY
    id

-- Update from domain email
UPDATE
    table_name AS u
    INNER JOIN table_name AS us ON u.id = us.id
SET
    u.username = (
        SELECT
            SUBSTRING(
                us.email
                FROM
                    1 FOR POSITION('@' IN us.email) -1
            ) AS new_username
    )
```
