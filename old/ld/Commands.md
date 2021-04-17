# Commands

## View

```sh
ldd [binary]
```

## List

```sh
ldconfig -p
```

## Load

```sh
sudo ldconfig
```

## Temporally

```sh
LD_LIBRARY_PATH=[/path/to/libs] [program]
```

## Automatic

```sh
sudo /usr/bin/sh -c 'echo "[/path/to/lib]" >> /etc/ld.so.conf.d/[name].conf'
```

```sh
sudo ldconfig
```
