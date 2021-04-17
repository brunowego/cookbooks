# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  config.vm.synced_folder './', '/vagrant', type: 'smb'
end
```
