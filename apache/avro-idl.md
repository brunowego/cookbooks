# Apache Avro Interface Definition Language (IDL) (a.k.a. avro-idl)

## Links

- [Docs](https://avro.apache.org/docs/current/idl.html)

## Tips

### Visual Studio Code

```sh
#
code --install-extension streetsidesoftware.avro

#
jq '."recommendations" += ["streetsidesoftware.avro"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
