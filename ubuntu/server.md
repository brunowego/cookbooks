# Ubuntu Server

## Installation

### Download

```sh
# Ubuntu Desktop 20.04.3
axel -kn 32 'https://releases.ubuntu.com/20.04.3/ubuntu-20.04.3-live-server-amd64.iso'

echo 'f8e3086f3cea0fb3fefb29937ab5ed9d19e767079633960ccb50e76153effc98 *ubuntu-20.04.3-live-server-amd64.iso' | \
  shasum -a 256 --check
```

### Bootable USB

- [balenaEtcher](/balenaetcher.md)

### Partition

| Type | Mount      | Size   |
| ---- | ---------- | ------ |
| efi  |            | 512 MB |
| swap |            | 30 GB  |
| ext4 | `/`        | 20 GB  |
| ext4 | `/boot`    | 1 GB   |
| ext4 | `/home`    | 20 GB  |
| ext4 | `/srv`     | 20 GB  |
| ext4 | `/usr`     | 30 GB  |
| ext4 | `/var`     | 20 GB  |
| ext4 | `/var/lib` | 20 GB  |
| ext4 | `/opt`     | 25 GB  |
