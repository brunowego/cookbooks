# Warpgate

<!--
https://github.com/andreee94/terraform-provider-warpgate
-->

**Keywords:** Bastion Host, IAP

![Warpgate](/assets/images/warpgate/warpgate.png)

## Links

- [Code Repository](https://github.com/warp-tech/warpgate)

## Docs

- [Adding a MySQL target](https://github.com/warp-tech/warpgate/wiki/Adding-a-MySQL-target)
- [Adding an HTTP target](https://github.com/warp-tech/warpgate/wiki/Adding-an-HTTP-target)
- [Adding an SSH target](https://github.com/warp-tech/warpgate/wiki/Adding-an-SSH-target)
- [OTP (2 factor authentication)](<https://github.com/warp-tech/warpgate/wiki/OTP-(2-factor-authentication)>)
- [Protocol support](https://github.com/warp-tech/warpgate/wiki/Protocol-support)
- [SSO Authentication](https://github.com/warp-tech/warpgate/wiki/SSO-Authentication)
- [User authentication and roles](https://github.com/warp-tech/warpgate/wiki/User-authentication-and-roles)

## Glossary

- Demilitarized Zone (DMZ)
- Infrastructure Access Platform (IAP)
- Role-Based Access Control (RBAC)
- Two-factor authentication (2FA)

## SSO Support

- OpenID Connect (OIDC)
- Time-Based One-Time Password (TOTP)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run --rm -it \
  -v warpgate-data:/data \
  --name warpgate-setup \
  --network workbench \
  ghcr.io/warp-tech/warpgate:v0.7.0 setup

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h warpgate \
  -v warpgate-data:/data \
  -p 2222:2222 \
  -p 8888:8888 \
  --name warpgate \
  --network workbench \
  ghcr.io/warp-tech/warpgate:v0.7.0
```

### Remove

```sh
docker rm -f warpgate

docker volume rm warpgate-data
```

## CLI

### Installation

#### Darwin Binary

```sh
curl \
  -L 'https://github.com/warp-tech/warpgate/releases/download/v0.7.0/warpgate-v0.7.0-x86_64-macos' \
  -o /usr/local/bin/warpgate && \
    chmod +x /usr/local/bin/warpgate
```

#### Linux Binary

```sh
curl \
  -L 'https://github.com/warp-tech/warpgate/releases/download/v0.7.0/warpgate-v0.7.0-x86_64-linux' \
  -o /usr/local/bin/warpgate && \
    chmod +x /usr/local/bin/warpgate
```

### Commands

```sh
warpgate -h
```

### Setup

```sh
#
sudo warpgate setup
```

### Usage

```sh
#
sudo warpgate -c /etc/warpgate.yaml check

#
sudo warpgate client-keys

#
sudo warpgate recover-access

#
sudo warpgate run

#
sudo warpgate test-target <target-name>

#
sudo warpgate unattended-setup \
  --data-path <path> \
  --http-port <port>
```

### Uninstall

```sh
# Darwin
sudo rm -fR /etc/warpgate.yaml
sudo rm -fR /usr/local/var/lib/warpgate
```
