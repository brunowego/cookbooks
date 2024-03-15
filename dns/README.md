# Domain Name System (DNS) (a.k.a Domain Name Service or Domain Name Server)

<!--
https://www.dnsperf.com/
https://public-dns.info/
-->

## Links

- [DNS in One Picture](https://roadmap.sh/guides/dns-in-one-picture)

## Tools

- [Google Public DNS](https://dns.google)
- [localhost](/localhost.md#tools)
- [Zoho Toolkit](https://zoho.com/toolkit)

### Propagation Check

- [DNS Check and DNS Report Tools - Comprehensive DNS Tests - MxToolBox](https://mxtoolbox.com/dnscheck.aspx)
- [DNS Checker - DNS Check Propagation Tool](https://dnschecker.org/)
- [DNS Checker — DNS Check Tool](https://nslookup.io/dns-checker/) 🌟
- [DNS Propagation Checker - Global DNS Testing Tool](https://whatsmydns.net/)

## Best Free & Public DNS Servers

| Provider      | Primary DNS    | Secondary DNS   |
| ------------- | -------------- | --------------- |
| Google        | 8.8.8.8        | 8.8.4.4         |
| Quad9         | 9.9.9.9        | 149.112.112.112 |
| OpenDNS Home  | 208.67.222.222 | 208.67.220.220  |
| Cloudflare    | 1.1.1.1        | 1.0.0.1         |
| CleanBrowsing | 185.228.168.9  | 185.228.169.9   |
| Alternate DNS | 76.76.19.19    | 76.223.122.150  |
| AdGuard DNS   | 94.140.14.14   | 94.140.15.15    |

## Resource Record

| Name  | Description    |
| ----- | -------------- |
| CNAME | Canonical Name |
| MX    | Mail Exchange  |

<!--
A
AAAA
NS
PTR
SOA
TXT
SPF
SRV
-->

## Tips

### Flush DNS Cache

```sh
# Darwin (macOS)
sudo killall -HUP mDNSResponder
sudo killall mDNSResponderHelper
sudo dscacheutil -flushcache
```

### Get Current DNS

```sh
#
grep nameserver <(scutil --dns)

#
cat /etc/resolv.conf
```

### Set DNS

```sh
#
sudo networksetup -setdnsservers Wi-Fi 9.9.9.9
```
