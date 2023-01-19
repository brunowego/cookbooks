# Web Application Vulnerability Scanner (WMAP)

## Usage

```sh
#
msfconsole

#
workspace -a wmap
workspace wmap

#
load wmap

#
help

#
wmap_sites -l

#
wmap_sites -a https://domain.tld

#
wmap_targets -d <id>

#
wmap_run -t

#
wmap_run -e

#
wmap_vulns -l

#
vulns
```

<!--
#
wmap_modules -r
-->

## Issues

### Brute Dirs

```log
Using code '404' as not found.
```

```sh
# Homebrew
sudo mv /opt/metasploit-framework/embedded/framework/modules/auxiliary/scanner/http/brute_dirs.rb /opt/metasploit-framework/embedded/framework/modules/auxiliary/scanner/http/brute_dirs.rb.bak
```
