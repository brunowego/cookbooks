# Puppet

## CLI

### Installation

#### Homebrew

```sh
brew tap puppetlabs/puppet
brew cask install puppet-agent puppet-bolt pdk
```

#### APT

```sh
sudo apt update
sudo apt -y install puppet
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo yum -y install puppet
```

### Service

#### Linux

```sh
sudo systemctl enable --now puppet
```

### Commands

```sh
puppet help
```

#### Agent

```sh
# enable
puppet agent --enable

# disable
puppet agent --disable

# status
cat "$(puppet config print vardir)/state/agent_disabled.lock"
```

### Issues

#### Locale

```sh
LC_ALL=en_US.UTF-8 \
  puppet help
```

#### Stopping

```sh
sudo systemctl status puppet
sudo systemctl disable --now puppet
```

```sh
sudo chkconfig puppet
sudo chkconfig puppet off
```

```sh
sudo crontab -l
sudo crontab -l | sed '/puppet agent/ s/^\(.*\)$/# \1/g' | sudo crontab -
```
