# Dukto

(WIP) A simple, fast and multi-platform file transfer tool for LAN users, reimplemented with Qt 6.

> Original Author: Emanuele Colombo
> Original Website: https://www.msec.it/blog/dukto
> Original Source Code: https://sourceforge.net/projects/dukto/

<p><img src="data/dukto.png" alt="logo"/></p>

## Build and Installation

Currently I only run and test it on Linux ...

```shell
git clone https://github.com/WhiredPlanck/dukto-qt6
cd dukto-qt6
cmake -B<build_dir> -DCMAKE_INSTALL_PREFIX=/usr \
    # -GNinja # use ninja to speed up build
cmake --build <build_dir>
DESTDIR=<dest_dir> cmake --install <build_dir>
```
