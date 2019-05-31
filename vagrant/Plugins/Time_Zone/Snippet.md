# Snippet

```ruby
Vagrant.configure('2') do |config|
  # [...]

  if Vagrant.has_plugin?('vagrant-timezone')
    config.timezone.value = 'America/Sao_Paulo'
  end
end
```
