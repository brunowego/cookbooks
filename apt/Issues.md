# Issues

## Lock

> E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)
> E: Unable to lock the administration directory (/var/lib/dpkg/) is another process using it?

```sh
sudo rm /var/lib/apt/lists/lock
```
