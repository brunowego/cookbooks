# Linux

## Dependencies

### APK

```sh
sudo apk update
sudo apk add perl perl-dbd-mysql make
```

## Installation

```sh
curl -L https://github.com/percona/percona-toolkit/archive/3.0.13.tar.gz | tar -xzC /tmp
( cd /tmp/percona-toolkit-3.0.13 && perl Makefile.PL && make && make install ) && rm -r /tmp/percona-toolkit-3.0.13
```
