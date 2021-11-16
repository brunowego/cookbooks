# Mozilla Firefox

## Extensions

- [1Password](https://addons.mozilla.org/en-US/firefox/addon/1password-x-password-manager/)
- [AutoFormer+](https://addons.mozilla.org/en-US/firefox/addon/autoformer/)
- [AWS Extend Switch Roles](https://addons.mozilla.org/en-US/firefox/addon/aws-extend-switch-roles3/)
- [Cloudinary Media Inspector](https://addons.mozilla.org/en-US/firefox/addon/cloudinary-media-inspector/)
- [CORS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/cors-everywhere/)
- [HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/)
- [Language Switch](https://addons.mozilla.org/en-US/firefox/addon/languageswitch/)
- [Prometheus Formatter](https://addons.mozilla.org/en-US/firefox/addon/prometheus-formatter/)
- [Proxy Switcher and Manager](https://addons.mozilla.org/en-US/firefox/addon/proxy-switcher-and-manager/)
- [Temporary Containers](https://addons.mozilla.org/en-US/firefox/addon/temporary-containers/)
- [Wappalyzer](https://addons.mozilla.org/en-US/firefox/addon/wappalyzer/)

## Alternatives

- [Mozilla Firefox Developer Edition](/mozilla/mozilla-firefox-developer-edition.md)

## App

### References

- [Releases FTP](https://ftp.mozilla.org/pub/firefox/releases/)

### Installation

#### Homebrew

```sh
brew install \
  --cask \
  --appdir='/Applications' \
  firefox
```

### Docs

#### Certificates

1. Preferences
2. Privacy & Security
3. Security -> Certificates -> View Certificates...
4. Authorities Tab -> Import

#### Screenshot

1. Page actions
2. Take a Screenshot -> Save full page

### Uninstall

#### APT

```sh
sudo apt --purge -y autoremove firefox

rm -fR ~/.mozilla/firefox ~/.cache/mozilla/firefox
sudo rm -fR /etc/firefox /usr/lib/firefox /usr/lib/firefox-addons
```

### Issues

#### CORS

```log
CORS Missing Allow Origin
NS_ERROR_DOM_BAD_URI
```

Enable "CORS Everywhere" plugin.

## CLI

### Configuration

```sh
# Darwin
ln -s '/Applications/Firefox.app/Contents/MacOS/firefox' '/usr/local/bin/firefox'
```

### Commands

```sh
firefox -ProfileManager
```

### Usage

```sh
#
firefox --setDefaultBrowser

#
firefox [url]

#
firefox --new-window [url]

#
firefox --private-window

#
firefox --search [text]

#
firefox --safe-mode

#
firefox --headless --screenshot {{path/to/output_file.png}} {{https://example.com/}}

#
firefox --profile {{path/to/directory}} {{https://example.com/}}
```
