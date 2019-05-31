# Commands

## Start

```sh
beeline --incremental=true
```

## Connect

```sh
beeline -u 'jdbc:hive2://[hostname]:10000' -n [username] -p [password]
```

### With Kerberos

```sh
beeline -u 'jdbc:hive2://[hostname]:10000/[name];principal=[username]/_HOST@[REALM]'
```

### With ZooKeeper

```sh
beeline -u 'jdbc:hive2://[hostname]:2181/[name];serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2'
```

## Run command

```sh
beeline -u 'jdbc:hive2://[hostname]:10000' -n [username] -p [password] -e '[command];'
```
