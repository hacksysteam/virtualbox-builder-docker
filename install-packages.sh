#!/bin/bash

set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

#
# Update the package listing, so we know what package exist
#

apt-get update

#
# Install security updates
#

apt-get -y upgrade

#
# https://www.virtualbox.org/wiki/Linux%20build%20instructions
# Install virtualbox dependencies
#

apt-get -y install acpica-tools chrpath default-jdk doxygen g++ g++-multilib gcc \
    gcc-multilib iasl lib32gcc1 lib32stdc++6 libasound2-dev \
    libc6-dev-i386 libcap-dev libcurl4-openssl-dev libdevmapper-dev \
    libglu1-mesa-dev libidl-dev libopus-dev libpam0g-dev libpng-dev \
    libpulse-dev libqt5opengl5-dev libqt5x11extras5-dev libsdl1.2-dev \
    libsdl-ttf2.0-dev libssl-dev libstdc++5 libvpx-dev libx11-dev \
    libxcursor-dev libxext-dev libxinerama-dev libxml2-dev libxml2-utils \
    libxmu-dev libxrandr-dev libxslt1-dev libxt-dev linux-headers-generic \
    linux-kernel-headers make makeself mesa-common-dev nasm python-dev \
    python3-dev python3.6-dev qttools5-dev-tools subversion texlive \
    texlive-fonts-extra texlive-latex-extra unzip xsltproc yasm zlib1g-dev \
    acpica-tools chrpath doxygen g++-multilib libasound2-dev libcap-dev \
    libcurl4-openssl-dev libdevmapper-dev libidl-dev libopus-dev libpam0g-dev \
    libpulse-dev libqt5opengl5-dev libqt5x11extras5-dev libsdl1.2-dev \
    libsdl-ttf2.0-dev libssl-dev libvpx-dev libxcursor-dev libxinerama-dev \
    libxml2-dev libxml2-utils libxmu-dev libxrandr-dev make nasm python3-dev \
    python-dev qttools5-dev-tools texlive texlive-fonts-extra texlive-latex-extra \
    unzip xsltproc default-jdk libstdc++5 libxslt1-dev linux-kernel-headers \
    makeself mesa-common-dev subversion yasm zlib1g-dev

# Delete cached files we don't need anymore
apt-get clean
apt-get autoclean
apt-get autoremove
