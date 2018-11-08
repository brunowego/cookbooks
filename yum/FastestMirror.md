# FastestMirror

## Disable fastestmirror

```sh
sudo sed -ie '/^enabled=/s/1/0/g' /etc/yum/pluginconf.d/fastestmirror.conf
```

## Exclude

```sh
sudo sed -i 's/^#exclude=.*/exclude=centos.example.com/' /etc/yum/pluginconf.d/fastestmirror.conf
```

## Include only

```sh
sudo sed -i 's/^#include_only=.*/include_only=.com/' /etc/yum/pluginconf.d/fastestmirror.conf
```

## Timed Hosts

### Remove

```sh
sudo rm /var/cache/yum/x86_64/7/timedhosts*
```
