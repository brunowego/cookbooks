# Keyboard

## Configure Keyboard Layout

Open **Text Entry** and add **English (US, international with dead keys)**

```sh
sudo locale-gen pt_BR.UTF-8

vim  ~/.profile

export LC_CTYPE=pt_BR.UTF-8

source ~/.profile
```

```sh
sudo vim /etc/environment

GTK_IM_MODULE=cedilla
QT_IM_MODULE=cedilla
```

Restart the OS.
