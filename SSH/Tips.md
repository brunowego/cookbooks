# Tips

## Root Only With Key

```sh
sed -i 's/PermitRootLogin yes/PermitRootLogin without-password/' /etc/ssh/sshd_config
```

```sh
service ssh restart
```

## Direct

### Linux

```sh
cat ~/.ssh/id_rsa.pub | ssh [username]@[IP] 'cat >> ~/.ssh/authorized_keys'
```
