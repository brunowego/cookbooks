# ssh-keyscan

## CLI

### Usage

```sh
#
ssh-keyscan <hostname>

#
ssh-keyscan -t rsa <hostname> >> ~/.ssh/known_hosts 2> /dev/null

#
ssh-keyscan <hostname> >> ~/.ssh/known_hosts 2> /dev/null

#
ssh -T -p 443 git@<hostname>

#
ssh-keyscan <hostname> | pbcopy -
```
