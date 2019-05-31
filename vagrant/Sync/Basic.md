# Basic

```rb
if OS.unix?
  config.vm.synced_folder(
    './', '/vagrant', mount_options: ['dmode=775,fmode=664']
  )
else
  config.vm.synced_folder './', '/vagrant'
end
```
