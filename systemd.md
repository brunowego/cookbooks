# Systemd

## References

- [Systemd](https://wiki.archlinux.org/index.php/Systemd)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install systemd-sysv libsystemd-dev
```

#### YUM

```sh
yum check-update
sudo yum -y install systemd-sysv systemd-devel
```

### Commands

```sh
systemctl -h
```

### Usage

```sh
# List
## All
sudo systemctl list-unit-files \
  --type service

## Enabled
sudo systemctl list-unit-files \
  --type service \
  --state enabled,generated

## Running
sudo systemctl list-units \
  --type service \
  --state running

# Remote
systemctl \
  -H [username]@[hostname] \
  status [name]
```

### Tips

#### Visual Studio Code

```sh
code --install-extension coolbear.systemd-unit-file
```

#### Custom

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

#### Overrides

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

### Issues

#### Systemd Support

```log
configure: error: Your system does not support systemd.
```

Install Systemd develop package.
