# Sudoers

## Allow Specific

```sh
sudo sh -c 'echo -e "[username]\tALL=(ALL)\tNOPASSWD: ALL" >> /etc/sudoers.d/[username]'
```
