# bombardier

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/codesenberg/bombardier/releases/download/v1.2.4/bombardier-darwin-amd64' \
  -o /usr/local/bin/bombardier
```

```sh
chmod +x /usr/local/bin/bombardier
```

#### Linux Binary

```sh
curl \
  -L 'https://github.com/codesenberg/bombardier/releases/download/v1.2.4/bombardier-linux-amd64' \
  -o /usr/local/bin/bombardier
```

```sh
chmod +x /usr/local/bin/bombardier
```

### Commands

```sh
bombardier --help
```

### Usage

```sh
#
bombardier \
  -c 125 \
  -n 10000000 \
  http://[domain]:[port]

#
bombardier \
  -c 200 \
  -d 10s \
  -l \
  http://[domain]:[port]
```
