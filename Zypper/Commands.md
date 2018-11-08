# Commands

## Install

```sh
sudo zypper install -y [package]
```

## Refresh

```sh
sudo zypper refresh
```

## Update

```sh
sudo zypper list-updates
```

```sh
sudo zypper update -y
```

## Search

```sh
sudo zypper search [package]
```

## Show Dependencies

```sh
sudo zypper info [package]
```

## Repository

```sh
sudo vim /etc/zypp/repos.d/[name].repo
```

## Remove

```sh
sudo zypper remove [package]
```

## Clean

```sh
sudo zypper clean --all
```

## Show Installed

```sh
sudo zypper search --installed-only
```
