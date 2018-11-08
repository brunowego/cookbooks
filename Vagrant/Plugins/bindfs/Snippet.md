# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  unless Vagrant.has_plugin?('vagrant-bindfs')
    puts 'vagrant-bindfs is not installed!'
    puts 'To install the plugin, run:'
    puts 'vagrant plugin install vagrant-bindfs'
    exit
  end

  config.bindfs.bind_folder '/vagrant', '/vagrant'
end
```
