# Examples

## Keyspaces

```sh
vtctlclient -server 127.0.0.1:15999 GetKeyspaces
```

```sh
vtctlclient -server 127.0.0.1:15999 CreateKeyspace [name]
```

```sh
vtctlclient -server 127.0.0.1:15999 DeleteKeyspace -recursive [name]
```

## Shards

```sh
vtctlclient -server 127.0.0.1:15999 CreateShard [keyspace/shard]
```

```sh
vtctlclient -server 127.0.0.1:15999 GetShard [keyspace/shard]
```

```sh
vtctlclient -server 127.0.0.1:15999 DeleteShard -even_if_serving [keyspace/shard]
```

## Generic

```sh
vtctlclient -server 127.0.0.1:15999 ListAllTablets [cell]
```

## Tablets

```sh
vtctlclient -server 127.0.0.1:15999 GetTablet [name]
```

```sh
vtctlclient -server 127.0.0.1:15999 InitTablet \
  -hostname=[cell]-[keyspace]-[shard]-replica-1.vttablet \
  -mysql_port=3306 \
  -port=15002 \
  -grpc_port=16002 \
  -keyspace=[keyspace] \
  -shard=[shard] \
  [cell]-0000000101 replica
```

```sh
vtctlclient -server 127.0.0.1:15999 InitTablet \
  -hostname=[cell]-[keyspace]-[shard]-replica-0.vttablet \
  -mysql_port=3306 \
  -port=15002 \
  -grpc_port=16002 \
  -keyspace=[keyspace] \
  -shard=[shard] \
  [cell]-0000000100 master
```

```sh
vtctlclient -server 127.0.0.1:15999 DeleteTablet -allow_master [cell]-0000000100
```

```sh
vtctlclient -server 127.0.0.1:15999 DeleteTablet [cell]-0000000101
```

```sh
vtctlclient -server 127.0.0.1:15999 RebuildKeyspaceGraph [keyspace]
```

## Cells

```sh
vtctlclient -server 127.0.0.1:15999 GetCellInfoNames
```

```sh
vtctlclient -server 127.0.0.1:15999 GetCellInfo [cell]
```

## Schema, Version, Permissions

```sh
cat << \EOF > /tmp/schema.sql
CREATE TABLE `users` (
    `user_id` bigint,
    `name` varchar(128),
    PRIMARY KEY (`user_id`)
);

CREATE TABLE `users_name_idx` (
    `user_id` bigint,
    `name` varchar(128),
    PRIMARY KEY (`name`, `user_id`)
);
EOF
```

```sh
vtctlclient -server 127.0.0.1:15999 ApplySchema -sql-file /tmp/schema.sql [database]
```

```sh
vtctlclient -server 127.0.0.1:15999 GetVSchema [keyspace]
```

```sh
cat << EOF > /tmp/vschema.json
{
  "sharded": true,
  "vindexes": {
    "hash": {
      "type": "hash"
    },
    "md5": {
      "type": "unicode_loose_md5",
      "params": {},
      "owner": ""
    },
    "users_name_idx": {
      "type": "lookup_hash",
      "params": {
        "from": "name",
        "table": "users_name_idx",
        "to": "user_id"
      },
      "owner": "users"
    }
  },
  "tables": {
    "users": {
      "column_vindexes": [
        {
          "column": "user_id",
          "name": "hash"
        },
        {
          "column": "name",
          "name": "users_name_idx"
        }
      ],
      "auto_increment": null
    },
    "users_name_idx": {
      "type": "",
      "column_vindexes": [
        {
          "column": "name",
          "name": "md5"
        }
      ],
      "auto_increment": null
    }
  }
}
EOF
```

```sh
vtctlclient -server 127.0.0.1:15999 ApplyVSchema -vschema_file /tmp/vschema.json [keyspace]
```

## Running

```sh
vtctlclient -server 127.0.0.1:15999 MigrateServedTypes vitess/0 master
```

## Serving Graph

```sh
vtctlclient -server 127.0.0.1:15999 GetSrvKeyspaceNames [cell]
```

```sh
vtctlclient -server 127.0.0.1:15999 GetSrvKeyspace [cell] [keyspace]
```

```sh
vtctlclient -server 127.0.0.1:15999 GetSrvVSchema [cell]
```

```sh
vtctlclient -server 127.0.0.1:15999 DeleteSrvVSchema [cell]
```

```sh
vtctlclient -server 127.0.0.1:15999 RebuildVSchemaGraph
```

## Jobs

| Name | Kind | Cell | Command |
| --- | --- | --- | --- |
| `mst0` | `vtctlclient` | `zone1` | `MigrateServedTypes [shard]/0 [master|rdonly|replica]` |
| `dsr0` | `vtctlclient` | `zone1` | `DeleteShard -recursive [shard]/0` |
| `cks` | `vtctlclient` | `zone1` | `CreateKeyspace -served_from='master:[shard],replica:[shard],rdonly:[shard]' [shard]` |
| `msf0` | `vtctlclient` | `zone1` | `MigrateServedFrom [shard]/0 [master|rdonly|replica]` |
| `sstc0` | `vtctlclient` | `zone1` | `SetShardTabletControl -blacklisted_tables=[shard1],corder -remove [shard2]/0 [master|rdonly|replica]` |
| `vsc0` | `vtworker` | `zone1` | `VerticalSplitClone -min_healthy_rdonly_tablets=1 -tables=[shard],corder [shard]/0` |
| `scm0` | `vtworker` | `zone1` | `SplitClone -min_healthy_rdonly_tablets=1 [shard]/0` |

### Example

```yml
jobs:
  - name: mst0
    kind: vtctlclient
    cell: zone1
    command: 'MigrateServedTypes customer/0 master'
```
