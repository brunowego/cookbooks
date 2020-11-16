# Node version management (n)

## References

- [GitHub Repository](https://github.com/tj/n)

## CLI

### Dependencies

- [cURL](/curl.md)

#### Linux

- [Node.js](/nodejs.md)

### Installation

#### Homebrew

```sh
brew install n
```

#### Unix-like

```sh
sudo curl 'https://raw.githubusercontent.com/tj/n/master/bin/n' -o /usr/local/bin/n && \
  sudo chmod +x /usr/local/bin/n
```

#### NPM

```sh
npm install n -g
```

### Configuration

```sh
# Unix-like
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share
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
