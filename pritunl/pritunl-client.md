# Pritunl Client

<!--
https://www.sparklabs.com/viscosity/
https://medium.com/@adrian_cooney/how-to-convert-pritunl-profiles-to-viscosity-for-macos-754bd81a574c
-->

## Links

- [Main Website](https://client.pritunl.com)
- [Code Repository](https://github.com/pritunl/pritunl-client-electron)

## App

### Dependencies

#### APT

- [lsb-release](/lsb-release.md)
- [GNU Privacy Guard](/gnupg.md)

### Installation

#### Homebrew

```sh
brew install pritunl
```

#### APT

```sh
sudo echo "deb https://repo.pritunl.com/stable/apt $(lsb_release -cs) main" > /etc/apt/sources.list.d/pritunl.list

sudo apt-key adv \
  --keyserver hkp://keyserver.ubuntu.com \
  --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

sudo apt update
sudo apt -y install pritunl-client-electron
```

#### Chocolatey

```sh
choco install pritunl-client
```

### Issues

#### Ignore Certificate Verification

```log
Certificate verification failed: The certificate is NOT trusted. The certificate issuer is unknown.  Could not handshake: Error in the certificate verification. [IP: 0.0.0.0 443]
```

```sh
sudo echo "deb [trusted=yes] https://repo.pritunl.com/stable/apt $(lsb_release -cs) main" > /etc/apt/sources.list.d/pritunl.list
```

#### Multiple VPNs Connected

Check if have more than one VPN connected.

#### Bypass Secondary Authentication

```log
ERROR User auth failed "Failed secondary authentication"
```

1. Select User
2. Modal "Modify User" -> Advanced
3. Check "Bypass Secondary Authentication"

<!-- ####

```log
[lively-fields-4480][2021-08-17 12:29:22,440][ERROR] Google auth check error
Traceback (most recent call last):

HttpAccessTokenRefreshError: unauthorized_client: Client is unauthorized to retrieve access tokens using this method, or client not authorized for any of the scopes requested.
```

TODO -->
