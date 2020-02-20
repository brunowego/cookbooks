# Common

## Box

```rb
config.vm.box = '[name]'
```

## Hostname

```rb
config.vm.hostname = '[name]'
```

## Network

```rb
config.vm.network :private_network, ip: '192.168.33.10'
```

```rb
config.vm.network :private_network, type: 'dhcp'
```

## Forwarded port

```rb
config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
```
