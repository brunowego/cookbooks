# GNU Privacy Guard (GnuPG / GPG) or GNU Pretty Good Privacy (PGP)

<!--
https://github.com/miccal/personal-files/blob/master/README.md#pass
-->

## CLI

### Installation

#### Homebrew

```sh
brew install gpg
```

#### APT

```sh
sudo apt update
sudo apt -y install gnupg
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# GnuPG
export GPG_TTY="$(tty)"
gpgconf --launch gpg-agent
```

```sh
sudo su - "$USER"
```

### Commands

```sh
gpg -h
```

### Usage

```sh
#
gpg --list-keys
gpg --list-secret-keys
```

### Tips

#### Unsafe Permissions

**Warning:** Unsafe permissions on home dir `~/.gnupg`.

```sh
chmod 700 ~/.gnupg
```

#### Gen Key

```sh
gpg --gen-key --pinentry-mode loopback

#
echo 'it works' | gpg --clearsign

#
gpg --list-secret-keys --keyid-format SHORT
```

<!-- ####

https://gist.github.com/phortuin/cf24b1cca3258720c71ad42977e1ba57

```sh
#
mkdir ~/.gnupg

#
echo 'use-agent' > ~/.gnupg/gpg.conf

#
cat << EOF > ~/.gnupg/gpg-agent.conf
default-cache-ttl 34560000
max-cache-ttl 34560000
EOF

#
gpg --full-gen-key
```

1. Please select what kind of key you want: 4 (RSA, sign only)
2. What keysize do you want? (3072): 4096
3. Please specify how long the key should be valid: 2y (your key will expire after 2 years; you should set a reminder somewhere) -->

### Issues

#### Not installed

```log
E: gnupg, gnupg2 and gnupg1 do not seem to be installed, but one of them is required for this operation
```

Just install.

#### TBD

```log
gpg: <key>: skipped: No public key
gpg: [stdin]: encryption failed: No public key
Password encryption aborted.
```

TODO
