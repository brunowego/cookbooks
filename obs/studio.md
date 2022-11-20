# OBS Studio

<!--
https://linkedin.com/learning/learning-video-live-streaming/welcome
https://linkedin.com/learning/delivering-video-to-facebook-live/welcome-and-what-you-should-know-before-starting-this-course
-->

**Keywords:** Screencasting, Streaming App

## Links

- [Code Repository](https://github.com/obsproject/obs-studio)

## Glossary

- Real Time Messaging Protocol (RTMP)

## App

### Dependencies

#### APT

```sh
sudo apt -y install ffmpeg
```

### Installation

#### Homebrew

```sh
brew install --cask obs
```

<!-- #### APT

```sh
sudo add-apt-repository ppa:obsproject/obs-studio

sudo apt update
sudo apt -y install obs-studio
``` -->

#### Chocolatey

```sh
choco install -y obs-studio
```

### Configuration

<!-- ####

1. Settings
2. General -> Output
   - Check Show confirmation dialog when starting streams
   - Check Show confirmation dialog when stopping streams -->

#### Streaming

1. Usage Information
   - Select: Optimize for streaming, recording is secondary
   - Next
2. Video Settings
   - Next

#### Virtual Camera

1. Usage Information
   - Select: I will only be using the virtual camera
   - Next
2. Final Results
   - Apply Settings
