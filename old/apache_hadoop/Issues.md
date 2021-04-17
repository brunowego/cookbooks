# Issues

## Permission denied

```log
Permission denied: user=dr.who, access=READ_EXECUTE, inode="/":hdfs:supergroup:drwxr-x---
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' /opt/hadoop/etc/hadoop/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'hadoop.http.staticuser.user' /opt/hadoop/etc/hadoop/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'hdfs' /opt/hadoop/etc/hadoop/core-site.xml
```

```sh
sudo systemctl restart hdfs-namenode
```
