# MIT Kerberos Development

## Library

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install libkrb5-dev
```

#### YUM

```sh
yum check-update
sudo yum -y install krb5-devel
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y krb5-devel
```

### Issues

<!-- #### Missing Command

```log
subprocess.CalledProcessError: Command 'krb5-config --libs gssapi' returned non-zero exit status 127.
```

Install MIT Kerberos Development and `cyrus-sasl-devel`. -->

#### Missing Command

```log
/bin/sh: krb5-config: command not found
```

```sh
# Missing PATH
sudo PATH=$PATH:/usr/lib/mit/bin pip3 install ./
```
