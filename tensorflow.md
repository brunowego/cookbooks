# TensorFlow

<!--
https://www.youtube.com/watch?v=tZt6gRlRcgk
https://github.com/tensorflow/profiler/blob/master/docs/profile_multi_gpu.md
https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
-->

## Library

### Installation

#### PIP

```sh
pip install -U tensorflow
```

#### Conda

```sh
conda install tensorflow -y
```

### REPL

```py
>>> import tensorflow
>>> exit()
```

## Issues

### C++ Standard Library

```log
mportError: /lib64/libstdc++.so.6: version `CXXABI_1.3.8' not found
```

```sh
# current version
gcc -v

# find c++ standard library
sudo find / -name 'libstdc++.so.6'

#
strings /lib64/libstdc++.so.6 | grep '^CXXABI_'

# build from source gcc-7.3.1

# unlink
sudo unlink /usr/lib64/libstdc++.so.6

# copy new version
sudo ln -s $(readlink -f /usr/local/lib64/libstdc++.so.6) /usr/lib64/libstdc++.so.6
```

### Shared Libraries

```log
ImportError: /lib64/libm.so.6: version `GLIBC_2.23' not found
```

```sh
# current version
ldd --version

# find c++ standard library
sudo find / -name 'libm.so.6'

#
strings /lib64/libc.so.6 | grep '^GLIBC_'

# build from source gcc-7.3.1
```
