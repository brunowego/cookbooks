# Examples

## Get IP

### eth0

```sh
hostname -I | awk '{print $1}'
```

##

```sh
echo http://127.0.0.1:3128 | awk -F '[:/]' '{print $4}'
```

```sh
echo http://127.0.0.1:3128 | awk -F '[:/]' '{print $5}'
```
