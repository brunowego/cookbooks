# Kali Linux

**Keywords:** APT

## Links

- [Org. Repository](https://gitlab.com/kalilinux)
- [Main Website](https://kali.org/)
- [Download](https://kali.org/get-kali/)
- [Releases](https://kali.org/releases/)
- [Tools](https://kali.org/tools/)

## Terms

- Information Gathering
- Vulnerability Analysis
- Web Application Analysis
- Database Assessment
- Password Attacks
- Wireless Attacks
- Reverse Engineering
- Exploitation Tools
- Sniffing & Spoofing
- Forensics
- Reporting Tools
- Social Engineering Tools
- System Services

## Docker

### Links

- [Using Kali Linux Docker Images](https://kali.org/docs/containers/using-kali-docker-images/)

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
  docker.io/kalilinux/kali-rolling:amd64 /bin/bash
```

<!--
samdump2 system SAM
hash-identifier
-->
