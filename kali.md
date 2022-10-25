# Kali Linux

<!--
https://kali.download/virtual-images/kali-2022.3/kali-linux-2022.3-virtualbox-amd64.7z.torrent
-->

## Links

- [Org. Repository](https://gitlab.com/kalilinux)
- [Main Website](https://kali.org/)
- [Download](https://kali.org/get-kali/)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kali \
  --name kali \
  --network workbench \
  docker.io/kalilinux/kali:amd64 /bin/bash
```

<!--
samdump2 system SAM
hash-identifier
-->
