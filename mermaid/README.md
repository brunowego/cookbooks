# Mermaid

<!--
4 spaces
-->

## Links

- [Main Website](https://mermaid.js.org/)
- [Live Editor](https://mermaid.live)

## Posts

- [GitHub / Include diagrams in your Markdown files with Mermaid](https://github.blog/2022-02-14-include-diagrams-markdown-files-mermaid/)

## Syntax

### Using

```mermaid
graph TD;
  A-->B;
  A-->C;
  B-->D;
  C-->D;
```

```mermaid
stateDiagram
  [*] --> Still
  Still --> [*]
  Still --> Moving
  Moving --> Still
  Moving --> Crash
  Crash --> [*]
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension bierner.markdown-mermaid

#
jq '."recommendations" += ["bierner.markdown-mermaid"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

<!--
code --install-extension bpruitt-goddard.mermaid-markdown-syntax-highlighting

jq '."recommendations" += ["bpruitt-goddard.mermaid-markdown-syntax-highlighting"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
-->

## CLI

### Links

- [Code Repository](https://github.com/mermaid-js/mermaid-cli)

### Installation

```sh
# Using npm
npm install @mermaid-js/mermaid-cli -g

# Using Yarn
yarn global add @mermaid-js/mermaid-cli
```

<!--
brew install mermaid-cli
-->

### Commands

```sh
mmdc -h
```

### Usage

```sh
#
mmdc \
  -t neutral \
  -i ./<filename>.mmd \
  -o ./<filename>.svg \
  -b white
```

### Tips

#### Using with Docs

**Refer:** `./package.json`

```json
{
  "scripts": {
    "docs:architecture": "mmdc -t neutral -i ./docs/architecture.mmd -o ./docs/assets/images/architecture.svg -b white"
  }
}
```

### Issues

#### TBD

```log
Error: Failed to launch the browser process!
[0224/192533.442744:FATAL:zygote_host_impl_linux.cc(117)] No usable sandbox! Update your kernel or see https://chromium.googlesource.com/chromium/src/+/main/docs/linux/suid_sandbox_development.md for more information on developing with the SUID sandbox. If you want to live dangerously and need an immediate workaround, you can try using --no-sandbox.
```

#### Missing CLI

```log
Error : [Errno 2] No such file or directory: 'mmdc'
```

Just install Mermaid CLI globally.
