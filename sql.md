# Structured Query Language (SQL)

<!--
https://linkedin.com/learning/learning-sql-programming-8382385/learning-sql-programming
-->

<!--
Could you propose me an database modeling of Enterprise Resource Planning System in SQL?
-->

## Glossary

- Relational Database Access (RDA)

## Languages

- SQL: Standard SQL
- N1QL: Couchbase N1QL
- DB2: IBM DB2
- PL/SQL: Oracle PL/SQL

## Tools

- [SQLizer](https://sqlizer.io)

## Syntax

### Tips

#### Visual Studio Code

```sh
#
code --install-extension adpyke.vscode-sql-formatter

#
jq '."recommendations" += ["adpyke.vscode-sql-formatter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

#### EditorConfig

```sh
cat << EOF > ./.editorconfig
[*.sql]
indent_size = 4
indent_style = tab
max_line_length = 100

EOF
```
