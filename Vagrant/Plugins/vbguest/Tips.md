# Tips

## Disable auto update

```rb
Vagrant.configure('2') do |config|
  config.vbguest.auto_update = false
end
```
