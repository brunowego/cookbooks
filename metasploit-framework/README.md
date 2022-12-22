# Metasploit Framework (MSF)

<!--
Fiddler
-->

<!--
https://app.pluralsight.com/paths/skill/penetration-testing-fundamentals-with-the-metasploit-framework

https://app.pluralsight.com/library/courses/perform-attacks-metasploit/table-of-contents
https://app.pluralsight.com/library/courses/metasploit-getting-started/table-of-contents
https://app.pluralsight.com/library/courses/post-exploitation-meterpreter/table-of-contents

https://app.pluralsight.com/paths/skills/penetration-testing-fundamentals-with-the-metasploit-framework

https://app.pluralsight.com/library/courses/metasploit-penetration-testing-introduction/table-of-contents
https://app.pluralsight.com/library/courses/penetration-testing-metasploit-framework/table-of-contents
https://app.pluralsight.com/library/courses/exploit-development-execution-metasploit-framework/table-of-contents

https://www.linkedin.com/learning/penetration-testing-essential-training/welcome
https://www.linkedin.com/learning/penetration-testing-advanced-kali-linux/welcome-2
-->

**Keywords:** Penetration Testing

## Links

- [Code Repository](https://github.com/rapid7/metasploit-framework)
- [Main Website](https://metasploit.com)

## CLI

### Installation

#### Homebrew

```sh
brew instal --cask metasploit
```

### Initialize

```sh
#
msfdb status

#
msfdb init --use-defaults --component database

#
msfdb init --use-defaults --component webservice

#
cat ~/.msf4/config
```

<!--
https://localhost:5443/api/v1/auth/account
-->

### Commands

```sh
#
msfdb -h

#
msfconsole -h
```

<!--
msfd
msfelfscan
msfmachscan
msfrop
msfrpc
msfrpcd
msfvenom
msfpescan
msfbinscan
-->

### MSF Console

```sh
#
help

#
creds help

#
db_status

#
search type:exploit platform:windows <text>

#
use auxiliary/scanner/portscan/tcp
show options
set RHOSTS <host>

#
run # or, exploit

#
back

#
exit
```

### Tips

#### Remove Local Database

```sh
rm -fR ~/.msf4
```

<!-- ### Issues

#### TBD

```
Fix issue with postgres connection Metasploit - Authentication failed for user "msf"
```

```sh
msfdb reinit
``` -->
