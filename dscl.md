# dscl

## CLI

### Usage

```sh
#
dscl . list /Users

#
dscl . list /Users | grep -v '^_'

#
dscacheutil -q user

#
dscacheutil -q user | grep -A 3 -B 2 -e uid:\ 5'[0-9][0-9]'
```
