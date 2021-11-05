# Hash

## Tools

- [Online Hash Crack - Hash Identification](https://www.onlinehashcrack.com/hash-identification.php)

## Types

- Universally Unique Identifier/Globally Unique Identifier (UUID/GUID)
  - Example: 123e4567-e89b-12d3-a456-426614174000
- Universally unique Lexicographically sortable IDentifier (ULID)
  - Example: 01ARZ3NDEKTSV4RRFFQ69G5FAV

## Generate

```sh
#
date +%s | sha256sum | base64 | head -c 32; echo

#
openssl rand -base64 32
```
