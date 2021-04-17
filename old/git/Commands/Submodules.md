# Submodules

## Add

```sh
git submodule add [repo] [destination]
```

## Remove folder/module from git repository

```sh
git rm -r --cached [destination]
```

## Update from submodule folder

```sh
cd [destination] && git pull
```

## Update all submodules

```sh
git submodule foreach git pull origin master
```

## Close with submodules

```sh
git clone --recursive [repo]
```

```sh
git submodule foreach git checkout master
```

## Get submodules from cloned repo

```sh
git submodule update --init --recursive
```

```sh
git submodule foreach git pull origin master
```

```sh
git submodule foreach git checkout master
```

##

```sh
git submodule sync --recursive
git submodule update --init --recursive
```
