# Encoding

## Tools

- [DenCode](https://dencode.com)
- [Webatic / Encoding Explorer](https://webatic.com/encoding-explorer)

## Glossary

- Byte Order Mark (BOM)
- Unicode Transformation Format (UTF)

## Characters

```txt
Ω - omega
λ - lambda
β - Beta
Σ - Sigma
φ - Phi
δ - Delta
π - Pi
` - Backtick
^ - Caret
~ - Tilde
```

## Tips

### Detect BOM

```sh
printf '\ufeff...\n' | file -
```

### Detect Encoding

```sh
#
file --mime-encoding ./*
file --mime-encoding ./*/*

#
file --mime ./*
```

<!-- ### Convert to UTF-8

TODO -->

### Find Non-UTF-8

```sh
#
find . -type f -exec file --mime {} \;  | grep -v 'utf-8\|binary\|ascii'
```
