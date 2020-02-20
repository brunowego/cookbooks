# Linux

## Dependencies

- MySQL

## Installation

### YUM

```sh
cat << EOF | sudo tee /etc/yum.repos.d/proxysql.repo
[proxysql_repo]
name= ProxySQL YUM repository
baseurl=https://repo.proxysql.com/ProxySQL/proxysql-2.0.x/centos/\$releasever
gpgcheck=1
gpgkey=https://repo.proxysql.com/ProxySQL/repo_pub_key
EOF
```

```sh
yum check-update
sudo yum -y install proxysql
```

## Service

```sh
sudo systemctl start proxysql
sudo chkconfig proxysql on
```
