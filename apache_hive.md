# Apache Hive

## References

- [HiveQL](https://cwiki.apache.org/confluence/display/Hive/LanguageManual)

<!-- ## Docker

```sh
export HADOOP_ENV_FILE=$(base64 <(cat << \EOF
HIVE_SITE_CONF_javax_jdo_option_ConnectionURL=jdbc:mysql://mysql-metastore/hivedb?createDatabaseIfNotExist=true\&amp;characterEncoding=UTF-8\&amp;useSSL=false
HIVE_SITE_CONF_javax_jdo_option_ConnectionDriverName=com.mysql.jdbc.Driver
HIVE_SITE_CONF_javax_jdo_option_ConnectionUserName=root
HIVE_SITE_CONF_javax_jdo_option_ConnectionPassword=iamroot
HIVE_SITE_CONF_datanucleus_autoCreateSchema=false
HIVE_SITE_CONF_hive_metastore_uris=thrift://hive-metastore:9083
HDFS_CONF_dfs_namenode_datanode_registration_ip___hostname___check=false

CORE_CONF_fs_defaultFS=hdfs://namenode:8020
CORE_CONF_hadoop_http_staticuser_user=root
CORE_CONF_hadoop_proxyuser_hue_hosts=*
CORE_CONF_hadoop_proxyuser_hue_groups=*

HDFS_CONF_dfs_webhdfs_enabled=true
HDFS_CONF_dfs_permissions_enabled=false

YARN_CONF_yarn_log___aggregation___enable=true
YARN_CONF_yarn_resourcemanager_recovery_enabled=true
YARN_CONF_yarn_resourcemanager_store_class=org.apache.hadoop.yarn.server.resourcemanager.recovery.FileSystemRMStateStore
YARN_CONF_yarn_resourcemanager_fs_state___store_uri=/rmstate
YARN_CONF_yarn_nodemanager_remote___app___log___dir=/app-logs
YARN_CONF_yarn_log_server_url=http://historyserver:8188/applicationhistory/logs/
YARN_CONF_yarn_timeline___service_enabled=true
YARN_CONF_yarn_timeline___service_generic___application___history_enabled=true
YARN_CONF_yarn_resourcemanager_system___metrics___publisher_enabled=true
YARN_CONF_yarn_resourcemanager_hostname=resourcemanager
YARN_CONF_yarn_timeline___service_hostname=historyserver
YARN_CONF_yarn_resourcemanager_address=resourcemanager:8032
YARN_CONF_yarn_resourcemanager_scheduler_address=resourcemanager:8030
YARN_CONF_yarn_resourcemanager_resource__tracker_address=resourcemanager:8031
EOF
))
```

  mysql-metastore:
    image: hamletlee/hive-mysql-metastore:2.3.0
    build: hive-mysql-metastore
    environment:
      MYSQL_ROOT_PASSWORD: "iamroot"
      MYSQL_DATABASE: "hivedb"
    ports:
      - 3306:3306
    volumes:
      - mysql:/var/lib/mysql

  hive-server:
    image: hamletlee/hive:2.3.0
    build: hive
    env_file:
      - ./hadoop-hive.env
    environment:
#      HIVE_CORE_CONF_javax_jdo_option_ConnectionURL: "jdbc:mysql://mysql-metastore/hivedb?createDatabaseIfNotExist=true&amp;characterEncoding=UTF-8&amp;useSSL=false"
      SERVICE_PRECONDITION: "hive-metastore:9083"
      HIVE_CORE_CONF_javax_jdo_option_ConnectionURL: "jdbc:mysql://mysql-metastore/hivedb?createDatabaseIfNotExist=true&characterEncoding=UTF-8&useSSL=false"
    ports:
      - "8000:8000"
      - "10000:10000"

  hive-client:
    image: hamletlee/hive:2.3.0
    env_file:
      - ./hadoop-hive.env
    entrypoint: ["sleep","100000000"]

  hive-metastore:
    image: hamletlee/hive:2.3.0
    env_file:
      - ./hadoop-hive.env
#    command: cat /opt/hive/conf/hive-site.xml
    command: /opt/hive/bin/hive --service metastore
    environment:
      SERVICE_PRECONDITION: "namenode:50070 datanode:50075 mysql-metastore:3306"
    ports:
      - "19083:9083" -->

## Tips

### Visual Studio Code

```sh
code --install-extension josephtbradley.hive-sql
```
