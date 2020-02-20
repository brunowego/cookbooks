# Commands

## Enable

```sh
sudo ufw --force enable
```

## Allow

```sh
sudo ufw allow 22/tcp
```

## Status

```sh
sudo ufw status
```

## Forward policy

```sh
sudo sed -ri '/^DEFAULT_FORWARD_POLICY/ s/DROP/ACCEPT/g' /etc/default/ufw
```

## Reload

```sh
sudo ufw reload
```

## Disable

```sh
sudo ufw disable
```
