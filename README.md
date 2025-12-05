# How to Build & Install CPython From Source On Linux

## TL;DR
- Download desired Python source code from https://www.python.org/ftp/python/
- Extract archive and cd into the directory
- Install build prerequisites
- `./configure --enable-optimizations --with-ensurepip=install`
- `make -j <number of processors>`
- `sudo make altinstall`

## 1. Download The Source Code

- Go to https://www.python.org/ftp/python/
- Select a Python version, and dowload the source code archive
- Extract the archive and `cd` into the directory

## 2. Install Build Prerequisites

- On Ubuntu:
```console
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl \
  libncurses5-dev libncursesw5-dev xz-utils tk-dev liblzma-dev \
  llvm
```

Using `clang-19` or above is preffered for better interpreter optimizations

## 3. Configure The Python Build

### Recommended:
```console
./configure --enable-optimizations --with-ensurepip=install
```

- `--enable-optimizations` enables optimizations for the resulting Python build, good for actual Python use
- `--with-ensurepip=install` ensures your Python build would automatically contain the `pip` and `venv` module

### Other Flags:
```console
./configure --help
```

You can also enable and disable features such as `--disable-gil`

## 4. Compile

Compile with a single processor:
```console
make
```
or (with x number of processors):
```console
make -j <number of processors>
```
or (with number of processors = total CPU cores):
```console
make -j $(nproc)
```
or (with number of processors = half of your CPU cores):
```console
make -j $(($(nproc) / 2 + 1))
```

## 5. Install

### Recommended:
```console
sudo make altinstall
```

This will install your Python to `/usr/local/bin/`

### Not Recommended:

`sudo make install` will replace your system's `python3`, which can break your system if it depends on that specific Python (e.g. `GNOME`)
