# act

**Keywords:** GitHub Actions Locally

## Links

- [Code Repository](https://github.com/nektos/act)
- [Main Website](https://nektosact.com)
- [GitHub / Settings / Personal Access Tokens](https://github.com/settings/tokens)
- [Docker Images](https://github.com/catthehacker/docker_images)

## Guides

- [Webhook events and payloads / push](https://docs.github.com/en/developers/webhooks-and-events/webhooks/webhook-events-and-payloads#push)

## Glossary

- Quick Emulator (QEMU)

## CLI

### Installation

#### Homebrew

```sh
brew install act
```

#### Linux Binary

```sh
curl \
  -L \
  'https://github.com/nektos/act/releases/download/v0.2.23/act_Linux_x86_64.tar.gz' | \
    tar -xzC /usr/local/bin act
```

#### Chocolatey

```sh
choco install act-cli
```

### Commands

```sh
act -h
```

### Configuration

```sh
#
cat << EOP > ~/.actrc
-P ubuntu-latest=ghcr.io/catthehacker/ubuntu:act-latest
-P ubuntu-22.04=ghcr.io/catthehacker/ubuntu:act-22.04
-P ubuntu-20.04=ghcr.io/catthehacker/ubuntu:act-20.04
-P ubuntu-18.04=ghcr.io/catthehacker/ubuntu:act-18.04
ubuntu-16.04=ghcr.io/catthehacker/ubuntu:act-16.04
EOP

# Git ignore
echo '/.secrets' >> ./.gitignore # locally
echo '/.secrets' >> ~/.gitignore_global # globally
```

### Usage

```sh
# List actions
act -l

act \
  -l \
  -W ./.github/workflows/<name>.yml

# Draw workflows
act -g

# Run on push
act push \
  --rm \
  -v \
  -W ./.github/workflows/<name>.yml

# Run on pull request
act pull_request \
  --rm \
  -v \
  -W ./.github/workflows/<name>.yml

# Run on release
act release \
  --rm \
  -v \
  -W ./.github/workflows/<name>.yml

# Run on workflow dispatch
act workflow_dispatch \
  --rm \
  -v \
  -W ./.github/workflows/<name>.yml

# Run specific job
act \
  -j <name> \
  -W ./.github/workflows/<name>.yml \
  --rm \
  -v

# Cache Folder
ls ~/.cache/act
```

### Tips

### Inputs

```sh
#
act workflow_dispatch \
  -j <name> \
  -e <(cat << EOF
{
  "inputs": {
    "name": "Mr. Bill"
  }
}
EOF
)
```

### Visual Studio Code

**Dependencies:** [dotENV](/dotenv.md#visual-studio-code) VSCode plugin.

```sh
jq '."files.associations".".secrets" |= "dotenv"' "$HOME"/.vscode/settings.json | \
  sponge "$HOME"/.vscode/settings.json
```

### Issues

#### Missing Custom Docker Image

```log
::error::Unable to locate executable file: docker. Please verify either the file path exists or the file can be found within a directory specified by the PATH environment variable. Also check the file mode to verify the file is executable.
```

```sh
act \
  -P ubuntu-latest=catthehacker/ubuntu:act-latest \
  # ...
```

#### Missing Yarn

```log
line 1: yarn: command not found
```

```sh
docker run -it --rm docker.io/catthehacker/ubuntu:js-18.04-dev yarn --version
```

#### Action Version Issue

```log
Error: Parameter token or opts.auth is required
```

Try change action version to a previews version.

#### Missing Artifact Cache

```log
[CI/build]   💬  ::debug::Resource Url: localhost/_apis/artifactcache/cache?keys=Linux-buildx-496cec68494d0c3ac73537085ac719b51f5e7bc497bb1c22d5ed34c07417fffb%252CLinux-buildx-&version=241a22ad23e37799b851ed553e697ea8915dfceac047c09bcb4c846ed1d09e11
[CI/build]   💬  ::debug::getCacheEntry - Attempt 1 of 2 failed with error: Invalid URL: localhost/_apis/artifactcache/cache?keys=Linux-buildx-496cec68494d0c3ac73537085ac719b51f5e7bc497bb1c22d5ed34c07417fffb%252CLinux-buildx-&version=241a22ad23e37799b851ed553e697ea8915dfceac047c09bcb4c846ed1d09e11
[CI/build]   💬  ::debug::Resource Url: localhost/_apis/artifactcache/cache?keys=Linux-buildx-496cec68494d0c3ac73537085ac719b51f5e7bc497bb1c22d5ed34c07417fffb%252CLinux-buildx-&version=241a22ad23e37799b851ed553e697ea8915dfceac047c09bcb4c846ed1d09e11
[CI/build]   💬  ::debug::getCacheEntry - Attempt 2 of 2 failed with error: Invalid URL: localhost/_apis/artifactcache/cache?keys=Linux-buildx-496cec68494d0c3ac73537085ac719b51f5e7bc497bb1c22d5ed34c07417fffb%252CLinux-buildx-&version=241a22ad23e37799b851ed553e697ea8915dfceac047c09bcb4c846ed1d09e11
| [warning]getCacheEntry failed: Invalid URL: localhost/_apis/artifactcache/cache?keys=Linux-buildx-496cec68494d0c3ac73537085ac719b51f5e7bc497bb1c22d5ed34c07417fffb%2CLinux-buildx-&version=241a22ad23e37799b851ed553e697ea8915dfceac047c09bcb4c846ed1d09e11
[CI/build]   ⚙  ::set-output:: cache-hit=false
```

Run and configure [Artifact Server](/artifact-server.md)

```sh
act \
  # ...
  --env GITHUB_RUN_ID="$(date '+%s')"
```

#### Missing GitHub Token

```log
Error: Error undefined: Parameter token or opts.auth is required
```

```sh
export GITHUB_TOKEN=''
```

#### Update Token

```log
DEBU[0003] authentication required
```

Update your `GITHUB_TOKEN` in `.secrets` file.

#### Missing Language Environment

```log
Warning: the environment variable LANG is not set!
```

```yml
---
jobs:
  test:
    steps:
      - name: # ...
        env:
          LC_ALL: C.UTF-8
          LANG: C.UTF-8
        run: # ...
```

#### Missing Events

```log
ERRO[0000] Unable to interpolate string '${{!contains(github['event']['pull_request']['title'], '[SKIP CI]')}}' - [TypeError: Cannot access member 'title' of undefined]
```

```sh
# Using local-act.event.json
act \
  -W ./.github/workflows/ci.yml \
  -e <(cat << EOF
{
  "pull_request": {
    "title": "[SKIP CI] My Awesome Contribution"
  }
}
EOF
) \
  -v
```

<!-- ####

```log
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
```

TODO -->

#### Unused Needs Parameter

```log
FATA[0000] Unable to build dependency graph!
```

Just remove `needs` parameter.

<!-- ####

```log
Error: unable to find api field in struct HorizontalPodAutoscalerSpec for the json field "behavior"
```

TODO -->
