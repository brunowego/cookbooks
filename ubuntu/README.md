# Ubuntu

## Derivative

- [Ubuntu MATE](https://ubuntu-mate.org/)
- [Lubuntu](https://lubuntu.net/)

## References

- [GSettings](/gsettings.md)

- [Fixing Ubuntu Freezing at Boot Time](https://itsfoss.com/fix-ubuntu-freezing/)
- [Releases Ubuntu from University of Kent Mirror Service](https://www.mirrorservice.org/sites/releases.ubuntu.com/18.04.3/)

## Host

### Installation

#### Download

```sh
# Ubuntu Desktop 20.04.3
axel -kn 32 'https://ubuntu.itsbrasil.net/ubuntu-releases/20.04.3/ubuntu-20.04.3-desktop-amd64.iso'

echo '5fdebc435ded46ae99136ca875afc6f05bde217be7dd018e1841924f71db46b5 *ubuntu-20.04.3-desktop-amd64.iso' | \
  shasum -a 256 --check
```

#### Bootable USB

- [balenaEtcher](/balenaetcher.md)

#### Partition

| Type | Mount   | Size   |
| ---- | ------- | ------ |
| efi  |         | 650 MB |
| swap |         | 20 GB  |
| ext4 | `/`     | 40 GB  |
| ext2 | `/boot` | 300 MB |
| ext4 | `/home` | 50 GB  |

<!-- ```sh
#
diskutil list

#
sudo dd \
  if=ubuntu-20.04.3-desktop-amd64.iso \
  of=/dev/disk4 \
  bs=1M \
  status=progress
``` -->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ubuntu \
  --name ubuntu \
  --network workbench \
  docker.io/library/ubuntu:22.04 /bin/bash

#
docker exec -it ubuntu /bin/bash

# Remove
docker rm -f ubuntu
```

#### Work Directory

```sh
#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ubuntu \
  --name ubuntu \
  -v "$(pwd)":/usr/src/app \
  -w /usr/src/app \
  --network workbench \
  docker.io/library/ubuntu:22.04 /bin/bash
```

## Tips

### Setting Default Editor

```sh
sudo update-alternatives --config editor
```

### Do nothing when close laptop lid

```sh
#
sudo sed -i 's/^#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g' /etc/systemd/logind.conf

#
sudo reboot
```

### Create a bootable USB stick

#### Darwin

1. Open Disk Utility
2. Select External Device
   - Erase
     - Name: UBUNTU
     - Format: MS-DOS (FAT)
3. Open balenaEtcher

## Kubectl

### Running

```sh
kubectl run -it --rm \
  --image docker.io/library/ubuntu:20.04 \
  --limits 'cpu=2,memory=2Gi' \
  --requests 'cpu=2,memory=2Gi' \
  --restart Never \
  ubuntu \
  -- /bin/bash
```
