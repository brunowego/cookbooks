# Tips

## Show loaded shell files

```sh
echo exit | strace $SHELL -li |& less | grep '^open'
```
