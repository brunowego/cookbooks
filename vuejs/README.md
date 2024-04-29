# Vue.js

<!--
https://github.com/bytebase/bytebase
https://radix-vue.com
-->

## Links

- [Code Repository](https://github.com/vuejs/vue)
- [Main Website](https://vuejs.org/)
- [Awesome Vue.js](https://github.com/vuejs/awesome-vue)

## UI Libraries

- [BootstrapVue](https://github.com/bootstrap-vue/bootstrap-vue)
- [Vuetify](https://vuetifyjs.com/en/)

## CLI

### Links

- [Configuration Reference](https://cli.vuejs.org/config/)

### Installation

#### NPM

```sh
# Globally
npm install -g @vue/cli

# Locally
npm install -D @vue/cli
```

### Commands

```sh
npx vue -h
npx vue-cli-service -h
```

### Usage

```sh
# Create Application (Needs globally installation)
npx vue create <my-app>

#
npx vue info

#
npx vue serve

#
npx vue build

#
npx vue add <plugin>

#
npx vue ui

#
npx vue-cli-service serve

#
npx vue-cli-service build

#
npx vue-cli-service inspect

#
npx vue-cli-service lint
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension Vue.volar

code --install-extension Vue.vscode-typescript-vue-plugin

#
jq '."recommendations" += ["Vue.volar"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json

jq '."recommendations" += ["Vue.vscode-typescript-vue-plugin"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
