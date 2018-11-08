# Providers

## VirtualBox

```rb
config.vm.provider :virtualbox do |vb|
  # [...]

  vb.memory = '2048'
  vb.cpus = 2

  vb.customize ['modifyvm', :id, "--cpuexecutioncap", '50']
  vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
end
```
