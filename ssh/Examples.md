# Examples

## Connect

```sh
ssh [username]@[host]
```

### Another Port

```sh
ssh -p 2222 [username]@[host]
```

### Verbose

```sh
ssh -vvv [username]@[host]
```

## Check enabled

```sh
ssh-agent -s
```

## Generate key

```sh
ssh-keygen -t rsa -b 4096 -C '[email]'
```

## Add

```sh
ssh-add ~/.ssh/id_rsa
```

## Read

```sh
cat ~/.ssh/id_rsa.pub
```

## Known hosts

```sh
cat ~/.ssh/known_hosts
```

### Remove

```sh
ssh-keygen -R '[hostname]'
```
