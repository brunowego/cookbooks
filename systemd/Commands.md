# Commands

## Reload

```sh
sudo systemctl daemon-reload
```

## Start

```sh
sudo systemctl start [name]
```

## Stop

```sh
sudo systemctl stop [name]
```

## Reload

```sh
sudo systemctl reload [name]
```

## Restart

```sh
sudo systemctl restart [name]
```

## Enable

```sh
sudo systemctl enable [name]
```

## Disable

```sh
sudo systemctl disable [name]
```

## Status

```sh
systemctl status [name]
```

### Full

```sh
systemctl status [name] --full
```

## Mask

```sh
sudo systemctl mask [name]
```

## Unmask

```sh
sudo systemctl unmask [name]
```

## Check

```sh
sudo systemctl is-active [name]
```

## List

### Enabled

```sh
sudo systemctl list-unit-files --type service --state enabled,generated
```

### Running

```sh
sudo systemctl list-units --type service --state running
```

## References

- [Systemd](https://wiki.archlinux.org/index.php/Systemd)
