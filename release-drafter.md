# Release Drafter

## Links

- [Code Repository](https://github.com/release-drafter/release-drafter)

## Configuration

```sh
cat << EOF > ./.github/release-drafter.yml
template: |
  ## Changes since last release

  $CHANGES
EOF
```
