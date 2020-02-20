# NVIDIA CUDA

<!--
https://github.com/miaortizma/Dockerfiles/blob/9239aecbbc34ce2b961df9596f0222588760f45d/jupyter/cuda/base/Dockerfile
-->

## References

- [NVIDIA Container Toolkit](https://github.com/NVIDIA/nvidia-docker)
- [NVIDIA Container Runtime](https://developer.nvidia.com/nvidia-container-runtime)

## CLI

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install nvidia-cuda-dev
```

#### YUM

```sh
yum check-update
sudo yum -y install nvidia-cuda-dev
```

### Check Compatibility

```sh
# Linux
lspci | grep -i nvidia

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
```

### REPL

#### Tensorflow GPU

```sh
# Darwin
pip install tensorflow

# Linux
pip install tensorflow-gpu
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
pip install keras
```

TODO
