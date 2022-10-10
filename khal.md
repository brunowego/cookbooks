# khal

## Links

- [Main Website](https://lostpackets.de/khal/)

## CLI

### Dependencies

- [vdirsyncer](/vdirsyncer.md)

### Installation

#### Homebrew

```sh
brew install khal
```

### Commands

```sh
khal --help
```

### Configuration

```sh
#
khal configure
```

**Refer:** `./.config/khal/config`

```ini
[calendars]

[[personal]]
path = ~/.config/vdirsyncer/calendars/personal
color = dark green

[[holidays]]
path = ~/.config/vdirsyncer/calendars/holidays
color = dark blue
readonly = True

[default]
default_calendar = personal

[locale]
timeformat = %H:%M
dateformat = %d/%m/%Y
longdateformat = %d/%m/%Y
datetimeformat = %d/%m/%Y %H:%M
longdatetimeformat = %d/%m/%Y %H:%M
```

### Usage

```sh
#
khal list
khal list tomorrow

#
khal calendar

#
khal interactive

#
khal printcalendars

#
khal printformats
khal at now
khal at -d holidays tomorrow 10:00

#
khal new -i

khal new 18:00 Awesome Event
khal list

khal new tomorrow 16:30 Coffee Break
khal list tomorrow

khal new 25/10/2022 18:00 24:00 Another Event :: with Alice and Bob
khal list 25/10/2022
```
