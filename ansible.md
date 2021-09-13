# Ansible

<!--
https://app.pluralsight.com/paths/skill/configuration-management-using-ansible
https://app.pluralsight.com/paths/skill/configuration-management-using-ansible-on-windows
https://app.pluralsight.com/library/courses/automating-networks-ansible-right-way/table-of-contents
https://app.pluralsight.com/library/courses/docker-ansible-continuous-delivery/table-of-contents

https://linkedin.com/learning/learning-ansible-2/starting-your-ansible-journey
https://linkedin.com/learning/ansible-essential-training/welcome
https://linkedin.com/learning/red-hat-certified-engineer-ex294-cert-prep-1-foundations-of-ansible/prepare-for-the-rhce-ex294-certification
https://linkedin.com/learning/red-hat-certified-engineer-ex294-cert-prep-2-using-ansible-playbooks/introduction
https://linkedin.com/learning/red-hat-certified-engineer-ex294-cert-prep-3-managing-systems-with-ansible/introduction

Version v2.6.0
Version v2.10.8
-->

**Keywords:** Configuration Management

## References

- [Roadmap](https://docs.ansible.com/ansible/latest/roadmap/)

## Alternatives

- [Chef](/chef.md)
- [Puppet](/puppet.md)
- SaltStack

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

<!--
## Interview

https://www.youtube.com/watch?v=0tchrzJZgsU&t
https://www.youtube.com/watch?v=euhGLmyaq1Q
https://www.youtube.com/watch?v=u1dY5hoalFM
https://www.youtube.com/watch?v=Or6k2UcKeN4
-->
