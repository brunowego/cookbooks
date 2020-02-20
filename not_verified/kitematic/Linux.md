# Linux

## Installation

### APT

```sh
curl -sSL https://get.docker.com/ubuntu/ | sudo /usr/bin/sh

#
sudo gpasswd -a ${USER} docker
```

```sh
sudo systemctl restart docker

#
newgrp docker
```

```sh
cd /opt

#
sudo git clone https://github.com/zedtux/kitematic
```

```sh
cd kitematic

#
sudo git checkout linux-support && sudo make
```

```sh
chmod -R g+w .
chgrp -R docker .
```

```sh
npm start
```
