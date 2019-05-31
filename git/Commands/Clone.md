# Clone

## Simple

```sh
git clone [repo]
```

###

```sh
git clone [repo] [/path/to/folder] && cd "$_"
```

## Submodules

```sh
git clone --recursive [repo]
```

## Specific Branch

```sh
git clone --branch [branch] --single-branch --depth [depth] [repo]
```

| Param | Value |
| --- | --- |
| `--depth` | `1` |

## Root Permissions

```sh
sudo mkdir -p [/path/to/folder] && cd "$_"
sudo chown $(whoami): .
```

```sh
git clone [repo] .
```
