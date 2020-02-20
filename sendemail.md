# SendEmail

## CLI

### Installation

#### Dependencies

- [Gmail](/gmail.md#mail-password)

#### Homebrew

```sh
brew install sendemail
```

#### APT

```sh
sudo apt update
sudo apt -y install sendemail
```

### Commands

```sh
sendemail --help
```

### Usage

```sh
cat << EOF > /tmp/mailbody.txt
Hello,
This is an email sent by using the sendemail command.

Your friend,
Me!
EOF

sendemail \
  -f 'noreply@example.com' \
  -t '[receiver]@[domain.com]' \
  -u 'Sending an email using sendemail' \
  -s 'smtp.gmail.com:587' \
  -xu '[username]@gmail.com' \
  -xp '[password]' \
  -l /tmp/email.log \
  -o tls=yes \
  -o message-file='/tmp/mailbody.txt'

cat << EOF
Hello,
This is an email sent by using the sendemail command.

Your friend,
Me!
EOF | \
  sendemail \
    -f 'noreply@example.com' \
    -t '[receiver]@[domain.com]' \
    -u 'Sending an email using sendemail' \
    -s 'smtp.gmail.com:587' \
    -cc '[receiver2]@[domain.com]' \
    -bcc '[receiver3]@[domain.com]' \
    -xu '[username]@gmail.com' \
    -xp '[password]' \
    -l /tmp/email.log \
    -o tls=yes
```
