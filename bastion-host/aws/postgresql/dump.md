# AWS Bastion Host / PostgreSQL Dump

## Steps

```sh
# Check the OS version
cat /etc/os-release

# Download with the correct filenames
curl -LO https://download.postgresql.org/pub/repos/yum/16/redhat/rhel-8-x86_64/postgresql16-libs-16.13-1PGDG.rhel8.10.x86_64.rpm
curl -LO https://download.postgresql.org/pub/repos/yum/16/redhat/rhel-8-x86_64/postgresql16-16.13-1PGDG.rhel8.10.x86_64.rpm

# Verify size
ls -lh postgresql16*.rpm

# Install
sudo rpm -ivh --nodeps postgresql16-libs-16.13-1PGDG.rhel8.10.x86_64.rpm postgresql16-16.13-1PGDG.rhel8.10.x86_64.rpm

# Check the version
/usr/pgsql-16/bin/pg_dump --version

# Remove the files
rm postgresql16*.rpm
```

<!--
python3 -c "import urllib.parse; print(urllib.parse.unquote('<password>'))"
-->

### Tips

```sh
# Download in a screen session
screen -S download
```

<!--
screen -r download
screen -ls
-->

### Issues

```sh
# /usr/pgsql-16/bin/pg_dump: error while loading shared libraries: libzstd.so.1: cannot open shared object file: No such file or directory
sudo yum install -y libzstd

# /usr/pgsql-16/bin/pg_dump: error while loading shared libraries: libcrypto.so.1.1: cannot open shared object file: No such file or directory
sudo yum install -y openssl11-libs
```
