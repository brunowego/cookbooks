# Examples

## Single line

```sh
jq '.example.email |= "johndoe@example.com"' [filename] | sponge [filename]
```

## Multiple lines

```sh
jq '.example.name |= "John Doe"' jq '.example.email |= "johndoe@example.com"' [filename] | sponge [filename]
```

## Remove

```sh
jq 'del(.example.name, .example.email)' [filename] | sponge [filename]
```
