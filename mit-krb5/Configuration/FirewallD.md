# FirewallD

## Adding

```sh
sudo firewall-cmd --add-service=kerberos --permanent
sudo firewall-cmd --add-service=kadmin --permanent
```

## Systemd

```sh
sudo systemctl enable --now firewalld
```
