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
- [HTML Formatter](https://webformatter.com/html)
- [HTML Entities Encoder / Decoder](https://www.web2generators.com/html-based-tools/online-html-entities-encoder-and-decoder)
- [HTML Arrows](https://www.toptal.com/designers/htmlarrows/)
- [HTML Codes Table](https://www.ascii.cl/htmlcodes.htm)
- [Modern HTML Starter Template](https://htmltemplate.site/)

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
