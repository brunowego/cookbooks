# Yarn Workspaces

## Commands

```sh
yarn workspace -h
```

## Usage

```sh
#
yarn workspaces list

#
yarn workspace <workspace> add <package> --dev
```

<!--
yarn workspace <package> <script>
-->

## Issues

### Missing Version

```log
➤ YN0000: ┌ Resolution step
➤ YN0035: │ @my-org/presets@npm:*: The remote server failed to provide the requested resource
➤ YN0035: │   Response Code: 404 (Not Found)
➤ YN0035: │   Request Method: GET
➤ YN0035: │   Request URL: https://registry.yarnpkg.com/@my-org%2fpresets
➤ YN0000: └ Completed in 0s 254ms
➤ YN0000: Failed with errors in 0s 258ms
```

Try add `version` atribute to package.
