# User

## Create user

```sql
CREATE USER username IDENTIFIED BY password;
```

```sql
CREATE USER username
	IDENTIFIED BY password
	DEFAULT TABLESPACE tbs_username_01

	QUOTA 20M on tbs_username_01;
```

## Drop

```sql
DROP USER username CASCADE;
```

## Create

```sql
GRANT CREATE SESSION TO username;
GRANT CREATE DATABASE LINK TO username WITH ADMIN OPTION;
```

## Grant

```sql
GRANT CREATE SESSION TO username;

GRANT CREATE SESSION TO username WITH ADMIN OPTION;

GRANT DBA TO username;
```

##### Alter

```sql
ALTER USER username IDENTIFIED BY password;

ALTER USER username GRANT CONNECT THROUGH username;
```

## Users

```sql
SELECT * FROM dba_users

SELECT username FROM dba_users;
```
