# Node version management (n)

## CLI

### Installation

#### Homebrew

```sh
brew install n
```

#### NPM

```sh
npm install n -g
```

### Configuration

```sh
# Homebrew
sudo install -dm 775 -o "$USER" -g admin /usr/local/n
```

### Commands

```sh
n -h
```

### Usage

```sh
# Versions
n --latest
n --lts
n ls-remote --all | sort -n

# Install
n latest
n lts
n [version]

# List Versions
n ls

# Select Version
n

# Remove
n rm [version]
n ls | xargs n rm

# Remove versions except current
n prune
```
