# Custom

```sh
sudo tee /usr/lib/systemd/system/[name].service << EOF
[Unit]
Description=[description]
After=multi-user.target

[Service]
Type=simple
WorkingDirectory=[/path/to/dir]
ExecStart=[/path/to/bin]
ExecStop=[/path/to/bin]
Restart=on-failure
RestartSec=30

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now [name]
```
