# Defense in Depth (DiD)

## Images

- **Minimize Footprint:** Don't give hackers more tools to expand their exploits
- **Layer Housekeeping:** Understand how layers work at build and run-time
- **Build Strategies:** Multi-stage, repeatable builds, standardized labeling, alternative tools
- **Secure Supply Chain:** Know where images come from, only CI should push to registries

## Runtime

- **Don't run as root:** You probably don't need it
- **Privileged Containers:** You almost definitely don't need it
- **Drop Capabilities:** Most apps don't need even Linux capabilities; dropping all and allow only what's needed
- **Read Only Root Filesystem:** Immutability makes exploiting your container harder
- **Deploy from known sources:** Pull from known registries only

## Kubernetes

- **Secrets:** Use them but make sure they're encrypted and have RBAC applied
- **RBAC:** Hopefully everybody is using this
- **SecurityContext:** Much of Runtime practices mentioned can be enforced via SC
- **Network Policy:** Start with zero-trust and add allow rules only as necessary
- **Enforcement:** Use OPA (Gatekeeper), Kyverno, etc
