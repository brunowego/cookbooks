# Issues

## No guest IP

```log
No guest IP was given to the Vagrant core NFS helper. This is an internal error that should be reported as a bug.
```

```sh
vagrant plugin install vagrant-vbguest
```

## NFS exports

### Homebrew

```log
tee: /etc/exports: Operation not permitted
```

1. System Preferences
2. Security & Privacy
3. Privacy
4. Full Disk Access
5. Add an application
6. iTerm
