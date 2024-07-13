# Translate Shell

**Keywords:** Google Translator

## Links

- [Code Repository](https://github.com/soimort/translate-shell)

## CLI

### Installation

```sh
# Using Homebrew
brew install translate-shell
```

### Commands

```sh
trans -h
```

### Usage

```sh
#
trans -list-languages
trans -list-codes
trans -list-all
trans -S

#
trans <text>

#
trans <text> -download-audio-as ./<text>.wav
trans :pt-BR <text> -download-audio-as ./<text>.wav

trans -e google :pt-BR swite -speak

#
trans -shell en:fr
```
