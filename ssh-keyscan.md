#

```sh
ssh-keyscan [hostname]
```

```sh
ssh-keyscan -t rsa [hostname] >> ~/.ssh/known_hosts 2> /dev/null
```

```sh
ssh-keyscan [hostname] >> ~/.ssh/known_hosts 2> /dev/null
```

```sh
ssh -T -p 443 git@[hostname]
```
