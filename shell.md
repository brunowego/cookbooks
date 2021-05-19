# Shell

<!--
https://app.pluralsight.com/paths/skill/shell-scripting-with-bash-and-z-shell
https://app.pluralsight.com/paths/skill/using-bash-and-z-shell

https://www.javatpoint.com/shell-script-parameters
-->

## Tools

- [ShellCheck](/shellcheck.md)

## References

- [Advanced Bash-Scripting Guide](http://tldp.org/LDP/abs/html/)
- [How to Check if a File or Directory Exists in Bash](https://linuxize.com/post/bash-check-if-file-exists/)

## Tips

### History Expansion

```sh
# Show history
history | less

# Run commando from line number
![line-number]

# Invoke last command run
![command]
```

### Print Currently Filename

```sh
echo "$0"
```

### EditorConfig

```sh
cat << EOF >> ./.editorconfig
[*.sh]
indent_size = 4
EOF
```

<!-- ### Check SSH

```sh
#
for ((i=100; i<200; i+=1)); do nmap -p 22 "sub$i.example.com"; done
``` -->

## Tips

### Server Status Using Shell Script

```sh
#! /bin/bash

SERVER_IP=$1

ping $SERVER_IP -c 2

if [ $? -eq 0]; then
    echo "$SERVER_IP is up"
else
    echo "$SERVER_IP not runnig"
fi
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

<!--
## Interview

https://www.youtube.com/watch?v=6ue2luv2I-Y
-->
