# Running

## Service

### Query Server

```sh
sudo tee /usr/lib/systemd/system/phoenix-queryserver.service << EOF
[Unit]
Description=Apache Phoenix Query Server
Documentation=https://phoenix.apache.org/server.html
After=network.target

[Service]
Type=simple
User=phoenix
Group=phoenix
WorkingDirectory=/opt/apache-phoenix
ExecStart=/opt/apache-phoenix/bin/queryserver.py start
ExecStop=/opt/apache-phoenix/bin/queryserver.py stop
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now phoenix-queryserver
```

## Logs

```sh
tail -f /tmp/phoenix/phoenix-phoenix-queryserver.log
```

```sh
tail -f /tmp/phoenix/phoenix-phoenix-queryserver.out
```
