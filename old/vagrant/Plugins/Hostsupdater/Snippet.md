# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  unless Vagrant.has_plugin?('vagrant-hostsupdater')
    puts 'vagrant-hostsupdater is not installed!'
    puts 'To install the plugin, run:'
    puts 'vagrant plugin install vagrant-hostsupdater'
    exit
  end

  config.vm.hostname = '[hostname]'
end
```
