# GitHub

<!--
https://github.com/revoltchat/.github

https://github.com/chdsbd/kodiak

https://linkedin.com/learning/github-quick-tips/github-tips-and-tricks

https://github.com/brunowego.png

https://api.github.com/users

https://api.github.com/users/brunowego

https://media-exp1.licdn.com/dms/image/sync/C4E27AQFXhz19BLKTlg/articleshare-shrink_800/0/1620311917375?e=1620406800&v=beta&t=kcsEPLfDy2Up6iCcr7gyH9OIJhH0Pgj09CtvABBcVGc
-->

## References

- [Government](https://government.github.com/community/)
- [myOctocat](https://myoctocat.com/)
- [GitHub Status](https://githubstatus.com/)

## API

- [Rate Limit](https://api.github.com/rate_limit)

## Tools

- [GitHub social previews](https://mugshotbot.com/github)
- [PullApprove](https://pullapprove.com/)

## Settings

- [Theme preferences](https://github.com/settings/appearance)

## Search

```txt
".node" in:file filename:.gitattributes
```

## App

### Installation

#### Homebrew

```sh
brew install --cask github
```

## CLI

### Installation

#### Homebrew

```sh
brew install gh
```

#### Chocolatey

```sh
choco install gh
```

### Commands

```sh
gh -h
```

### Usage

```sh
#
gh auth login -w

#
gh repo create \
  --public
```

## Tips

### Automatically Delete Branches

1. Repository -> Settings Tab
2. Options Menu
3. Merge button Section -> Automatically delete head branches

### Dependabot

```txt
#
@dependabot rebase

#
@dependabot ignore this dependency.
```

### Sonatype DepShield

```txt
wontfix
```

### Add License

1. Add file -> Create new file
2. Type "Name your file...": License
   - Choose a license template
