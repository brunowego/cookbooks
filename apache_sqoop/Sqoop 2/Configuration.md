# Configuration

## Hadoop

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'hadoop.proxyuser.sqoop2.hosts' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v '*' ${HADOOP_CONF_DIR}/core-site.xml
```

```sh
sudo xmlstarlet ed -L -s '/configuration' -t 'elem' -n 'property' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'name' -v 'hadoop.proxyuser.sqoop2.groups' ${HADOOP_CONF_DIR}/core-site.xml
sudo xmlstarlet ed -L -s '/configuration/property' -t 'elem' -n 'value' -v '*' ${HADOOP_CONF_DIR}/core-site.xml
```

```sh
sed -i '/^allowed.system.users/s/##.*/sqoop2/g' ${HADOOP_CONF_DIR}/container-executor.cfg
```
