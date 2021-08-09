# Domain Name System (DNS) (a.k.a Domain Name Service or Domain Name Server)

<!--
https://www.dnsperf.com/
https://public-dns.info/
-->

## Links

- [DNS in One Picture](https://roadmap.sh/guides/dns-in-one-picture)

##

- [nip.io - Dead simple wildcard DNS for any IP Address](https://nip.io/)
<!-- xip.io -->

## Best Free & Public DNS Servers

| Provider | Primary DNS | Secondary DNS |
| --- | --- | --- |
| Google | 8.8.8.8 | 8.8.4.4 |
| Quad9 | 9.9.9.9 | 149.112.112.112 |
| OpenDNS Home | 208.67.222.222 | 208.67.220.220 |
| Cloudflare | 1.1.1.1 | 1.0.0.1 |
| CleanBrowsing | 185.228.168.9 | 185.228.169.9 |
| Alternate DNS | 76.76.19.19 | 76.223.122.150 |
| AdGuard DNS | 94.140.14.14 | 94.140.15.15 |

## Tips

### Get Current DNS

```sh
#
grep nameserver <(scutil --dns)

#
cat /etc/resolv.conf
```

### Set DNS

```sh
sudo networksetup -setdnsservers Wi-Fi 9.9.9.9
```
