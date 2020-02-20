# Hostname

## Computer name

```sh
scutil --get ComputerName
```

```sh
sudo scutil --set ComputerName 'John’s MacBook Pro' # Ally
```

## Hostname

```sh
scutil --get HostName
```

```sh
sudo scutil --set HostName 'john.macbook.pro' # ally.macbook.pro
# apex.macbook.pro, axis.macbook.pro, axel.macbook.pro
```

```sh
sudo su - "$USER"
```

### Local

```sh
scutil --get LocalHostName
```

```sh
sudo scutil --set LocalHostName 'John-MacBook-Pro'
```
