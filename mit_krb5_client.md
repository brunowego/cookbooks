# MIT Kerberos Client

<!--
cyrus-sasl-gssapiv2
-->

## CLI

### Installation

#### Homebrew

```sh
brew install krb5
```

#### YUM

```sh
yum check-update
sudo yum -y install krb5-workstation krb5-devel
```

#### APT

```sh
sudo apt update
sudo apt -y install krb5-user libkrb5-dev
```

#### APK

```sh
sudo apk update
sudo apk add krb5
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y krb5-client
```

### Environment

#### Homebrew

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# krb5
export PATH="/usr/local/opt/krb5/bin:/usr/local/opt/krb5/sbin:$PATH"
```

```sh
sudo su - "$USER"
```

### Configuration

```sh
sudo mkdir -p /etc/krb5.conf.d
```

```sh
sudo tee /etc/krb5.conf << EOF
includedir /etc/krb5.conf.d/

[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log

[libdefaults]
 dns_lookup_realm = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true
 rdns = false
 default_ccache_name = KEYRING:persistent:%{uid}
EOF
```

#### Keytabs

```sh
sudo mkdir -p /etc/security/keytabs
```

#### Realm

```sh
sudo tee -a /etc/krb5.conf.d/[domain].conf << EOF
[libdefaults]
 default_realm = EXAMPLE.COM

[realms]
 EXAMPLE.COM = {
  kdc = kdc.example.com
  admin_server = kdc.example.com
 }

[domain_realm]
 .example.com = EXAMPLE.COM
 example.com = EXAMPLE.COM
EOF
```

### Issues

####

```log
kinit: Client '[username]@[REALM]' not found in Kerberos database while getting initial credentials
```

TODO

#### Unknown credential

```log
kinit: Unknown credential cache type while getting default ccache
```

```sh
#
kinit [username]@[REALM]

#
echo '[password]' | kinit [username]@[REALM]

#
kinit --password-file=[/path/to/my/password/file] [username]@[REALM]

#
cat [./password_file] | kinit --password-file=STDIN [username]@[REALM]
```
