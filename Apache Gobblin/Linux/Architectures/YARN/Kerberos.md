# Kerberos

```sh
sudo tee -a /opt/gobblin/conf/yarn/application.conf << EOF
gobblin.yarn.keytab.file.path=/etc/security/keytabs/[name].keytab
gobblin.yarn.keytab.principal.name=admin
EOF
```

```sh
sudo systemctl restart gobblin-yarn
```
