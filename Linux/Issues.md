# Issues

## Not allowed to execute

> Sorry, user \[username1] is not allowed to execute '\[/path/to/command]' as \[username2] on \[hostname].

```sh
sudo sh -c 'echo -e "[username1]\tALL=(ALL)\tNOPASSWD: ALL" >> /etc/sudoers.d/[username1]'
```
