# Twilio

<!--
https://github.com/fonoster/fonoster
-->

<!--
TWILIO_ACCOUNT_SID=
TWILIO_AUTH_TOKEN=
TWILIO_SENDER_PHONE_NUMBER=
-->

## Links

- [Main Website](https://twilio.com)
- [Console](https://console.twilio.com)

## CLI

### Links

- [Docs](https://twilio.com/docs/twilio-cli)

### Installation

#### Homebrew

```sh
brew tap twilio/brew
brew install twilio
```

### Commands

```sh
twilio -h
twilio api -h
```

### Initialize

```sh
#
twilio login
```

### Usage

```sh
#
twilio api core messages list

#
twilio phone-numbers:list

#
twilio api core messages create \
  --from '+15017122661' \
  --to '+15558675310' \
  --body 'I sent this from my terminal 😎'
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Twilio
eval "$(twilio autocomplete:script zsh)" # bash
```

```sh
source ~/.zshrc
```
