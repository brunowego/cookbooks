# Hypertext Markup Language (HTML)

<!--
https://github.com/linthtml/linthtml

https://linkedin.com/learning/html-and-css-linking/hyperlinks-the-glue-connecting-the-world-wide-web
https://linkedin.com/learning/crafting-meaningful-html/craft-meaningful-html
-->

## References

- [Country Codes](https://countrycode.org/)
- [Preload, prefetch and other <link> tags](https://3perf.com/blog/link-rels/)

## Tools

- [Emmet](/emmet.md)
- [HTML Arrows](https://toptal.com/designers/htmlarrows/)
- [HTML Codes Table](https://ascii.cl/htmlcodes.htm)
- [HTML Entities Encoder / Decoder](https://web2generators.com/html-based-tools/online-html-entities-encoder-and-decoder)
- [HTML Formatter](https://webformatter.com/html)
- [Modern HTML Starter Template](https://htmltemplate.site/)

### HTML Entities Encoder/Decoder

- [web2generators.com](https://web2generators.com/html-based-tools/online-html-entities-encoder-and-decoder)
- [mothereff.in](https://mothereff.in/html-entities)

## Syntax

### Tips

#### Visual Studio Code

```sh
#
code --install-extension formulahendry.auto-close-tag

#
jq '."html.format.wrapAttributes" |= "force-aligned"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

<!--
"html.format.wrapLineLength": 0
"jsxBracketSameLine": true
-->

#### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.html]
indent_size = 4
EOF
```

<!--
&zwnj;
-->

<!--
<picture>
  <source srcset="images/logomark-dark.svg" media="(prefers-color-scheme: dark)">
  <source srcset="images/logomark-light.svg" media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)">
  <img src="images/logomark-light.svg" height="70" alt="Company Logomark">
</picture>
-->
