# Linux

## Installation

### YUM

```sh
cat << 'EOF' | sudo tee /etc/yum.repos.d/bintray-apache-couchdb-rpm.repo
[bintray--apache-couchdb-rpm]
name=bintray--apache-couchdb-rpm
baseurl=http://apache.bintray.com/couchdb-rpm/el$releasever/$basearch/
gpgcheck=0
repo_gpgcheck=0
enabled=1
EOF
```

```sh
sudo yum check-update
sudo yum -y install epel-release
sudo yum -y install couchdb
```

## Service

```sh
sudo systemctl enable --now couchdb
```
