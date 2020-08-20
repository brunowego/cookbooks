# Microsoft Teams

## App

### Dependencies

- [cURL](/curl.md)
- [GNU Privacy Guard](/gnupg.md)

### Installation

#### Homebrew

```sh
brew cask install microsoft-teams
```

#### APT

```sh
echo 'deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main' | sudo tee /etc/apt/sources.list.d/teams.list
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo apt update
sudo apt -y install teams
```

<!-- #### Zypper

```sh
sudo zypper refresh
sudo zypper install -y teams
``` -->

#### Chocolatey

```sh
choco install -y microsoft-teams
```

### Issues

#### Proxy

Bypass external proxies for the following hosts:

```txt
*.live.com
*.microsoft.com
*.skype.com
```

### Tips

#### As other user

```sh
# Darwin
dscl . list /Users | grep -v '^_'

#
sudo -u root bash -c 'open /Applications/Microsoft\ Teams.app/Contents/MacOS/Teams'
```
