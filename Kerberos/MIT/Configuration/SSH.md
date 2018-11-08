# SSH

## Kerberos Server

### Configuration

#### YUM

```sh
sudo vim /etc/ssh/sshd_config
```

```conf
KerberosAuthentication yes
GSSAPICleanupCredentials yes
```

```sh
sudo systemctl restart sshd
```

## Kerberos Client

### Configuration

#### Unix-like

```sh
sudo vim /etc/ssh/ssh_config
```

```sh
Host *.example.com
  GSSAPIAuthentication yes
  GSSAPIDelegateCredentials yes
```
