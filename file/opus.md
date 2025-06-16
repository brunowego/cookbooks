# Opus

## Tips

### To MP3

```sh
ffmpeg -i ./input.opus -codec:a libmp3lame -qscale:a 2 ./output.mp3
```
