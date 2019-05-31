# Running

## Configuration

```sh
sudo install -m 644 -o mysql -g mysql /dev/null /var/run/mysql-proxy.pid
```

```sh
sudo install -m 644 -o mysql -g mysql /dev/null /var/log/mysql-proxy.log
```

```sh
sudo install -dm 775 -o mysql -g mysql /etc/mysql-proxy
```

```sh
sudo install -dm 775 -o mysql -g mysql /usr/lib/mysql-proxy/lua/proxy
```

```sh
sudo install -m 660 -o mysql -g mysql /dev/null /etc/mysql-proxy/mysql-proxy.conf
```

```sh
sudo -u mysql tee /etc/mysql-proxy/mysql-proxy.conf << EOF
[mysql-proxy]
daemon = true
pid-file = /var/run/mysql-proxy.pid
log-level = debug
log-file = /var/log/mysql-proxy.log
keepalive = true
event-threads = 50
proxy-lua-script=/usr/lib/mysql-proxy/lua/proxy/[name].lua
EOF
```

## Service

```sh
sudo tee /usr/lib/systemd/system/mysql-proxy.service << 'EOF'
[Unit]
Description=MySQL Proxy
After=network.target

[Service]
Type=forking
User=mysql
Group=mysql
ExecStart=/usr/bin/mysql-proxy --defaults-file=/etc/mysql-proxy/mysql-proxy.conf --plugins=proxy
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now mysql-proxy
```

## Test

```sh
sudo lsof -i :4040
```

## Logs

```sh
tail -f /var/log/mysql-proxy.log
```
