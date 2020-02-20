# Configuration

## Main

```sh
sudo tee /etc/supervisord.conf << 'EOF'
[unix_http_server]
file = /run/supervisord.sock

[inet_http_server]
port = 0.0.0.0:9001
username = admin
password = admin

[supervisord]
logfile = /var/log/supervisord.log
loglevel = debug
user = root

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl = unix:///run/supervisord.sock

[include]
files = /etc/supervisor.d/*.ini

EOF
```

## Program

```sh
sudo tee /etc/supervisor.d/[name].ini << 'EOF'
[program:[name]]
command = [/absolute/path/to/bin]
autostart = true
autorestart = false
stdout_logfile = /var/log/[name].log
stdout_logfile_backups = 0
redirect_stderr = true

EOF
```
