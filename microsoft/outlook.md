# Microsoft Outlook

## Links

- [Main Website](https://outlook.office.com/mail/)

## Glossary

- Internet Calendar Scheduling (ICS)

## App

### Installation

#### MAS

```sh
mas install 985367838
```

### Tips

#### Share Calendar

1. [Outlook Mail](https://outlook.office.com/mail/)
2. Settings -> View all Outlook settings
3. Calendar Tab -> Shared calendars Sub-tab
4. Publish a calendar
   - Select a calendar: Calendar
   - Select: Cal view all details
   - Publish
   - Copy ICS link

### Issues

#### Proxy

Bypass external proxies for the following hosts:

```txt
*.live.com
*.microsoft.com
*.office.com
*.office365.com
*.skype.com
```

### Uninstall

```sh
# MAS
sudo mas uninstall 985367838
```
