# NVIDIA CUDA Toolkit

## CLI

### Installation

### DMG

```sh
axel -n 16 'https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_mac.dmg' && \
  hdiutil attach cuda_10.2.89_mac.dmg \
    -nobrowse \
    -mountpoint \
    /Volumes/CUDAMacOSXInstaller
```

```sh
open /Volumes/CUDAMacOSXInstaller/CUDAMacOSXInstaller.app
```

Uncheck "CUDA Samples" before continue.

```sh
hdiutil detach /Volumes/CUDAMacOSXInstaller && rm ./cuda_10.2.89_mac.dmg
```

#### APT

```sh
sudo apt update
sudo apt -y install nvidia-cuda-toolkit
```

### Usage

```sh
nvcc -V
```
