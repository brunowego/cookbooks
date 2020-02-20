# Shell

https://www.javatpoint.com/shell-script-parameters

## References

- [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/)
- [How to Check if a File or Directory Exists in Bash](https://linuxize.com/post/bash-check-if-file-exists/)

## Issues

### Bad file descriptor

```log
cat: /dev/fd/11: Bad file descriptor
```

```sh
cat <(cat ~/.bashrc)

# use without sudo
sudo cat <(cat ~/.bashrc)
```
