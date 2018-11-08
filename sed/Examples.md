# Examples

## Replace

```sh
sed -i 's/[pattern]/[text]/g' [/path/to/file]
```

### With Regex

```sh
sed -ri '/[pattern]/s/[original]/[text]/g' [/path/to/file]
```

## Prepend

```sh
sed -i '/[pattern]/i [text]' [/path/to/file]
```

## Append

```sh
sed -i '/[pattern]/a [text]' [/path/to/file]
```

##

```sh
sed s/[pattern]/[text]/ [/path/to/file.template] > [/path/to/file]
```

##

```sh
sed -i '1s/^/[text]/' [/path/to/file]
```

## Remove

### Line

```sh
sed -i '1d' ~/.ssh/known_hosts
```
