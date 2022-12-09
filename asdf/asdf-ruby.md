# asdf Ruby

## Dependencies

- [GNU Core Utilities](/gnu-coreutils.md)
- [GNU Pretty Good Privacy (PGP)](/gnu-pg.md)

## Installation

```sh
asdf plugin-add ruby 'https://github.com/asdf-vm/asdf-ruby.git'
```

## Usage

```sh
#
asdf list-all ruby

#
KEEP_SOURCE=1 \
  asdf install ruby <version>

#
asdf global ruby <version>

#
asdf list ruby

#
asdf reshim ruby <version>
```
