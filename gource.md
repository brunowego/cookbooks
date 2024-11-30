# Gource

## Links

- [Main Website](https://gource.io)

## CLI

### Installation

```sh
# Using Homebrew
brew install gource
```

### Commands

```sh
gource -h
```

### Usage

```sh
#
gource \
  --seconds-per-day 1 \
  --auto-skip-seconds 1 \
  --file-idle-time 0 \
  --highlight-users

#
gource \
  --seconds-per-day 1 \
  --auto-skip-seconds 1 \
  --file-idle-time 0 \
  --highlight-users \
  -o - |
    ffmpeg -y -r 30 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset medium -crf 23 -threads 2 ./gource-video.mp4
```

### Tips

####

```sh
#
git log --pretty=format:'%at|%an|%s' --reverse > ./gource.log

# Darwin
gawk -F'|' '{ if (strftime("%u", $1) < 6) print $0 }' ./gource.log > ./filtered_gource.log
# Linux
awk -F'|' '{ if (strftime("%u", $1) < 6) print $0 }' ./gource.log > ./filtered_gource.log

#
gource ./filtered_gource.log
```
