# PECL

## CLI

### References

- [REST Packages](https://pecl.php.net/rest/p/packages.xml)

### Commands

```sh
pecl help
```

### Usage

```sh
# Update Channel
pecl channel-update pecl.php.net

# Installed Packages
pecl list -a

# Remove Packages
pecl list-all

# Config Show
pecl config-show

# Or
cat "$HOME/.pearrc"
```

### Tips

#### Proxy

```sh
#
pecl config-get http_proxy

#
pear config-set http_proxy ''

#
pear config-set http_proxy "$http_proxy"
```

### Issues

####

```log
Warning: stream_socket_enable_crypto(): SSL operation failed with code 1. OpenSSL Error messages:
error:14090086:SSL routines:ssl3_get_server_certificate:certificate verify failed in PEAR/Proxy.php on line 101
Notice: Undefined variable: proxy_host in PEAR/Proxy.php on line 103
Notice: Undefined variable: proxy_port in PEAR/Proxy.php on line 103
```

pecl list-channels
pecl channel-delete pear

#### With OpenSSL

```log
Warning: stream_socket_enable_crypto(): this stream does not support SSL/crypto in /usr/local/lib/php/PEAR/Proxy.php on line 105
No releases available for package "pecl.php.net/?"
install failed
```

```sh
# Check
php -m | grep openssl

#
cd /path/to/src/php/version

./configure \
  # [...]
  --with-openssl
```

#### GNU Autoconf

```log
Cannot find autoconf. Please check your autoconf installation and the
$PHP_AUTOCONF environment variable. Then, rerun this script.
```

Install [GNU Autoconf](/gnu_autoconf.md)
