# HDFS

## Permissions

### Disable

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'name' -v 'dfs.permissions.enabled' ${HADOOP_CONF_DIR}/hdfs-site.xml
sudo xmlstarlet ed -L -s '/configuration/property[last()]' -t 'elem' -n 'value' -v 'false' ${HADOOP_CONF_DIR}/hdfs-site.xml
```
