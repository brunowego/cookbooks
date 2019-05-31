# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  config.vm.synced_folder(
    './', '/vagrant',
    type: 'rsync',
    rsync__auto: true,
    rsync__exclude: '.git/'
  )
end
```
