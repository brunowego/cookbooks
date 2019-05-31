# Provisions

## Shell

### Command

```rb
config.vm.provision :shell, inline: 'sudo apt update'
```

### Multi-line string

```rb
config.vm.provision :shell, inline: <<-EOSHELL
  apt update
  apt -y install ansible
  apt upgrade -y
  apt autoremove -y
EOSHELL
```

### File path

```rb
config.vm.provision :shell, path: '[filename]'
```

## Ansible

```rb
config.vm.provision :ansible do |ansible|
  # ansible.sudo = true
  ansible.playbook = './ansible/playbook.yml'
  ansible.galaxy_role_file = './ansible/requirements.yml'
  ansible.verbose = 'vvv'
end
```
