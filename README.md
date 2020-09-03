# VirtualBox Builder

VirtualBox builder in docker container. This is useful when we do not want to install the build dependencies on the host machine.


## VirtualBox Linux Build Instructions

https://www.virtualbox.org/wiki/Linux%20build%20instructions


## Build VirtualBox Docker Image

```bash
docker build --tag vbox-builder-image .
```


### Run the container

```bash
git svn clone https://www.virtualbox.org/svn/vbox
cd vbox
docker run -it --rm -v "$PWD:/vbox-src" --name vbox-builder vbox-builder-image ./build-vbox.sh --help
```


## Build VirtualBox

### Release Build

```bash
docker run -it --rm -v "$PWD:/vbox-src" --name vbox-builder vbox-builder-image ./build-vbox.sh --release
```


### Debug Build

```bash
docker run -it --rm -v "$PWD:/vbox-src" --name vbox-builder vbox-builder-image ./build-vbox.sh --debug
```


### Release with ASAN Build

```bash
docker run -it --rm -v "$PWD:/vbox-src" --name vbox-builder vbox-builder-image ./build-vbox.sh --release --asan
```


### Debug with ASAN Build

```bash
docker run -it --rm -v "$PWD:/vbox-src" --name vbox-builder vbox-builder-image ./build-vbox.sh --debug --asan
```
