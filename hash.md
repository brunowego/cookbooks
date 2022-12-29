# Hash

## Tools

- [hash-identifier](/hash-identifier.md)

### Analyze

- [Online Hash Crack - Hash Identification](https://onlinehashcrack.com/hash-identification.php)
- [Hash Analyzer](https://tunnelsup.com/hash-analyzer/)
- [Identify Hash Types](https://hashes.com/en/tools/hash_identifier)

## Types

- Universally Unique Identifier/Globally Unique Identifier (UUID/GUID)
  - Example: 123e4567-e89b-12d3-a456-426614174000
- Universally unique Lexicographically sortable IDentifier (ULID)
  - Example: 01ARZ3NDEKTSV4RRFFQ69G5FAV

## Generate

**Dependencies:** [GNU Core Utilities](/gnu/coreutils.md)

```sh
#
date +%s | sha256sum | base64 | head -c 32; echo

#
md5 -s 'string'

#
openssl rand -base64 32
```
