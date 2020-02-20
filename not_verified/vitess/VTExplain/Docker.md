# Docker

## Running

```sh
docker run -it --rm \
  --name vtexplain \
  docker.io/vitess/vtexplain:latest /vt/bin/vtexplain -help
```

## Example

### Schemas

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
cat << EOF > /tmp/vschema.json
{
  "mainkeyspace": {
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
}
EOF
```

### Select

```sh
docker run -it --rm \
  --name vtexplain \
  docker.io/vitess/vtexplain:latest /vt/bin/vtexplain \
    -shards 8 \
    -vschema "$(cat /tmp/vschema.json)" \
    -schema "$(cat /tmp/schema.sql)" \
    -sql 'SELECT * FROM users'
```

### Insert

```sh
docker run -it --rm \
  --name vtexplain \
  docker.io/vitess/vtexplain:latest /vt/bin/vtexplain \
    -shards 16 \
    -vschema "$(cat /tmp/vschema.json)" \
    -schema "$(cat /tmp/schema.sql)" \
    -sql 'INSERT INTO users (user_id, name) VALUES(1, "john")'
```
