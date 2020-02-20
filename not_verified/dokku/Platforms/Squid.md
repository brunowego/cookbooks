# Squid

```sh
git clone git@github.com:sameersbn/docker-squid.git squid
cd squid
```

```conf
cache_dir ufs /var/spool/squid3 100 16 256
```

```sh
git remote add dokku dokku@example.com:squid
git push dokku master
```

```sh
sudo dokku volume:create squid /home/squid/cache:/var/spool/squid3
dokku volume:link squid squid
```

```sh
sudo git clone https://github.com/stuartpb/dokku-bind-port.git /var/lib/dokku-alt/plugins/bind-port
```

```sh
dokku bind:create squid 3128
```

### Log

```sh
sudo dokku volume:create squid_log /home/squid/log:/var/log/squid3
dokku volume:link squid squid_log
```
