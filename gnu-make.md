# GNU Make

## Links

- [Main Website](https://gnu.org/software/make/)
- [Manual](https://gnu.org/software/make/manual/html_node/index.html)

## References

- [Makefile and dotENV](https://lithic.tech/blog/2020-05/makefile-dot-env)
- [Dealing with assignment operator](https://github.com/amjadmajid/Makefile#dealing-with-assignment-operator)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install make
```

#### YUM

```sh
yum check-update
sudo yum -y install make
```

#### APK

```sh
sudo apk update
sudo apk add make
```

#### Chocolatey

```sh
choco install -y make
```

### Commands

```sh
make --help
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension ms-vscode.makefile-tools

#
jq '."recommendations" += ["ms-vscode.makefile-tools"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!-- Makefile entry point not found -->

#### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[{*.mk,Makefile}]
indent_size = 4
indent_style = tab
EOF
```

<!-- ####

```sh
#
cat << EOF > ./Makefile
SHELL := /bin/sh

-include ./.env
-include ./mk.d/compose.mk
EOF
``` -->

### Issues

<!-- #### Missing GNU Readline Library

```log
/bin/sh: /tmp/_MEIl8vInH/libreadline.so.7: no version information available (required by /bin/sh)
```

TODO -->
