# Linux

## Installation

```sh
curl -L https://github.com/mingrammer/flog/releases/download/v0.2.4/flog_0.2.4_linux_amd64.tar.gz | sudo tar -xzC /usr/local/bin
```

## Configuration

```sh
sudo useradd -Mrs /sbin/nologin httpd
```

```sh
sudo usermod -aG httpd "$USER" && sudo su - "$USER"
```

```sh
sudo install -dm 775 -o httpd -g httpd /var/log/httpd
```

## Service

```sh
sudo tee /usr/lib/systemd/system/flog.service << 'EOF'
[Unit]
Description=Fake Log Generator
After=network.target

[Service]
Type=forking
User=httpd
Group=httpd
ExecStart=/usr/local/bin/flog -f apache_combined -o /var/log/httpd/access.log -t log -d 0.0001 -s 0.0001 -l -w

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now flog
```

## Logs

```sh
tail -f /var/log/httpd/access.log
```
