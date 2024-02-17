# Open

## CLI

### Commands

```sh
open
```

<!--
echo -e '[INFO]\thttp://127.0.0.1:3000'
-->

## Tips

### Open each folder as a URL

```sh
ls -d1 * | xargs -I {} bash -c 'open "https://{}"'
```
