# Apache Knox

<!--
https://github.com/abajwa-hw/security-workshops

https://www.adaltas.com/en/2019/02/04/apache-knox/

https://github.com/gaelfoppolo/self-service-data-analytics/blob/master/doc-admin/Knox/knox_add_services.md
https://github.com/dabsterindia/LABs/blob/70ea27231800c4be26575391407bae7985b4ea13/KNOX/Knox_DabsterInc.md
-->

## References

- [User Guide](https://knox.apache.org/books/knox-0-14-0/user-guide.html)
- [WebHDFS REST API](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/WebHDFS.html)

## Services

| Platform | Address |
| --- | --- |
| Apache Hadoop WebHDFS (HDFS) | https://knox.hortonworks.com:8443/gateway/default/webhdfs/ |
| Apache Hadoop YARN Resource Manager | https://knox.hortonworks.com:8443/gateway/default/yarn/ |
| Apache Hadoop YARN UI | https://knox.hortonworks.com:8443/gateway/default/yarn/ |
| Apache Solr | https://knox.hortonworks.com:8443/gateway/default/solr/ |

```sh
#
nmap -p 8443 knox.hortonworks.com

#
export USER_KEY=
export USER_PASS=
export KNOX_DOMAIN=knox.hortonworks.com
```

### Apache Hadoop WebHDFS

https://[hostname]:8443/gateway/default/hdfs/

```sh
#
# curl \
#   --negotiate \
#   -u "$USER_KEY:$USER_PASS" \
#   "http://$NAMENODE_DOMAIN:50070/webhdfs/v1/?op=GETHOMEDIRECTORY"

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/webhdfs/v1/?op=GETHOMEDIRECTORY" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/webhdfs/v1/user/$USER_KEY?op=LISTSTATUS" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X PUT \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/webhdfs/v1/user/$USER_KEY/test?op=MKDIRS" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X PUT \
  -LT <(echo '# Test\n') \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/webhdfs/v1/user/$USER_KEY/test/README?op=CREATE"

#
curl \
  -kLs \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/webhdfs/v1/user/$USER_KEY/test/README?op=OPEN"

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X DELETE \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/webhdfs/v1/user/$USER_KEY/test?op=DELETE&recursive=true" | \
    jq '.'
```

### Apache Hadoop YARN Resource Manager

http://[hostname]:8088/cluster

```sh
#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/resourcemanager/v1/cluster" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/resourcemanager/v1/cluster/metrics" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/resourcemanager/v1/cluster/scheduler" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/resourcemanager/v1/cluster/appstatistics" | \
    jq '.'

curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/resourcemanager/v1/cluster/appstatistics?states=accepted,running,finished&applicationTypes=mapreduce" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/resourcemanager/v1/cluster/nodes" | \
    jq '.'

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/resourcemanager/v1/cluster/apps" | \
    jq '.'
```

### Apache Hadoop YARN UI

https://[hostname]:8443/gateway/usuarios/yarn/
https://[hostname]:8443/gateway/usuarios/yarn/logs

```sh
#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/yarn/stacks"

#
curl \
  -ks \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/yarn/jmx" | \
    jq '.'
```

<!-- ### Apache Hive

TODO

```sh
curl \
  -ikv \
  -u '[username]:[password]' \
  'https://[domain]:8443/gateway/default/hive/v1/user?op=LISTSTATUS'
``` -->

### Apache Solr

http://[hostname]:8983/solr/
https://[hostname]:8443/gateway/usuarios/solr/

```sh
curl \
  -ikv \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/solr"

curl \
  -ikv \
  -u "$USER_KEY:$USER_PASS" \
  -X GET \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/solr/select?q=*.*&wt=json&indent=true&rows=100"

curl \
  -ikv \
  -u "$USER_KEY:$USER_PASS" \
  -X POST \
  "https://$KNOX_DOMAIN:8443/gateway/usuarios/solr/admin/collections?action=CLUSTERSTATUS"

# https://127.0.0.1:8443/gateway/usuarios/solr/index.html#/
# https://127.0.0.1:8443/gateway/usuarios/solr/admin/info/system
# https://127.0.0.1:8443/gateway/usuarios/solr/admin/collections?action=LIST
```

## CLI

### Installation

#### YUM

```sh
yum check-update
sudo yum-config-manager --add-repo http://public-repo-1.hortonworks.com/HDP/centos7/3.x/updates/3.0.1.0/hdp.repo
sudo yum -y install knox
```

<!-- #### APT

```sh
sudo apt update
sudo apt -y install knox
``` -->

<!-- #### Zypper

```sh
sudo zypper refresh
sudo zypper install -y knox
``` -->

### Configuration

TODO

<!--
/etc/knox/conf
/var/log/knox

https://127.0.0.1:8443/gateway/manager/admin-ui/index.html
-->
