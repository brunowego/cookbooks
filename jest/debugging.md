# Jest Debugging

<!--
chrome://inspect
-->

## Links

- [Troubleshooting](https://jestjs.io/docs/troubleshooting)

## Configuration

### Using VS Code

**Refer:** `./.vscode/launch.json`

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug Jest Tests",
      "type": "node",
      "request": "launch",
      "runtimeArgs": [
        "--inspect-brk",
        "${workspaceRoot}/node_modules/jest/bin/jest.js",
        "--runInBand"
      ],
      "console": "integratedTerminal",
      "internalConsoleOptions": "neverOpen"
    }
  ]
}
```

## Issues

### Problem with Basedir

```log
basedir=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
          ^^^^^^^
SyntaxError: missing ) after argument list
  ...
```

<!--
https://dev.to/elpddev/debug-jest-spec-in-vscode-error-missing-after-argument-list-1p3b
-->

Instead of use `./node_modules/.bin/jest` use `./node_modules/jest/bin/jest.js`.
