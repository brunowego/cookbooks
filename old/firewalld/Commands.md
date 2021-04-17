# Commands

## List

```sh
sudo firewall-cmd --list-all
```

## Add

```sh
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
```

## Reload

```sh
sudo firewall-cmd --reload
```

## Disable

```sh
sudo systemctl disable --now firewalld
```
