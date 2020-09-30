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
