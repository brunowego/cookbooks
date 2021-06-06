# Gremlin

## CLI

### Installation

#### APT

```sh
echo "deb https://deb.gremlin.com/ release non-free" | sudo tee /etc/apt/sources.list.d/gremlin.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9CDB294B29A5B1E2E00C24C022E8EF3461A50EF6

sudo apt update
sudo apt -y install gremlin gremlind
```

#### YUM

```sh
sudo curl https://rpm.gremlin.com/gremlin.repo -o /etc/yum.repos.d/gremlin.repo

sudo check update
sudo yum install -y gremlin gremlind
```
