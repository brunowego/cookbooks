# Apache

```sh
vim /etc/logrotate.d/apache
```

```txt
###ROOT###/var/log/httpd/*_log {
    missingok
    rotate 52
    compress
    delaycompress
    notifempty
    create 640 ###SITE### ###SITE###
    sharedscripts
    postrotate
        ###ROOT###/etc/init.d/apache reload
    endscript
}
```
