# OS X

## Installation

### Homebrew

```sh
brew install xmlstarlet
```

### YUM

```sh
sudo yum check-update
sudo yum -y install epel-release
sudo yum -y install xmlstarlet
```

## Commands

### Edit

#### Element

```sh
xmlstarlet ed -i '[xpath]' -t elem -n [elem-name] -v [elem-value] [filename]
```

#### Attribute

```sh
xmlstarlet ed -i '[xpath]' -t attr -n [attr-name] -v [attr-value] [filename]
```

### List

```sh
xmlstarlet ls [filename]
```
