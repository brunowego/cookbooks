# Internationalization (i18n)

<!--
https://github.com/WeblateOrg/weblate
https://github.com/formatjs/formatjs
https://github.com/lokalise/i18n-ally
-->

<!--
chrome://settings/?search=languages

about:preferences#general > Language
-->

## Tools

- [CSpell (a.k.a. spellcheck)](/cspell.md)
- [PO File Translation Tool for ChatGPT (gpt-po)](/gpt-po.md)

<!--
https://ai-json-translator.vercel.app

https://github.com/fkirc/attranslate
https://github.com/dguisadom/GPTranslator
https://github.com/sonderbase/gpt-translator
https://github.com/lobehub/lobe-cli-toolbox/tree/master/packages/lobe-i18n
https://github.com/ObservedObserver/chatgpt-i18n
-->

## Management

### Managed

- [Crowdin](https://crowdin.com)
- [inlang](/inlang.md)
- [Localazy](https://localazy.com)
- [Lokalise](https://lokalise.com)
- [POEditor](https://poeditor.com)
- [Transifex](https://transifex.com)

<!--
https://simplelocalize.io
https://translation.io
https://github.com/translation
-->

### Open Source

- [Weblate](/weblate/README.md) 🌟

<!--
https://github.com/recontentapp/recontentapp
https://github.com/tolgee/tolgee-platform
-->

## Formats

- GNU gettext (PO) 🌟
- Program Language (eq. JavaScript/TypeScript)
- Data Container (eq. JSON, YAML, etc)

## Tips

### Visual Studio Code

```sh
#
code --install-extension thibault-vanderseypen.i18n-json-editor

#
jq '."recommendations" += ["thibault-vanderseypen.i18n-json-editor"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
