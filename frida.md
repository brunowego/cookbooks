# Frida

## Links

- [Code Repository](https://github.com/frida/frida)
- [Main Website](https://frida.re/)
- Docs
  - [Android](https://frida.re/docs/android/)
  - [iOS](https://frida.re/docs/ios/)

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
frida \
  –U \
  –f com.siteblindado.app \
  –l ./my-scrypt.js \
  --no-pause

frida-dexdump -p <pid> -U

frida-ps -D 458f4aa5 -a

frida-trace -U -i open rock_paper_scissors
-->
