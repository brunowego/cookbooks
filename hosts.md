# Hosts

## Tips

### Add

```sh
sudo /usr/bin/sh -c 'echo -e "127.0.0.1\t[name]" >> /etc/hosts'
```

### List

```sh
getent hosts `hostname`
```

### Tips

#### Visual Studio Code

```sh
code --install-extension tommasov.hosts
```
