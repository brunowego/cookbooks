# Multiple target ZAP Scanning (mzap)

**Keywords:** DAST

## Links

- [Code Repository](https://github.com/hahwul/mzap)

## CLI

### Installation

#### Homebrew

```sh
brew tap hahwul/mzap
brew install mzap
```

#### go get

```sh
GOBIN=/usr/local/bin go install github.com/hahwul/mzap@latest
```

### Configuration

```sh
"$HOME"/.mzap.yaml
```

### Commands

```sh
mzap -h
```

### Usage

```sh
#
cat << EOF > ./target.txt
http://testphp.vulnweb.com/
https://www.hahwul.com
https://owasp.org
https://www.zaproxy.org
https://portswigger.net
https://www.hackerone.com
https://www.bugcrowd.com
https://dalfox.hahwul.com
https://authz0.hahwul.com
EOF

#
mzap ajaxspider --urls ./target.txt
mzap stop ajaxspider

#
mzap ascan --urls ./target.txt
mzap stop ascan

#
mzap spider --urls ./target.txt
mzap stop spider

#
mzap stop all
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# mzap
source <(mzap completion zsh) # bash
```

```sh
source ~/.zshrc
```
