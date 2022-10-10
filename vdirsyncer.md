# vdirsyncer

## Links

- [Code Repository](https://github.com/pimutils/vdirsyncer)
- [Main Website](http://vdirsyncer.pimutils.org/en/stable/)

## CLI

### Installation

#### Homebrew

```sh
brew install vdirsyncer
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# vdirsyncer
export VDIRSYNCER_CONFIG="$HOME"/.config/vdirsyncer/config
```

### Configuration

```sh
#
mkdir -p ~/.config/vdirsyncer/status

#
mkdir -p ~/.config/vdirsyncer/calendars/{holidays,personal,work}
```

**Refer:** `~/.config/vdirsyncer/config`

```ini
[general]
status_path = "~/.config/vdirsyncer/status/"

[pair holidays]
a = "holidays_remote"
b = "holidays_local"
collections = null

[storage holidays_local]
type = "filesystem"
path = "~/.config/vdirsyncer/calendars/holidays"
fileext = ".ics"

[storage holidays_remote]
type = "http"
url = "https://calendarlabs.com/ical-calendar/ics/76/US_Holidays.ics"
```

```sh
#
vdirsyncer discover holidays
vdirsyncer discover personal
vdirsyncer discover work

#
vdirsyncer sync
```
