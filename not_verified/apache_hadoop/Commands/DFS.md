# Distributed File System (DFS)

## List

```sh
hdfs dfs -ls -R [/path]
```

### Remote

```sh
hdfs dfs -ls -R hdfs://[hostname]:8020
```

## Change mode

```sh
hdfs dfs -chmod 775 [/path]
```

## Make directory

```sh
hdfs dfs -mkdir [/path]
```

## Concatenate

```sh
hdfs dfs -cat [/path/to/file]
```

## Change owner

```sh
hdfs dfs -chown [user]:[group] [/path]
```

## Tail

```sh
hdfs dfs -tail -f [/path/to/file]
```

## Put

```sh
hdfs dfs -put [/path/to/file] [/path]
```

## Remove

```sh
hdfs dfs -rm -r [/path]
```
