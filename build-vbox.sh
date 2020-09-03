#!/bin/bash

usage() {
    echo "Usage: $0 [--release|--debug] [--asan]"
    echo
    echo "   -r, --release  Release Mode"
    echo "   -d, --debug    Debug Mode"
    echo "   -a, --asan     ASan Mode"
    echo "   -h, --help     Display this help"
    echo
    echo "$0 --relase --asan"
    echo
    exit 1
}

if [ $# -eq 0 ]; then
    usage
fi

asan=false
srcPath="/vbox-src"
buildType="release"

while [ ! -z "$1" ]; do
    case "$1" in
        --release | -r)
            buildType="release"
            ;;
        --debug | -d)
            buildType="debug"
            ;;
        --asan | -a)
            asan=true
            ;;
        --help | -h)
            usage
            exit
            ;;
        *)
            usage
            exit 1
            ;;
    esac
    shift $(($# > 0 ? 1 : 0))
done

echo "[+] Switching to source dir: ${srcPath}"

cd ${srcPath}

echo "[+] Configuring VirtualBox"
echo

./configure \
    --disable-python \
    --disable-java \
    --disable-qt \
    --disable-opengl \
    --disable-docs \
    --disable-libvpx \
    --disable-libopus \
    --disable-hardening \
    --disable-pulse \
    --disable-alsa \
    --build-headless

source ./env.sh

echo
echo "[+] Buding VirtualBox"
echo "    [*] Type: ${buildType}"
echo "    [*] ASan: ${asan}"
echo

kmkArguments="KBUILD_TYPE=${buildType}"

if ${asan}; then
    kmkArguments="${kmkArguments} VBOX_WITH_GCC_SANITIZER=1"
fi

#
# Start the build process
#

kmk ${kmkArguments}
