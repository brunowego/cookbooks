# Postman by Zach Latta

## References

- [Code Repository](https://github.com/zachlatta/postman)

## CLI

### Installation

#### go get

```sh
go get github.com/zachlatta/postman
```

### Commands

```sh
postman
```

### Usage

```sh
#
postman \
  -html ./template.html \
  -text ./template.txt \
  -csv ./recipients.csv \
  -sender 'Jane Doe <janedoe@example.com>' \
  -subject 'Hello, World!' \
  -server [smtp.example.com] \
  -port 587 \
  -skipCertValidation \
  -user [username] \
  -password [password]

#
postman \
  -html <(cat << EOF
<h1>Hello, {{.Name}}! You are a {{.Type}}</h1>
EOF
) \
  -text <(cat << EOF
Hello, {{.Name}}! You are a {{.Type}}.
EOF
) \
  -csv <(cat << EOF
Email,Name,Type
johndoe@example.com,John Doe,Human
EOF
) \
  -sender 'Jane Doe <janedoe@example.com>' \
  -subject 'Hello, World!' \
  -server [smtp.example.com] \
  -port 587 \
  -skipCertValidation \
  -user [username] \
  -password [password]
```
