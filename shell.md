# Shell

<!--
https://app.pluralsight.com/paths/skill/shell-scripting-with-bash-and-z-shell
https://app.pluralsight.com/paths/skill/using-bash-and-z-shell
https://www.javatpoint.com/shell-script-parameters
-->

## Tools

- [ShellCheck](./shellcheck.md)

## References

- [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/)
- [How to Check if a File or Directory Exists in Bash](https://linuxize.com/post/bash-check-if-file-exists/)

## Tips

### EditorConfig

```sh
cat << EOF >> ./.editorconfig
[*.sh]
indent_size = 4
EOF
```

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
