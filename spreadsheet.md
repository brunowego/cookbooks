# Spreadsheet

<!--
https://github.com/nocodb/nocodb
-->

## Softwares

- [Google Sheets](/google/sheets.md)
- [Microsoft Excel](/microsoft/excel.md)

## Tools

- [TableConvert / Convert Markdown Table to Excel](https://tableconvert.com/markdown-to-excel)

## Tips

### Visual Studio Code

```sh
#
code --install-extension GrapeCity.gc-excelviewer

#
jq '."recommendations" += ["GrapeCity.gc-excelviewer"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
