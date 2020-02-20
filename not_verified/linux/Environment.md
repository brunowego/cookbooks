# Environment

## Global

### Output

```sh
echo /etc/environment
```

> Need verify if has PATH defined. If not, don't proceed. Possibly PATH is being defined elsewhere.

```sh
echo 'PATH="[/path/to/bin/folder]:$PATH"' | sudo tee --append /etc/environment
```

### Reload

```sh
source /etc/environment
```

## Load .env

```sh
set -a; source [path/to/.env];
```

## Show

```sh
env
```

### Override

```sh
[variable]=[value] [command]
```
