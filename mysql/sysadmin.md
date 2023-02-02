# MySQL Sysadmin

## Analysis of Open Connections in the Database

### Group by Status

```sql
SELECT
  command,
  count(*)
FROM
  information_schema.processlist
WHERE
  command NOT LIKE 'Binlog%'
GROUP BY 1 ORDER BY 2 DESC;
```

### Grouped by User

```sql
SELECT
  user,
  count(*)
FROM
  information_schema.processlist
GROUP BY 1 ORDER BY 2 DESC;
```

### Certain User Grouped by Status

```sql
SELECT
  command,
  user,
  count(*)
FROM
  information_schema.processlist
WHERE
  user = 'user'
GROUP BY 1, 2 ORDER BY 1, 3 DESC;
```

### Grouped Connections by Origin of the Same User

```sql
SELECT
  CONCAT(
    '\'',
    user,
    '\'@\'',
    SUBSTRING_INDEX(host, ':', 1),
    '\''
  ) AS 'USER',
  COUNT(*) AS 'QTD_CONN'
FROM
  information_schema.processlist
WHERE
  user = 'user' AND command = 'Sleep'
GROUP BY 1 ORDER BY 2 DESC;
```

### Verifying the Maximum Amount of Configure Connections for a MySQL Instance

```sql
SHOW GLOBAL VARIABLES LIKE '%max_conn%';
```

### Analysis of Percentage Usage of a User's Connections in Relation to MAX_CONNECTIONS

```sql
SELECT
  user,
  truncate(count(*)/@@max_connections*100, 2) as "% conn instance"
FROM
  information_schema.processlist
WHERE
  user = 'user'
GROUP BY 1 ORDER BY 2 DESC;
```

## <!-- ```sql

create table dba.lista_connection_per_db
(
HORA TIMESTAMP,
DB VARCHAR(10),
CONNECTIONS INTEGER
);

--
create view dba.lista_connection_per_db as
SELECT
CURRENT_TIMESTAMP AS HORA,
DB.SCHEMA_NAME AS DB,
COALESCE(CONN.QTD_CONN,0) AS CONNECTIONS
FROM INFORMATION_SCHEMA.SCHEMATA DB
LEFT JOIN (
SELECT
DB,
COUNT(\*) AS 'QTD_CONN'
FROM
INFORMATION_SCHEMA.PROCESSLIST
GROUP BY 1
) CONN ON DB.SCHEMA_NAME = CONN.DB
-- WHERE DB.SCHEMA_NAME IN ('autobots','geti','gestaoinfra','colabore','convenio2','central','designx','dirco2','dirco2','fbb','gecin','gesitbdh','gprom2','gprom2','homolog','autobots','pgi2','pgpti','portalgeint','progrid','prolid','sisredex','storage2','transparencia')
ORDER BY 2;

-- Lista conexões por origem
SELECT
SUBSTRING_INDEX(host, ':', 1) as host,
COUNT(\*) AS 'QTD_CONN'
FROM
information_schema.processlist
where SUBSTRING_INDEX(host, ':', 1) = '172.20.0.226'
GROUP BY 1
ORDER BY 2 DESC;

```-->

```
