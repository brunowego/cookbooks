# Issues

## libaio

```log
libaio.so.1
```

```sh
sudo apt update
sudo apt -y install libaio1 libaio-dev
```

## ORA-21561: OID generation failed

```sh
scutil --get HostName
```

```sh
# Using shell
sudo /usr/bin/sh -c 'echo -e "127.0.0.1\tmacbook" >> /etc/hosts'

# Using hostess
sudo hostess add 127.0.0.1 macbook
```
