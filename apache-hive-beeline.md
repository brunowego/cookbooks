# Apache Hive Beeline

## CLI

### Commands

```sh
beeline --help
```

### Usage

<!--
beeline --silent=true -e 'SHOW TABLES'
-->

```sh
# Start
beeline --incremental=true

# Connect with User/Password
beeline -u 'jdbc:hive2://[hostname]:10000' -n [username] -p [password]

# Connect with Kerberos
beeline -u 'jdbc:hive2://[hostname]:10000/[name];principal=[username]/_HOST@[REALM]'

# Connect with ZooKeeper
beeline -u 'jdbc:hive2://[hostname]:2181/[name];serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2'

# Run command
beeline -u 'jdbc:hive2://[hostname]:10000' -n [username] -p [password] -e '[command];'
```

### Query

```sh
# Connect
!connect 'jdbc:hive2://[hostname]:10000/default'

# Reconnect
!reconnect 'jdbc:hive2://[hostname]:10000/default'

# Quit
!quit

# Help
!help
```
