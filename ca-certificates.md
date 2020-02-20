# Certificate Authority (ca-certificates)

## Installation

### APT

```sh
sudo apt update
sudo apt -y install ca-certificates
```

### YUM

TODO

## Commands

```sh
update-ca-certificates
```

## Tips

### Download Certificate

```sh
echo -n | \
  openssl s_client -connect [hostname]:443 | \
  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > [certificate].crt
```

### Installing a root/CA Certificate

```sh
# Linux
sudo mkdir /usr/local/share/ca-certificates/extra

sudo cp [certificate].crt /usr/local/share/ca-certificates/extra

## Ubuntu
sudo update-ca-certificates
```
