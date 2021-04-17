# System Setup

## Time Zone

```sh
sudo systemsetup -gettimezone
```

```sh
sudo systemsetup -listtimezones
```

```sh
sudo systemsetup -settimezone 'America/Sao_Paulo'
```

## Remote Apple Events

```sh
sudo systemsetup -getremoteappleevents
```

```sh
sudo systemsetup -setremoteappleevents [on|off]
```

## Remote Login

```sh
sudo systemsetup -getremotelogin
```

```sh
sudo systemsetup -f -setremotelogin [on|off]
```

## Wake On Modem

```sh
sudo systemsetup -getwakeonmodem
```

```sh
sudo systemsetup -setwakeonmodem [on|off]
```

## Wake On Network Access

```sh
sudo systemsetup -getwakeonnetworkaccess
```

```sh
sudo systemsetup -setwakeonnetworkaccess [on|off]
```
