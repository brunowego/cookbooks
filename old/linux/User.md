# User

## Describe

```sh
cat /etc/passwd
```

## Show all users

```sh
users
```

## Add

```sh
sudo useradd [username]
```

## Password

```sh
sudo passwd [username]
```

## Delete

```sh
sudo userdel [username]
```

### Home Folder

```sh
sudo rm -r /home/[username]
```

## Details

```sh
getent passwd "$USER"
```

## Show Current

```sh
id
```
