# wait-for-it

## Tools

- [say](/say.md)

## CLI

### Installation

#### GNU Wget

```sh
sudo wget -O /usr/local/bin/wait-for-it https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
sudo chmod +x /usr/local/bin/wait-for-it
```

#### cURL

```sh
sudo curl -o /usr/local/bin/wait-for-it https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
sudo chmod +x /usr/local/bin/wait-for-it
```

### Command

```sh
wait-for-it
```

### Usage

```sh
# Darwin
wait-for-it [hostname] \
  -t 0 \
  -- say done

# Linux
wait-for-it [hostname] \
  -t 0 \
  -- spd-say done
```
