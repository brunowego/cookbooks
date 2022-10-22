# Wireshark

<!--
https://app.pluralsight.com/library/courses/getting-started-analyzing-network-traffic-wireshark/table-of-contents
-->

**Keywords:** Packet Analyzer (Sniffer)

## Links

- [Code Repository](https://github.com/wireshark/wireshark)

## App

### Installation

#### Homebrew

```sh
brew install --cask wireshark-chmodbpf
```

<!-- #### DMG

1. Open https://www.wireshark.org/download/osx/
2. Click Wireshark Latest Intel 64.dmg
3. Move Wireshark to Applications
4. Install ChmodBPF.pkg -->

### Tips

#### Filter Source IP

```txt
ip.src == 192.168.0.100
```
