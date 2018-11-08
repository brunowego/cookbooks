# Examples

## Environment

```sh
env http_proxy=http://127.0.0.1:3128 sudo -E bash -c 'echo $http_proxy'
```

## Target User

### Root

```sh
sudo -i
```

> Alternative is `sudo su -`

### Another

```sh
sudo su - [user]
```

## Running as Sudo

```sh
sudo [command]
```

## Running Shell as Sudo

```sh
sudo -s
```

> Alternative is `sudo $(which zsh)`

## Edit Sudoers File

```sh
sudo visudo
```

> Alternative is `sudo vim /etc/sudoers`
