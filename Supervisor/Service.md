# Service

```sh
/etc/supervisord.d/
```

```ini
[program:[name]]
command=/usr/bin/[filename]
autostart=true
autorestart=false
stdout_logfile = /var/log/[name]/[name].log
stdout_logfile_backups = 0
redirect_stderr = true
```
