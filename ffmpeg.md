# FFmpeg

## CLI

### References

- [Capturing your Desktop / Screen Recording](https://trac.ffmpeg.org/wiki/Capture/Desktop)
- [Recommended Settings for VOD](https://developers.google.com/media/vp9/settings/vod/)

### Installation

#### Homebrew

```sh
brew install ffmpeg --with-libvpx --with-libvorbis --with-fdk-aacc
```

#### APT

```sh
sudo apt update
sudo apt -y install ffmpeg
```

#### YUM

```sh
yum check-update

# Repo: EPEL
sudo rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm

sudo yum -y install ffmpeg ffmpeg-devel
```

### Commands

```sh
ffmpeg -h
```

### Usage

```sh
# Video/Audio Info
ffprobe -i ./video.mp4

# Extract JPEG
ffmpeg -ss 60 -i ./video.mp4 -qscale:v 4 -frames:v 1 ./output.jpg

# Grab MPG from DVD
dvdbackup  -M -i /dev/sr0 -o ~/Videos/dvd-backup

## Convert VOB to MPG
ffmpeg -i VTS_01_1.VOB -c:v copy -c:a copy -f dvd VTS_01_1.MPG

# Convert MP4 to WebM
find ./ -name '*.mp4' -exec bash -c '$(cat << EOF
ffmpeg \
  -i $0 \
  -vf scale=720:-1 \
  -b:v 2M \
  -c:v libvpx \
  -c:a libvorbis \
  -threads 8 \
  -speed 4 \
  ${0%%.mp4}.webm
EOF
)' {} \;

# Extract Audio
ffmpeg -i ./video.mp4 -vn -c:a copy ./output.aac

# Cut
ffmpeg -ss 00:00:05 -i ./video.mp4 -c copy -t 00:02:00 ./cut.mov

# Add Thumbnail
ffmpeg -i ./video.mp4 -i ./image.png -map 1 -map 0 -c copy -disposition:0 attached_pic ./output.mp4

# Convert
ffmpeg -i ./output.mkv -codec copy ./output.mp4

# FPS
ffprobe -i ./output.mp4 -print_format json -loglevel fatal -show_streams -count_frames

#
## Darwin
ffmpeg -f avfoundation -list_devices true -i ''
ffmpeg -f avfoundation -i '<screen device index>:<audio device index>' ./output.mkv

## Linux
ffmpeg \
  -f video4linux2 \
  -s 640x480 \
  -i /dev/video0 \
  -ss 0:0:2 \
  -frames 1 \
  /tmp/out.jpg
```

### Issues

<!-- ####

```log
Unknown encoder 'libopus'
```

TODO -->
