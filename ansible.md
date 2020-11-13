# Ansible

<!--
https://www.linkedin.com/learning/learning-ansible-2/starting-your-ansible-journey
-->

## CLI

### Installation

#### Homebrew

```sh
brew install ansible
```

#### YUM

```sh
yum check-update
sudo yum -y install centos-release-ansible26
sudo yum -y install ansible
```

#### APT

##### Trusty Tahr 14.04

```sh
sudo apt update
sudo apt -y install software-properties-common
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
```

```sh
sudo tee /etc/apt/sources.list.d/ansible-2.6.list << EOF
deb http://ppa.launchpad.net/ansible/ansible-2.6/ubuntu trusty main
deb-src http://ppa.launchpad.net/ansible/ansible-2.6/ubuntu trusty main
EOF
```

```sh
sudo apt update
sudo apt -y install ansible
```

##### Xenial Xerus 16.04 and newer

```sh
sudo add-apt-repository -y ppa:ansible/ansible-2.6
sudo apt update
sudo apt -y install ansible
```

#### APK

```sh
sudo apk update
sudo apk add ansible
```

### Commands

```sh
ansible -h
```

### Usage

```sh
ansible-playbook ./playbooks/[name].yml -l [name]
```

### Tips

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 ansible\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```
