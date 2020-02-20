# Bootstrap

## Server

### Host

```sh
sudo tee -a /etc/hosts << EOF
[IP] kdc.example.com
[IP] client.example.com
EOF
```

```sh
sudo hostnamectl set-hostname kdc.example.com
```

```sh
hostnamectl status
```

## Configuration

##

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
 default_realm = EXAMPLE.COM
 default_ccache_name = KEYRING:persistent:%{uid}

[realms]
 EXAMPLE.COM = {
  kdc = kdc.example.com
  admin_server = kdc.example.com
 }

[domain_realm]
 .example.com = EXAMPLE.COM
 example.com = EXAMPLE.COM
```

##

```sh
sudo vim /var/kerberos/krb5kdc/kdc.conf
```

```conf
[kdcdefaults]
 kdc_ports = 88
 kdc_tcp_ports = 88

[realms]
 EXAMPLE.COM = {
  # master_key_type = aes256-cts
  default_principle_flags = +preauth
  acl_file = /var/kerberos/krb5kdc/kadm5.acl
  dict_file = /usr/share/dict/words
  admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
  supported_enctypes = aes256-cts:normal aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal camellia256-cts:normal camellia128-cts:normal des-hmac-sha1:normal des-cbc-md5:normal des-cbc-crc:normal
 }
```

##

```sh
sudo vim /var/kerberos/krb5kdc/kadm5.acl
```

```acl
*/[FQDN]@[REALM] *
```

##

```sh
sudo kdb5_util create -r EXAMPLE.COM -s
```

##

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
[IP] client.example.com
[IP] kdc.example.com
EOF
```

```sh
sudo hostnamectl set-hostname client.example.com
```

```sh
hostnamectl status
```

# Keytab

```sh
sudo kadmin

kadmin:  addprinc -randkey host/client.example.com
kadmin:  ktadd host/client.example.com
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
