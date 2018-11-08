# dokku-nginx-alt

```sh
cd /var/lib/dokku-alt/plugins/

git clone https://github.com/mikexstudios/dokku-nginx-alt.git nginx-alt

dokku plugins-install
```

```sh
sudo vim /home/dokku/[app]/VHOST
```

```sh
touch nginx.tpl || exit
touch nginx.ssl.tpl || exit
```
