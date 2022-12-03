# Secretive

<!--
Not Support: Azure DevOps (RSA)
-->

<!--
https://github.com/sekey/sekey
-->

**Keywords:** Secure Enclave

## Links

- [Code Repository](https://github.com/maxgoedjen/secretive)

## Glossary

- Edwards-curve Digital Signature Algorithm (EdDSA)
- Elliptic Curve Digital Signature Algorithm (ECDSA)

## App

### Installation

#### Homebrew

```sh
brew install secretive
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Secretive
export SSH_AUTH_SOCK="$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"
```

```sh
source ~/.zshrc
```

### Tips

#### List Public Keys

```sh
ls -la "$HOME"/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/PublicKeys
```

### Uninstall

#### Homebrew

```sh
brew uninstall secretive
```
