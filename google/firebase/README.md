# Firebase

<!--
https://www.youtube.com/watch?v=vUe91uOx7R0
https://linkedin.com/learning/firebase-essential-training/firebase-stop-reinventing-the-wheel

https://github.com/manifoldmarkets/manifold
https://github.com/SmartMoveSystems/firebase-keycloak-importer
https://github.com/SmartMoveSystems/keycloak-firebase-scrypt
-->

## Links

- [Main Website](https://firebase.google.com)
- [Console](https://console.firebase.google.com)
- Docs
  - [CLI reference / auth:import e auth:export](https://firebase.google.com/docs/cli/auth)

## Terms

- Real-Time Database

## Services

- Database: Real-Time Database
- Firestore: NoSQL database
- Auth: Authentication
- Storage: File storage
- Functions: Serverless functions

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
firebase projects:list
firebase use <project-name>

#
firebase init
```

### Usage

```sh
#
firebase auth:export \
  --project <name> \
  --format json \
  ./users.json

#
firebase deploy --only hosting

#
firebase serve --port 5005
```
