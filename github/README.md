# GitHub

<!--
https://education.github.com/benefits?type=student

https://github.com/revoltchat/.github
https://github.com/chdsbd/kodiak

https://media-exp1.licdn.com/dms/image/sync/C4E27AQFXhz19BLKTlg/articleshare-shrink_800/0/1620311917375?e=1620406800&v=beta&t=kcsEPLfDy2Up6iCcr7gyH9OIJhH0Pgj09CtvABBcVGc

https://github.com/cla-assistant/cla-assistant

https://github.community/t/picture-tag-in-markdown/149471
-->

**Keywords:** Git Service

## Links

- [Government](https://government.github.com/community/)
- [GitHub Flavored Markdown Spec](https://github.github.com/gfm/)
- [Bug Report](https://support.github.com/contact/bug-report)
- [Pricing Calculator](https://github.com/pricing/calculator)
- Docs
  - [Installation](https://cli.github.com/manual/installation)
- Settings
  - [Appearance](https://github.com/settings/appearance)

## References

- [myOctocat](https://myoctocat.com)
- [GitHub Status](https://githubstatus.com)
- [Twitter](https://twitter.com/githubstatus)

## API

- [Rate Limit](https://api.github.com/rate_limit)
- [GitHub GraphQL API](https://docs.github.com/en/graphql/overview/explorer)

## Tools

- [GitHub social previews](https://mugshotbot.com/github)
- [PullApprove](https://pullapprove.com)

## Settings

- [Settings / Theme preferences](https://github.com/settings/appearance)
- [Notifications](https://github.com/settings/notifications)
- [Register a new OAuth application](https://github.com/settings/applications/new)

## Guides

- [Customizing your organization's profile](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/customizing-your-organizations-profile)

## Misc

- [User Avatar](https://github.com/brunowego.png)
- [Issues / Assigned](https://github.com/issues/assigned)
- [How can we help with your forks?](https://support.github.com/request/fork)

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

### Links

- [Main Website](https://cli.github.com)
- [Docs](https://cli.github.com/manual/)

### Installation

#### Homebrew

```sh
brew install gh
```

#### APT

**Dependencies:** [GNU Privacy Guard (GnuPG / GPG)](/gnu/pg.md) and [Software Properties Common](/apt/software-properties-common.md)

```sh
sudo apt-key adv --keyserver 'keyserver.ubuntu.com' --recv-key 'C99B11DEB97541F0'
sudo apt-add-repository 'https://cli.github.com/packages'

sudo apt update
sudo apt install gh
```

#### Scoop

```sh
scoop bucket add github-gh 'https://github.com/cli/scoop-gh.git'
scoop install gh
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

### Tips

#### Clone with GitHub Token

```sh
git clone "https://${GITHUB_TOKEN}:x-oauth-basic@github.com/[my-org]/[my-repo].git"
```

#### Automatically Delete Branches

1. Repository -> Settings Tab
2. Options Menu
3. Merge button Section -> Automatically delete head branches

#### Add License

1. Add file -> Create new file
2. Type "Name your file...": License
   - Choose a license template
