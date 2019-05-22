# Kerberos

## Dependencies

### Homebrew

```sh
brew install krb5
```

### YUM

```sh
sudo yum check-update
sudo yum -y install krb5-devel
```

### APT

```sh
sudo apt update
sudo apt -y install libkrb5-dev
```

## Installation

```sh
pip install --no-cache-dir kerberos requests-kerberos
```

## Configuration

```sh
sed -i '/\[global\]/a autoload.modules = hdfs.ext.kerberos' ~/.hdfscli.cfg
```

```sh
sed -i '/\[hdfs\.alias\]/a client = KerberosClient' ~/.hdfscli.cfg
```

> Before proceed, don't forget to initialize the keytab.
