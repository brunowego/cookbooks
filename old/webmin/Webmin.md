# Webmin

## YUM

```sh
yum check-update
sudo yum -y install vim
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/webmin.repo
[Webmin]
name=Webmin Distribution Neutral
#baseurl=http://download.webmin.com/download/yum
mirrorlist=http://download.webmin.com/download/yum/mirrorlist
enabled=1
EOF
```

```sh
sudo rpm --import http://www.webmin.com/jcameron-key.asc
yum check-update
```

```sh
yum check-update
sudo yum -y install webmin
```

```sh
sudo chkconfig webmin on
```

```sh
sudo systemctl start webmin
```

Open [https://192.168.33.10:10000](https://192.168.33.10:10000)

```sh
sudo /usr/libexec/webmin/changepass.pl /etc/webmin root secret
```

```txt
Username: root
Password: secret
```

### Change Port

```sh
sudo sed -i "s/port=10000/port=443/" /etc/webmin/miniserv.conf \
 && sudo sed -i "s/listen=10000/listen=443/" /etc/webmin/miniserv.conf
```

```sh
sudo /etc/webmin/restart
```

### Security

```sh
sudo systemctl start firewalld
sudo firewall-cmd --state
```

```sh
sudo firewall-cmd --add-port=10000/tcp --permanent
```

```sh
sudo firewall-cmd --add-port=443/tcp --permanent
sudo firewall-cmd --remove-port=10000/tcp --permanent
```

```sh
sudo firewall-cmd --reload
sudo /etc/webmin/restart
```
