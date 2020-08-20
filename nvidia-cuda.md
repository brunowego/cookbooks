# NVIDIA CUDA

<!--
https://www.quantstart.com/articles/Installing-Nvidia-CUDA-on-Mac-OSX-for-GPU-Based-Parallel-Computing/

https://github.com/hahadsg/hahadsg.github.io/blob/27bbad4cf6c625998a67a96b3fc0b4e44b7097ba/linux/gpu.md
https://github.com/TheresaLiao/k8s-gpu-setting/blob/cbe20c607109522fd94354a7821c92ad2ccbf07d/README.md
https://github.com/RunAtWorld/pydemo/blob/8015ea0af264080baef2f3c19e8f08447f183176/docs/ml/nvidia_cuda/README.md
https://github.com/xaviablaza/ubiquitous-octo-umbrella/blob/5cb91ab1b3ea7d4be0eb8422f733d86349eac566/centos7-xmr.md

https://github.com/hbulpf/ServerOps/blob/f887cdbb935a4b6f09aeca16e207efc786c2b363/fast_run/ml/nvidia_cuda/README.md
https://github.com/miaortizma/Dockerfiles/blob/9239aecbbc34ce2b961df9596f0222588760f45d/jupyter/cuda/base/Dockerfile
https://github.com/shawfdong/shawfdong.github.io/blob/5d0fa289bbdc6f7988cc5697a6c289ddda40d1a0/_posts/2017-7-28-hydra.md
https://github.com/JinsYin/cloud-native-handbook/blob/485f34f7194944860562028a119e2ad0a94364d2/application/%7Eml%26ai/nvidia.md
https://github.com/blezek/dotfiles/blob/a2ea3a8ba98bf57239e78d06d8a6ab147481ec6d/gpu.md
https://github.com/huaweicloudDocs/ecs/blob/4f4fca4ed911ae1bf02392eef3522161b0c6b68f/cn.zh-cn/%E7%94%A8%E6%88%B7%E6%8C%87%E5%8D%97/(%E6%8E%A8%E8%8D%90%E4%BD%BF%E7%94%A8)%E5%AE%89%E8%A3%85NVIDIA-GPU%E9%A9%B1%E5%8A%A8%E5%92%8CCUDA%E5%B7%A5%E5%85%B7%E5%8C%85.md

-->

## References

- [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker)
- [NVIDIA Container Runtime](https://developer.nvidia.com/nvidia-container-runtime)
- [CUDA Toolkit 10.2 Download](https://developer.nvidia.com/cuda-downloads)

## CLI

### Installation

#### Homebrew

```sh
brew tap homebrew/cask-drivers
brew cask install nvidia-cuda
```

#### APT

```sh
sudo apt update
sudo apt -y install nvidia-cuda-dev
```

<!-- #### YUM

```sh
# yum check-update

# Repo: EPEL
# sudo yum -y install cuda
``` -->

### Check Compatibility

- [Check Nvidia](/pciutils.md#usage)

```sh
# Architecture
uname -m

# OS
cat /etc/*release

# GCC
gcc --version

# Version
uname -r

# Drivers
nvidia-smi
nvidia-xconfig --query-gpu-info
```

### REPL

#### Tensorflow GPU

```sh
# Darwin
pip install -U tensorflow

# Linux
pip install -U tensorflow-gpu
```

<!--
```py
>>> from joblib import Memory
>>> cachedir = '.cache'
>>> mem = Memory(cachedir)
>>> import numpy as np
>>> a = np.vander(np.arange(3)).astype(np.float)
>>> square = mem.cache(np.square)
>>> b = square(a)
________________________________________________________________________________
[Memory] Calling square...
square(array([[0., 0., 1.],
       [1., 1., 1.],
       [4., 2., 1.]]))
___________________________________________________________square - 0.0s, 0.0min
>>> c = square(a)
>>> # The above call did not trigger an evaluation
>>> exit()
```
-->

```py
>>> from tensorflow.python.client import device_lib
>>> local_device_protos = device_lib.list_local_devices()
>>> [x.name for x in local_device_protos if x.device_type == 'XLA_GPU']
>>> exit()
```

```py
# >>> import tensorflow as tf
# >>> hello = tf.constant('Hello, TensorFlow!')
# >>> sess = tf.Session()
# >>> print(sess.run(hello))
# >>> a = tf.constant(10)
# >>> b = tf.constant(32)
# >>> print(sess.run(a + b))
```

```py
>>> import tensorflow as tf
>>> with tf.compat.v1.Session() as sess:
...     a = tf.constant(3.0)
...     b = tf.constant(4.0)
...     c = a+b
...     print(sess.run(c))
...     sess.close()
...
>>> exit()
```

```py
with tf.compat.v1.Session() as sess:
  devices = sess.list_devices()
devices
```

```py
>>> import tensorflow as tf
>>> # Creates a graph
>>> with tf.device('/device:XLA_GPU:0'):
...     a = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[2, 3], name='a')
...     b = tf.constant([1.0, 2.0, 3.0, 4.0, 5.0, 6.0], shape=[3, 2], name='b')
...
>>> c = tf.matmul(a, b)
>>> # Creates a session with log_device_placement set to True
>>> sess = tf.compat.v1.Session()
>>> # Runs the op
>>> print(sess.run(c))
>>> sess.close()
>>> exit()
```

#### Keras

```sh
pip install -U keras
```

TODO
