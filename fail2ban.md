# Fail2ban

<!--
IPBan

apparmor_status
-->

## Links

- [Code Repository](https://github.com/fail2ban/fail2ban)
- [Main Website](https://fail2ban.org/)

## CLI

### Installation

#### Homebrew

```sh
brew install fail2ban
```

### Commands

```sh
fail2ban-client -h
```

### Service

```sh
# Homebrew
brew services start fail2ban
```

### Usage

```sh
#
fail2ban-client status
fail2ban-client status sshd
```
