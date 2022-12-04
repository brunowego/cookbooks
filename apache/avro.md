# Apache Avro

<!--
.avsc
-->

## Links

- [Code Repository](https://github.com/apache/avro)
- [Main Website](https://avro.apache.org/)

## Glossary

- Variable-Length Quantity (VLQ) / ZigZag encoding

## Solution

### Features

- Rich Data Structures
- Compact Binary Data
- Container File
- RPC Compatibilities
- Easy Integration
- Support Schemas

#### Rich Data Structures

**Primitive**

- null
- boolean
- int, long, float, double
- bytes
- string

**Complex**

- records
- arrays
- unions
- enums
- maps
- fixed

## Tips

### EditorConfig

```sh
cat << EOF >> ./.editorconfig

[*.avsc]
indent_size = 4
EOF
```
