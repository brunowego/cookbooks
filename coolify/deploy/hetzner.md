# Hetzner

## Links

- [Console](https://console.hetzner.cloud)

## Instructions

1. [Projects](https://console.hetzner.cloud/projects) -> New project
2. Servers -> Add Server
3. Create a server
   - Location: Ashburn, VA (us-east)
   - Image: Ubuntu 24.04
   - Type: CPX21
   - Networking:
   - SSH keys: Add your SSH key
   - Volumes:
   - Firewalls:
   - Backups:
   - Placement groups:
   - Labels:
   - Cloud config:
   - Name: `coolify`
4. Install Coolify: `curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash`
5. Onboarding
   - Server: Localhost

## Tips

### Domain

1. Settings
2. Configuration -> Instance Settings
   - Instance's Domain: `coolify.example.com`
   - Instance's Name: Coolify

### Firewall

1. [Projects](https://console.hetzner.cloud/projects)
2. Firewalls -> Create Firewall
   - Inbound rules:
     - TCP: 22
     - TCP: 80
     - TCP: 443
   - Apply to -> Server -> `coolify`

### Transactional Email

TODO
