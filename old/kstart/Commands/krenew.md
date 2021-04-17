# krenew

##

```sh
krenew -K 10 -L -t -v
```

### Run in background

```sh
krenew -K 10 -L -t -v &
```

### Run with script

```sh
nohup krenew -K 10 -t -- bash -c "python cmgPostProcessing.py --skim=$1 $2 --samples=WW" &
```

### Save PID

```sh
krenew -a -K 10 -L -b -p -- "/tmp/krenew_$UID.pid"
```

## Cron

```txt
0 * * * * find /tmp -user <USERNAME> -size +0b -name 'krb5cc*' -print0 2>/dev/null | xargs -I'{}' -0 krenew -k '{}'
```

## Service

```sh
sudo tee /usr/lib/systemd/system/krenew.service << EOF
[Unit]
Description=Kerberos Ticket Renewal Daemon
Documentation=https://linux.die.net/man/1/krenew
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/krenew -v -L -b -K 30 -i
ExecReload=/bin/kill -s ALRM $MAINPID
StandardOutput=null

[Install]
WantedBy=multi-user.target
EOF
```

```sh
sudo systemctl daemon-reload
sudo systemctl enable --now krenew
```
