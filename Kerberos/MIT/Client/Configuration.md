# Configuration

## Main

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

## Keytabs

```sh
sudo mkdir -p /etc/security/keytabs
```

## Realm

```sh
sudo tee -a /etc/krb5.conf.d/[domain].conf << EOF
[libdefaults]
 default_realm = [DOMAIN.COM]

[realms]
 [DOMAIN.COM] = {
  kdc = [kdc.domain.com]
  admin_server = [kdc.domain.com]
 }

[domain_realm]
 [.domain.com] = [DOMAIN.COM]
 [domain.com] = [DOMAIN.COM]
EOF
```
