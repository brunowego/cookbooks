# Firebase

<!--
https://www.youtube.com/watch?v=vUe91uOx7R0
https://linkedin.com/learning/firebase-essential-training/firebase-stop-reinventing-the-wheel
https://github.com/SmartMoveSystems/firebase-keycloak-importer
https://github.com/SmartMoveSystems/keycloak-firebase-scrypt
-->

## Links

- [Main Website](https://firebase.google.com/)
- [CLI reference / auth:import e auth:export](https://firebase.google.com/docs/cli/auth)

## CLI

### Installation

#### Homebrew

```sh
brew install firebase-cli
```

### Commands

```sh
firebase -h
```

### Usage

```sh
#
firebase login

#
firebase auth:export \
  --project [name] \
  --format json \
  ./users.json
```
