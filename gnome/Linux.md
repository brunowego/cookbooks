# Linux

## Installation

### YUM

```sh
sudo yum group list
```

```sh
sudo yum groupinstall -y 'GNOME Desktop' 'Graphical Administration Tools'
```

```sh
sudo ln -fs /lib/systemd/system/graphical.target /etc/systemd/system/default.target
```

## Reboot

```sh
sudo reboot
```
