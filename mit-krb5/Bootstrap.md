# Bootstrap

## Server

### Host

```sh
sudo tee -a /etc/hosts << EOF
[IP] kdc.xyz.tld
[IP] client.xyz.tld
EOF
```

```sh
sudo hostnamectl set-hostname kdc.xyz.tld
```

```sh
hostnamectl status
```

## Configuration

## TBD

```sh
sudo vim /etc/krb5.conf
```

```conf
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
 default_realm = xyz.tld
 default_ccache_name = KEYRING:persistent:%{uid}

[realms]
 xyz.tld = {
  kdc = kdc.xyz.tld
  admin_server = kdc.xyz.tld
 }

[domain_realm]
 .xyz.tld = xyz.tld
 xyz.tld = xyz.tld
```

## TBD

```sh
sudo vim /var/kerberos/krb5kdc/kdc.conf
```

```conf
[kdcdefaults]
 kdc_ports = 88
 kdc_tcp_ports = 88

[realms]
 xyz.tld = {
  # master_key_type = aes256-cts
  default_principle_flags = +preauth
  acl_file = /var/kerberos/krb5kdc/kadm5.acl
  dict_file = /usr/share/dict/words
  admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
  supported_enctypes = aes256-cts:normal aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal camellia256-cts:normal camellia128-cts:normal des-hmac-sha1:normal des-cbc-md5:normal des-cbc-crc:normal
 }
```

## TBD

```sh
sudo vim /var/kerberos/krb5kdc/kadm5.acl
```

```acl
*/[FQDN]@[REALM] *
```

## TBD

```sh
sudo kdb5_util create -r xyz.tld -s
```

## TBD

```sh
sudo kadmin.local

kadmin.local:  addprinc root/admin
kadmin.local:  ktadd -k /var/kerberos/krb5kdc/kadm5.keytab kadmin/admin
kadmin.local:  ktadd -k /var/kerberos/krb5kdc/kadm5.keytab kadmin/changepw
kadmin.local:  exit
```

## Service

```sh
sudo systemctl enable --now krb5kdc
```

```sh
sudo systemctl enable --now kadmin
```

## Client

# Host

```sh
sudo tee -a /etc/hosts << EOF
[IP] client.xyz.tld
[IP] kdc.xyz.tld
EOF
```

```sh
sudo hostnamectl set-hostname client.xyz.tld
```

```sh
hostnamectl status
```

# Keytab

```sh
sudo kadmin

kadmin:  addprinc -randkey host/client.xyz.tld
kadmin:  ktadd host/client.xyz.tld
kadmin:  exit
```

```sh
sudo mkdir -p /etc/security/keytabs
```

```sh
sudo mv /etc/krb5.keytab /etc/security/keytabs
```

```sh
sudo chmod 400 /etc/security/keytabs/krb5.keytab
```
