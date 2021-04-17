# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  config.vm.network :private_network, type: 'dhcp'

  config.vm.synced_folder './', '/vagrant', type: 'nfs'
end
```
