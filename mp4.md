# MP4

## Tips

### Compress

```sh
ffmpeg -i input.mp4 -vcodec libx264 -crf 28 -preset slow -acodec aac -b:a 128k output.mp4
```
