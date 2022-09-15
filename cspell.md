# CSpell

**Keywords:** Spell Checker

<!--
https://github.com/streetsidesoftware/cspell-dicts/tree/main/dictionaries/fullstack
-->

## Links

- [Main Website](https://cspell.org/)
- [Docs / Custom Dictionaries](https://cspell.org/docs/dictionaries-custom/)

## Related

- [cspell-dicts](https://github.com/streetsidesoftware/cspell-dicts)

## CLI

### Commands

```sh
# Using NPX
npx cspell -h

# Using Local
cspell -h
```

### Usage

```sh
#
cspell lint './**/*.{cjs,json,md,mjs,tsx,yml}'

#
cat ./README.md | cspell stdin
```

<!--
#
cspell trace

#
cspell check

#
cspell link

#
cspell sug
-->

## Library

### Installation

```sh
# Using NPM
npm install cspell --save-dev

# Using Yarn
yarn add cspell --dev
```

### Configuration

**Refer:** `./cspell.config.yml`

```yml
---
$schema: https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json
version: '0.2'
dictionaryDefinitions:
  - name: custom-words
    path: './.cspell/custom-words.txt'
    addWords: true
  - name: stack
    path: './.cspell/stack.txt'
    addWords: true
  - name: project-words
    path: './.cspell/project-words.txt'
    addWords: true
  - name: usernames
    path: './.cspell/usernames.txt'
    addWords: true
dictionaries:
  - custom-words
  - stack
  - project-words
  - usernames
```

```sh
#
mkdir ./.cspell

#
touch ./.cspell/custom-words.txt
touch ./.cspell/stack.txt
touch ./.cspell/project-words.txt
touch ./.cspell/usernames.txt
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension streetsidesoftware.code-spell-checker

#
code --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian

#
jq '."recommendations" += ["streetsidesoftware.code-spell-checker"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

```sh
# English
jq '."cSpell.language" |= "en"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# English + Portuguese
jq '."cSpell.language" |= "en,pt,pt_BR"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

```sh
# Disable
jq '."cSpell.diagnosticLevel" |= "Hint"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
