# sysbench

```sh
vtctlclient -server 127.0.0.1:15999 ApplyVSchema -vschema "$(cat << EOF
{
  "sharded": true,
  "vindexes": {
    "hash": {
      "type": "hash"
    }
  },
  "tables": {
    "sbtest1": {
      "column_vindexes": [
        {
          "column": "id",
          "name": "hash"
        }
      ],
      "columns": [
        {
          "name": "c",
          "type": "CHAR"
        },
        {
          "name": "pad",
          "type": "CHAR"
        }
      ]
    }
  }
}
EOF
)" sharded_db
```
