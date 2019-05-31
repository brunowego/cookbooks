# Linux

## Dependencies

### YUM

```sh
sudo yum check-update
sudo yum -y install java-1.8.0-openjdk
```

### APT

```sh
sudo apt update
sudo apt -y install openjdk-8-jre
```

## Installation

### RPM

```sh
curl -LO https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
sudo rpm -vi dbeaver-ce-latest-stable.x86_64.rpm && rm -f dbeaver-ce-latest-stable.x86_64.rpm
```

### DPKG

```sh
curl -LO https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
sudo dpkg -i dbeaver-ce_latest_amd64.deb && rm -f dbeaver-ce_latest_amd64.deb
```
