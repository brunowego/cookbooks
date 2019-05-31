# Bind Address

## Linux

```sh
sudo sh -c 'echo -e "\nbind-address=0.0.0.0" >> /etc/my.cnf'
```

```sh
sudo systemctl restart mysqld
```

## OS X

```sh
sudo sed -i '/^bind-address/s/127.0.0.1/0.0.0.0/g' /usr/local/etc/my.cnf
```

### Homebrew

```sh
brew services restart mysql
```
