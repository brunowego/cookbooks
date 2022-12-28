# GNU Stow

## Links

- [Code Repository](https://github.com/aspiers/stow)
- [Main Website](https://gnu.org/software/stow/)

## CLI

### Installation

#### Homebrew

```sh
brew install stow
```

### Commands

```sh
stow -h
```

### Configuration

```sh
cat << EOF > ./.stowrc
-t $HOME
--ignore \*.md
-v
EOF
```

### Usage

```sh
#
stow ./
```
