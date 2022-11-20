# kubectl-oidc-login

<!--
https://github.com/int128/kubelogin/blob/master/docs/setup.md
https://artifacthub.io/packages/krew/krew-index/oidc-login
-->

## Links

- [Code Repository](https://github.com/int128/kubelogin)

## Installation

### Homebrew

```sh
brew tap int128/kubelogin
brew install kubelogin
```

### Krew

```sh
kubectl krew install oidc-login
```

### Chocolatey

```sh
choco install -y kubelogin
```

## Commands

```sh
kubectl oidc-login -h
kubelogin -h
```

## Usage

```sh
#
kubectl oidc-login setup \
  --oidc-issuer-url https://accounts.google.com \
  --oidc-client-id <client-id> \
  --oidc-client-secret <client-secret>
```
