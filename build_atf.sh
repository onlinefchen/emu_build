#!/bin/sh

set -e


make -C arm-trusted-firmware distclean
make -C arm-trusted-firmware PLAT=qemu bl31 CC=clang
cp arm-trusted-firmware/build/qemu/release/bl31.bin .
