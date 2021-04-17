# k5start

## Service

```sh
sudo tee /usr/lib/systemd/system/kstart.service << EOF
[Unit]
Description=Kstart Daemon
Documentation=https://www.eyrie.org/~eagle/software/kstart/k5start.html
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/k5start -l 12h -K 360 -v -U -f /root/.k5keytab

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now kstart
```
