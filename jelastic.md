# Jelastic

## Links

- [Org. Repository](https://github.com/jelastic/)
- [Main Website](https://jelastic.com/)

## CLI

### Installation

#### Bash

```sh
curl -s 'ftp://ftp.jelastic.com/pub/cli/jelastic-cli-installer.sh' | /bin/bash
```

<!--
https://www.virtuozzo.com/application-platform-docs/cli/

~/jelastic/users/authentication/signin \
  --login {email} \
  --password {password} \
  --platformUrl {platformUrl}
-->

<!--
#!/bin/bash

curl -o $HOME/jelastic-cli.jar ftp://ftp.jelastic.com/pub/cli/jelastic-cli.jar

java -jar -Duser.home=$HOME  $HOME/jelastic-cli.jar setup

#grep 'PATH' $HOME/.bash_profile 2>&1 | grep -q 'jelastic' ; ret=$?

#if [[ $ret -gt 0 ]]  ; then
#    echo "export PATH=$HOME/jelastic/:\$PATH" >> $HOME/.bash_profile
#fi

-->
