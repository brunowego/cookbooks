# tinifier

## Links

- [Code Repository](https://github.com/tarampampam/tinifier)

## CLI

### Installation

```sh
# Darwin Binary
curl \
  -L 'https://github.com/tarampampam/tinifier/releases/download/v4.1.0/tinifier-darwin-amd64' \
  -o /usr/local/bin/tinifier && \
    chmod +x /usr/local/bin/tinifier
```

### Commands

```sh
tinifier -h
```

### Configuration

```sh
export TINYPNG_API_KEY='<api-key>'
```

### Usage

```sh
#
tinifier quota

#
tinifier compress ./<path/to/img.png>

#
tinifier compress -e webp ./<path/to/img.png>
```
