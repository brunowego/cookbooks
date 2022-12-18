# Frida

## Links

- [Code Repository](https://github.com/frida/frida)
- [Main Website](https://frida.re/)
- Docs
  - [Android](https://frida.re/docs/android/)
  - [iOS](https://frida.re/docs/ios/)
- [CodeShare](https://codeshare.frida.re/)

## CLI

### Installation

#### pip

```sh
pip3 install -U frida frida-tools
```

### Commands

```sh
frida -h
```

### Usage

```sh
#
frida-ls-devices

#
frida-ps -Uai
```

<!--
frida --codeshare sowdust/universal-android-ssl-pinning-bypass-2 -f com.example.app -U

frida \
  –U \
  –f com.example.app \
  –l ./my-scrypt.js \
  --no-pause

frida-dexdump -p <pid> -U

frida-ps -D <device-id> -a

frida-trace -U -i open rock_paper_scissors
-->
