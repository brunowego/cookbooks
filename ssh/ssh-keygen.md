# ssh-keygen

## CLI

### Commands

```sh
ssh-keygen --help
```

### Usage

```sh
#
ssh-keygen \
  -q \
  -b 4096 \
  -C '<company-email>' \
  -N '' \
  -t rsa \
  -f ~/.ssh/id_rsa.<company-name>

#
cat ~/.ssh/id_rsa.<company-name>.pub
```

<!--
ssh-add -l
-->
