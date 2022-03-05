# Maizzle

## Links

- [Code Repository](https://maizzle.com/)
- [Docs](https://maizzle.com/docs/)

## Library

### Scaffold

```sh
#
npx @maizzle/cli new maizzle/maizzle
```

### Dependencies

```sh
# Using NPM
npm install @maizzle/cli --save-dev

# Using Yarn
yarn add @maizzle/cli --dev
```

### Configuration

```sh
#
echo '/node_modules' > ./.gitignore

#
rm ./LICENSE
```

## CLI

### Links

- [CLI Commands](https://maizzle.com/docs/commands/)

### Commands

```sh
npx @maizzle/cli -h
```

### Usage

```sh
#
npx @maizzle/cli new maizzle/maizzle

# https://maizzle.com/starters/
npx @maizzle/cli new maizzle/starter-amp4email
npx @maizzle/cli new maizzle/starter-emailoctopus
npx @maizzle/cli new maizzle/starter-litmus
npx @maizzle/cli new maizzle/starter-mailbakery
npx @maizzle/cli new maizzle/starter-netlify-identity
npx @maizzle/cli new maizzle/starter-nunjucks
npx @maizzle/cli new maizzle/starter-postmark

#
npx @maizzle/cli serve

#
npx @maizzle/cli build [env]

#
npx @maizzle/cli make:config [env] --full

#
npx @maizzle/cli make:layout [name].html

#
npx @maizzle/cli make:template [name].html
```
