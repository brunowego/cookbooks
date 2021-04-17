# Linux

## Installation

### APT

```sh
sudo apt update
sudo apt -y install mysecureshell
```

## Configuration

```sh
sudo usermod -s /usr/bin/mysecureshell [username]
sudo usermod -s `which bash` [username]
```

## Service

```sh
sudo systemctl restart mysecureshell
```
