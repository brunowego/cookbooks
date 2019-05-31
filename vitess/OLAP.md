# OLAP

```sh
vtctlclient -server 127.0.0.1:15999 ApplyVSchema -vschema "$(cat << EOF
{
  "sharded": false
}
EOF
)" lookup
```

```sh
vtctlclient -server 127.0.0.1:15999 ApplyVSchema -vschema "$(cat << EOF
{
  "sharded": true,
  "vindexes": {
    "hash": {
      "type": "hash"
    },
    "md5": {
      "type": "unicode_loose_md5"
    },
    "message_page_type_idx": {
      "type": "lookup",
      "params": {
        "table": "message_page_type_idx",
        "from": "message,vtype",
        "to": "page"
      },
      "owner": "messages"
    }
  },
  "tables": {
    "messages": {
      "column_vindexes": [
        {
          "column": "page",
          "name": "hash"
        },
        {
          "columns": [
            "message",
            "vtype"
          ],
          "name": "message_page_type_idx"
        }
      ]
    },
    "message_page_type_idx": {
      "column_vindexes": [
        {
          "column": "message",
          "name": "md5"
        }
      ]
    }
  }
}
EOF
)" matomo
# )" sharded_db
```

```sql
CREATE TABLE `messages` (
  `page` BIGINT(20) UNSIGNED,
  `time_created_ns` BIGINT(20) UNSIGNED,
  `message` VARCHAR(100),
  `vtype` VARCHAR(100),
  PRIMARY KEY (`page`, `time_created_ns`)
);
```

```sql
CREATE TABLE `message_page_type_idx` (
  `message` VARCHAR(100),
  `vtype` VARCHAR(100),
  `page` BINARY(8),
  PRIMARY KEY (`message`, `vtype`, `page`)
);
```
