# SSH Tunnel (a.k.a. SSH Tunneling, or SSH Port Forwarding)

## Glossary

- Graphical User Interface (GUI)

## Tools

### GUI

- [Core Tunnel](/core-tunnel.md) 🌟
- [Secure Pipes](/secure-pipes.md)
- [SSH Tunnel Manager](/ssh-tunnel-manager.md)

## Running

```sh
#
ssh \
  -N \
  -L <local-port>:<target-host>:<target-port> \
  <username>@<hostname>
  # -v
```
