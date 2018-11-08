# Tips

## Overrides

```sh
sudo mkdir -p /etc/systemd/system/[name].service.d
```

```sh
sudo tee /etc/systemd/system/[name].service.d/overrides.conf << EOF
[Service]
ExecStart=
ExecStart=[custom]
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl show --property ExecStart [name]
sudo systemctl restart [name]
```

## Remote

```sh
systemctl -H [username]@[hostname] status [name]
```
