# Drop

##

```sh
export MYSQL=mysql -h 127.0.0.1 -u root -p'root'
export MYSQL_DROP_QUERIES='SELECT CONCAT("DROP TABLE IF EXISTS `", table_name, "` CASCADE;") FROM information_schema.TABLES WHERE TABLE_SCHEMA = "[database]"'
export MYSQL_DROP=$(${MYSQL} -Bse ${MYSQL_DROP_QUERIES})
```

```sh
${MYSQL} -Bse "${MYSQL_DROP}" [database]
```
