# HTTPS

- [Reference](http://www.squid-cache.org/Doc/config/cache_peer/)

## Ubuntu

```sh
cat /etc/squid3/squid.conf
```

```sh
sudo sh -c 'echo "cache_peer localhost parent 8443 0 no-query no-digest no-netdb-exchange default login=[username]:[password]" >> /etc/squid3/squid.conf'
```

```sh
sudo squid3 -f /etc/squid3/squid.conf
```

```sh
sudo squid3 -f /etc/squid3/squid.conf -k reconfigure
```

```sh
sudo squid3 -f /etc/squid3/squid.conf -k restart
```


## CentOS

```sh
sudo sh -c 'echo -e "\ncache_peer localhost parent 8443 0 no-query no-digest no-netdb-exchange default login=[username]:[password]" >> /etc/squid/squid.conf'
```

```sh
sudo squid -f /etc/squid/squid.conf
```

```sh
sudo squid -f /etc/squid/squid.conf -k reconfigure
```

```sh
sudo squid -f /etc/squid/squid.conf -k restart
```
