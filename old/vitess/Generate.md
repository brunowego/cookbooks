# Generate

```sh
export VITESS_MASTER_TABLET=$(vtctlclient -server 127.0.0.1:15999 ListAllTablets | grep ' <keyspace name> 0 ' | grep ' master ' | cut -d ' ' -f 1)
```

```sh
vtctlclient -server 127.0.0.1:15999 GetSchema $VITESS_MASTER_TABLET | jq -r '.table_definitions[].schema + ";"'
```
