# Testing TLS/SSL encryption (testssl)

## Links

- [Main Website](https://testssl.sh/)

## Glossary

- Top-Level Domain (TLD)

## CLI

### Installation

#### Homebrew

```sh
brew install testssl
```

### Commands

```sh
testssl.sh --help
```

### Usage

```sh
#
testssl.sh -t smtp <smtphost>.<tld>:587

#
testssl.sh -t ftp <ftphost>.<tld>:21

#
testssl.sh -t xmpp <jabberhost>.<tld>:5222

#
testssl.sh -t xmpp --xmpphost <XMPP domain> <jabberhost>.<tld>:5222

#
testssl.sh -t imap <imaphost>.<tld>:143
```
