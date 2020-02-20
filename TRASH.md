# TRASH

```sh
sudo install -dm 775 -o "$USER" -g admin /usr/local/src
```

###

```sh
tail -n 100 [filename] | sponge [filename]
```

###

```sh
echo $(tail -n 3 [filename]) > [filename]
```

### First Field (Linux)

```sh
hostname -I | awk '{print $1}'
```

#### File

```sh
find . -type f -iname \*.[extension] -exec rename -v 's/[from]/[to]/' {} +
```

#### Directory

```sh
find . -type d -iname \* -exec rename -v 's/[from]/[to]/' {} +
```

## Create directory for every file and move

```sh
find *.md -prune -type f -exec sh -c 'mkdir -p "${0%.*}" && mv "$0" "${0%.*}"' {} \;
```

## Create file each sub-directory

```sh
find . -type d -exec touch {}/"${name}" \;
```

## Whitespace to underline

```sh
find . -depth -name '* *' -execdir rename 's/ /_/g' '{}' \;
# find . -depth -name '* *' -execdir rename 's/[[:space:]]/_/g' '{}' \;
```

## Run in each subdirectory

```sh
find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c 'cd "{}" && pwd' \;
```

## Replace multiple files

```sh
find . -iname '*.txt' -exec bash -c 'mv "$0" "${0%\.txt}.md"' {} \;
```

### ldapsearch

```sh
ldapsearch -x -b "uid=username,ou=people,dc=example,dc=com"
```

```sh
ldapsearch -h [host] -p [port] -b [base DN] -D [bind DN] -w [password]
```

```sh
ldapsearch -h 127.0.0.1 -p 389 -b "dc=example,dc=com" -D "cn=admin,dc=example,dc=com" -w 'Pa$$w0rd!'
```

```sh
ldapsearch -x -LLL -h [host] -D [user] -w [password] -b [base DN] -s sub "([filter])" [attribute list]
```

```sh
ldapsearch -x -LLL -h 127.0.0.1 -D "cn=admin,dc=example,dc=com" -w 'Pa$$w0rd!' -b "dc=example,dc=com" -s sub "(objectClass=person)" givenName
```

###

```sh
sudo cp "$(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$)" /Library/LaunchDaemons
```

```sh
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
```

```sh
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq
```
