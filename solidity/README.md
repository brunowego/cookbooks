# Solidity

<!--
https://app.pluralsight.com/library/courses/blockchain-ethereum-developing-applications/table-of-contents

ERC 1155

https://github.com/alloy-rs/svm-rs
-->

**Keywords:** Smart Contracts

## Links

- [Code Repository](https://github.com/ethereum/solidity)
- [Main Website](https://soliditylang.org)

## Glossary

- Software Package Data Exchange (SPDX)

## CLI

### Installation

#### Homebrew

```sh
brew install solidity
```

### Commands

```sh
solc --help
```

## Tips

### Visual Studio Code

```sh
#
code --install-extension JuanBlanco.solidity

#
jq '."recommendations" += ["JuanBlanco.solidity"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
