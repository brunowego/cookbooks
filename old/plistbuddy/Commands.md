# Commands

## REPL

```sh
/usr/libexec/PlistBuddy [/path/to/plist]
```

## Print

```sh
/usr/libexec/PlistBuddy -c 'Print' -x [/path/to/plist]
```

### Entry

```sh
/usr/libexec/PlistBuddy -c 'Print :[entry]' [/path/to/plist]
```

## Add

```sh
/usr/libexec/PlistBuddy -c 'Add :[entry] [type] [value]' [/path/to/plist]
```

## Set

```sh
/usr/libexec/PlistBuddy -c 'Set :[entry] [value]' [/path/to/plist]
```

## Delete

```sh
/usr/libexec/PlistBuddy -c 'Delete :[entry]' -x [/path/to/plist]
```
