# Confluent

<!--
https://github.com/davidmweber/lxc-kafka-playground/tree/master
-->

## CLI

### References

- [Packages](https://packages.confluent.io/archive/5.3/)

### Repositories

<!-- #### APT

```sh
curl -fsSL 'https://packages.confluent.io/deb/5.3/archive.key' | apt-key add -
``` -->

#### YUM

```sh
sudo rpm --import 'https://packages.confluent.io/rpm/5.3/archive.key'
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/confluent.repo
[Confluent.dist]
name=Confluent repository (dist)
baseurl=https://packages.confluent.io/rpm/5.3/7
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/5.3/archive.key
enabled=1

[Confluent]
name=Confluent repository
baseurl=https://packages.confluent.io/rpm/5.3
gpgcheck=1
gpgkey=https://packages.confluent.io/rpm/5.3/archive.key
enabled=1
EOF
```
