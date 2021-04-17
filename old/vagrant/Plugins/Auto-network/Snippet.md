# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  config.vm.define 'first' do |node|
    node.vm.box = 'centos/7'

    node.vm.network :private_network, :auto_network => true
  end

  config.vm.define 'second' do |node|
    node.vm.box = 'centos/7'

    node.vm.network :private_network, :auto_network => true
  end
end
```
