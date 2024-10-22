# Comma-separated values (CSV)

<!--
https://flatfile.com
-->

## Tools

- [CSV Lint](https://csvlint.com/online-validator)
- [JSON to CSV](https://json.diffbot.com)

## Tips

### Count rows

```sh
#
cat </path/to/filename>.csv | tail -n +2 | wc -l
```

### Extract Headers

```sh
#
head -n 1 </path/to/filename>.csv | sed 's/,/","/g' | awk '{print "{\"headers\": [\""$0"\"]}"}' | jq
```

### Visual Studio Code

```sh
#
code --install-extension mechatroner.rainbow-csv

#
jq '."recommendations" += ["mechatroner.rainbow-csv"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
