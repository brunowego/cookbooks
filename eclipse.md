# Eclipse

## App

### Installation

#### Homebrew

```sh
#
brew cask install eclipse-java

#
brew cask install eclipse-jee

#
brew cask install eclipse-javascript

#
brew cask install eclipse-php
```

### Configuration

```sh
# Git ignore
cat << EOF >> ~/.gitignore_global
/.classpath
/.project
EOF
```

### Issues

#### SSL Connect

```log
OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to marketplace.eclipse.org:443
```

Configure proxy.
