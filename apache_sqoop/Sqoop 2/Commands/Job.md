# Job

## List

```sh
sqoop job --list
```

## Show

```sh
sqoop job --show myjob
```

## Execute

```sh
sqoop job --exec myjob
```

##

```sh
sqoop job --create myjob \
  -- import \
  --connect jdbc:mysql://localhost/db \
  --username root \
  --table employee \
  --m 1
```
