# Certificate Authority (ca-certificates)

## Installation

### APT

```sh
sudo apt update
sudo apt -y install ca-certificates
```

## Commands

```sh
update-ca-certificates
```

## Tips

### Installing a root/CA Certificate

```sh
sudo mkdir /usr/local/share/ca-certificates/extra
```

```sh
sudo cp [certificate].crt /usr/local/share/ca-certificates/extra
```

```sh
sudo update-ca-certificates
```
