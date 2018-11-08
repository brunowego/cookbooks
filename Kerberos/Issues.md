# Issues

## Cannot locate default realm

```sh
sudo sed -i '/\[libdefaults\]/a \ default_realm = [DOMAIN.COM]' /etc/krb5.conf
```
