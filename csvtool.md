# csvtool

## Links

- [Code Repository](https://github.com/maroofi/csvtool)

## CLI

### Installation

```sh
# Using pipx
pipx install csvtool
```

### Commands

```sh
csvtool -h
```

### Usage

```sh
#
csvtool ./<path/to/file>.csv
```

### Tips

#### TBD

```sh
#
mkdir -p ./downloads

#
csvtool -c 3,4 </path/to/filename>.csv | tail -n +2 | while IFS=',' read -r bucket key; do
  echo "Downloading: s3://$bucket/$key"
  aws s3 cp "s3://$bucket/$key" ./downloads/
done
```
