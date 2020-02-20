# Configuration

## Terminal

```sh
sed -ri 's/"terminal": (.+),/"terminal": "iTerm.app",/' ~/.shuttle.json
```

## Open in

```sh
sed -ri 's/"open_in": (.+),/"open_in": "tab",/' ~/.shuttle.json
```
