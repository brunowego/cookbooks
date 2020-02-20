# Groups

## View

```sh
groups
```

### With user

```sh
groups $USER
```

### Entire list

```sh
cut -d: -f 1 /etc/group | sort
```

## Add

```sh
sudo groupadd [group]
```

### Append group to user

```sh
sudo usermod -aG [group] $USER
```

## Delete

```sh
sudo groupdel [group]
```

### From user

```sh
sudo gpasswd -d "$USER" [group]
```
