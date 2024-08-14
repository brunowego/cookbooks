# Local Emulator Suite

## Links

- [Docs](https://firebase.google.com/docs/emulator-suite)
- Firebase Emulator UI
  - [Code Repository](https://github.com/firebase/firebase-tools-ui)

## CLI

### Initialize

```sh
firebase init emulators
```

### Configuration

```sh
echo '/.firebaserc' >> ./.gitignore
```

### Usage

```sh
#
export JAVA_TOOL_OPTIONS='-Xmx4g'

firebase emulators:start
firebase emulators:start --only firestore,auth,storage,functions
firebase emulators:start --project <project-id>
```
