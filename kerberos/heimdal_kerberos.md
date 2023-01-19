# Heimdal Kerberos

## Configuration

### Main

```sh
sudo tee /etc/krb5.conf << EOF
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

### Keytabs

```sh
sudo mkdir -p /etc/security/keytabs
```

### Realm

```sh
sudo sed -i '/\[libdefaults\]/a \ default_realm = [DOMAIN.TLD]' /etc/krb5.conf
```

```sh
sudo tee -a /etc/krb5.conf << EOF
[realms]
 [DOMAIN.TLD] = {
  kdc = [kdc.domain.tld]
  admin_server = [kdc.domain.tld]
 }

[domain_realm]
 [.domain.tld] = [DOMAIN.TLD]
 [domain.tld] = [DOMAIN.TLD]

EOF
```

## Commands

```sh
man krb5-config
man krbservicesetup
kswitch --help
man kpasswd
kgetcred --help
man kdcsetup
kcc --help
kadmin --help
klist --help
kinit --help
ktutil --help
kdestroy --help
```

## Examples

```sh
kinit -kt /etc/security/keytabs/[name].keytab [username]/[FQDN]@[REALM]
ktutil -k /etc/security/keytabs/[name].keytab list
```
