# Update

## Linux

```sh
wget ftp://ftp.mozilla.org/pub/firefox/releases/31.0/linux-x86_64/en-US/firefox-31.0.tar.bz2
```

```sh
tar -xjf firefox-31.0.tar.bz2
```

```sh
sudo rm -r /opt/firefox
sudo mv firefox /opt/firefox31
```

```sh
sudo ln -s /opt/firefox31/firefox /usr/bin/firefox
```
