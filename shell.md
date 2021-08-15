# Shell

<!--
exit 0
exit 1

https://app.pluralsight.com/paths/skill/shell-scripting-with-bash-and-z-shell
https://app.pluralsight.com/paths/skill/using-bash-and-z-shell

https://app.pluralsight.com/search/?q=shell&type=path&m_sort=relevance&query_id=e86aebdb-f614-4dd8-9a28-066de6b9b012&source=user_typed

https://linkedin.com/learning/search?entityType=COURSE&keywords=shell

https://linkedin.com/learning/paths/become-a-linux-system-administrator

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

# Last 100 lines
history 100

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

<!--
# if any of the commands in your code fails for any reason, the entire script fails
set -o errexit
# fail exit if one of your pipe command fails
set -o pipefail
# exits if any of your variables is not set
set -o nounset
-->
