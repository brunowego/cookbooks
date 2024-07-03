# pass

<!--
https://github.com/roddhjav/pass-import
https://github.com/tadfisher/pass-otp
-->

**Keywords:** Password Manager

Stores, retrieves, generates, and synchronizes passwords securely.

## Links

- [Main Website](https://passwordstore.org/)

## Glossary

- GNU Privacy Guard (GPG)

## CLI

### Dependencies

- [GNU Privacy Guard (GnuPG / GPG) or GNU Pretty Good Privacy (PGP)](/gnu/pg.md)

### Installation

#### Homebrew

```sh
brew install pass
```

#### APT

```sh
sudo apt update
sudo apt -y install pass
```

### Commands

```sh
man pass
```

### Initialize

**Dependency:** [GnuPG / Gen Key](/gnu/pg.md#gen-key)

```sh
#
gpg --list-keys

#
pass init <gpg-id>

#
ls ~/.password-store
```

### Usage

```sh
#
pass ls

#
pass insert <path/to/key>
pass insert godaddy.com/api/key

#
pass show <path/to/key>
pass show godaddy.com/api/key

#
pass edit <path/to/key>

#
pass rm <path/to/key>
```

<!--
pass generate github.com/ibihim/repository 20
pass grep
pass find
pass edit
pass generate
pass mv
pass cp
pass git
-->
