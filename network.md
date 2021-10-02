# Network

## Tools

- Brazil
  - [IX.br / Trafego / Agregado / SP](https://ix.br/trafego/agregado/sp)
  - [RNP.br / Ferramentas / Panorama de tráfego](https://www.rnp.br/sistema-rnp/ferramentas/panorama-de-trafego)

## Glossary

- Network Address Translation (NAT)

## Guides

- [List of TCP and UDP port numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)

# Troubleshooting

<!--
https://kinsta.com/knowledgebase/dns-server-not-responding/
-->

```sh
#
ping -c 2 dns.google

#
nslookup dns.google
```

## Darwin

```sh
#
dig -t TXT test.dns.google.com. '@dns.google.'
dig -t TXT +tcp locations.dns.google.com. '@dns.google.'

#
traceroute -n -w 2 -m 30 dns.google
traceroute6 -n -w 2 -m 30 dns.google

#
dscacheutil -flushcache
```

## Windows

```sh
#
nslookup -debug -type=TXT test.dns.google.com. dns.google.
nslookup -debug -type=TXT -vc locations.dns.google.com. dns.google.

#
tracert -d -w 2000 dns.google
tracert -6 -d -w 2000 dns.google

#
dnscmd /clearcache
dnscmd /zonerefresh dns.google

#
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
```
