# Frida

## Links

- [Code Repository](https://github.com/frida/frida)
- [Main Website](https://frida.re/)

## CLI

### Installation

#### pip

```sh
pip3 install frida frida-tools objection
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
