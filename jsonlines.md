# JSON Lines (JSONL)

<!--
https://github.com/ndjson/ndjson-spec
https://dbgate.org/features/ndjson-viewer.html
-->

<!--
.jsonl.gz or .jsonl.bz2
-->

## Links

- [Main Website](https://jsonlines.org)
- [Validator](https://jsonlines.org/validator)

## Tools

- [jtbl](/jtbl.md)
- [Miller](/miller.md)

### Online

- [konbert - Convert JSONLines to PostgreSQL](https://konbert.com/convert/jsonl/to/postgres)
- [konbert - JSONLines Viewer](https://konbert.com/viewer/jsonl)

## Tips

### Get Keys

```sh
#
head -n 1 ./documents.jsonl | jq 'keys'
# Or
head -n 1 ./documents.jsonl | jq -r 'keys[]'
```

### Convert JSONL to JSON and Vice Versa

```sh
# JSONL → JSON
jq -s '.' ./input.jsonl > ./output.json

# JSON → JSONL
jq -c '.[]' ./input.json > ./output.jsonl
```
