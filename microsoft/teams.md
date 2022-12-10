# Microsoft Teams

## Links

- [Main Website](https://teams.microsoft.com/)
- [Microsoft 365](https://office.com)

## App

### Dependencies

- [cURL](/curl.md)
- [GNU Privacy Guard](/gnupg.md)

### Installation

#### Homebrew

```sh
brew install --cask microsoft-teams
```

#### APT

```sh
echo 'deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main' | sudo tee /etc/apt/sources.list.d/ms-teams.list
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

sudo apt update
sudo apt -y install teams
```

#### YUM

```sh
sudo rpm --import 'https://packages.microsoft.com/keys/microsoft.asc'
```

```sh
cat << EOF | sudo tee /etc/yum.repos.d/ms-teams.repo
[msteams]
name=Microsoft Teams
baseurl=https://packages.microsoft.com/yumrepos/ms-teams
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
```

```sh
yum check-update
sudo yum -y install teams
```

#### Zypper

<!-- ```sh
sudo rpm --import 'https://packages.microsoft.com/keys/microsoft.asc'
``` -->

```sh
cat << EOF | sudo tee /etc/zypp/repos.d/ms-teams.repo
[msteams]
name=Microsoft Teams
baseurl=https://packages.microsoft.com/yumrepos/ms-teams
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
```

```sh
sudo zypper refresh
sudo zypper install -y teams
```

#### Chocolatey

```sh
choco install -y microsoft-teams
```

### Issues

<!-- ####

```txt
https://[*.]microsoft.com
https://[*.]microsoftonline.com
https://[*.]teams.skype.com
https://[*.]teams.microsoft.com
https://[*.]sfbassets.com
https://[*.]skypeforbusiness.com
``` -->

<!--
https://learn.microsoft.com/en-us/microsoftteams/troubleshoot/teams-sign-in/sign-in-loop#resolution
-->

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

### Issues

#### Brave's Provacy Protections

```sh
To open the web app, change your browser settings to allow third-party cookies or allow certain trusted domains.
```

If you are using Brave Browser, disable the Brave shield.
