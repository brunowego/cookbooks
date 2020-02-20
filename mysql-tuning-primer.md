# Tuning Primer (MySQL)

## CLI

### References

- [README](https://github.com/BMDan/tuning-primer.sh/blob/master/README.md)

### Installation

#### Darwin

```sh
curl \
  -L 'https://raw.githubusercontent.com/BMDan/tuning-primer.sh/master/tuning-primer.sh' \
  -o /usr/local/bin/tuning-primer && \
    chmod +x /usr/local/bin/tuning-primer
```

### Configuration

```sh
cat << EOF > ~/.my.cnf
[client]
socket=/tmp/mysql.sock
user=root
password=root
EOF
```

### Running

```sh
tuning-primer all
```
