# Firebase

<!--
https://www.youtube.com/watch?v=vUe91uOx7R0
https://linkedin.com/learning/firebase-essential-training/firebase-stop-reinventing-the-wheel

https://github.com/manifoldmarkets/manifold
https://github.com/SmartMoveSystems/firebase-keycloak-importer
https://github.com/SmartMoveSystems/keycloak-firebase-scrypt
-->

## Links

- [Main Website](https://firebase.google.com/)

## Docs

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

### Bootstrap

```sh
#
firebase login

#
firebase use [project-name]
```

### Usage

```sh
#
firebase auth:export \
  --project [name] \
  --format json \
  ./users.json

#
firebase deploy --only hosting

#
firebase serve --port 5005
```
