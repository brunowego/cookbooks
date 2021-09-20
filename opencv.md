# OpenCV

## Links

- [Code Repository (Python)](https://github.com/opencv/opencv-python)
- [Main Website](https://opencv.org)

## Library

### Installation

#### pip

```sh
pip3 install opencv-python
```

### Issues

#### Missing CMake

```log
Problem with the CMake installation, aborting build. CMake executable is cmake
```

Install [CMake](/cmake.md)

#### Missing Build Wheels Dependencies

```log
Could not build wheels for cmake which use PEP 517 and cannot be installed directly
```

```sh
#
apk add cmake gcc libc-dev build-base openssl-dev linux-headers
```

#### Missing Lapack Library

```log
libraries lapack_atlas not found in /usr/local/lib
libraries lapack_atlas not found in /usr/lib
libraries lapack not found in ['/usr/local/lib', '/usr/lib']
Lapack (http://www.netlib.org/lapack/) libraries not found.
```

```sh
#
apk add lapack-dev
```
