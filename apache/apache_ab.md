# Apache Bench (ab)

## CLI

### Installation

<!-- #### YUM

```sh
yum check-update
sudo yum -y install

httpd-tools ?
apr-util ?
yum-utils ?
``` -->

### Commands

```sh
ab -h
```

### Using

```sh
#
ab \
  -n 1000 \
  -c 100 \
  https://example.com

#
ab \
  -n 2000 \
  -c 30 \
  -T application/json \
  https://example.com
```
