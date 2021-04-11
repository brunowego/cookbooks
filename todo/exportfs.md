# exportfs

TODO

```sh
sudo /usr/bin/sh -c 'echo -e "\"[/path/to/export]\" *(rw,sync,no_root_squash,insecure)" >> /etc/exports.d/[name].exports'

sudo exportfs -a
```
