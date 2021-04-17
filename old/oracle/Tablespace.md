# Tablespace

## Create

```sql
CREATE TABLESPACE tbs_username_01
	DATAFILE 'tbs_username_f2.dat' SIZE 40M
	ONLINE;
```

## Drop

```sql
DROP TABLESPACE tbs_username_01 INCLUDING CONTENTS;
```

## Alter

```sql
ALTER TABLESPACE tbs_username_01 OFFLINE;
```
