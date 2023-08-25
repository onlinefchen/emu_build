#!/bin/bash
set -e

START_FILE=bl31.bin
LOAD_FILE=bl31.bin
MONITOR_PORT=1235

./build.sh

# droplet image load address should be consonance with IMAGE_BASE_ADDR
# primary_vm image load address should be consonance with PLAT_PRIMARY_VM_BASE
#qemu-system-aarch64 \
#    -M virt,virtualization=on,gic-version=3 \
#    -cpu cortex-a72 \
#    -m 4G \
#    -smp 4 \
#    -nographic \
#    -no-reboot \
#    -device loader,file=${LOAD_FILE},addr=0x42480000 \
#    -device loader,file=${START_FILE},addr=0x42c80000,cpu-num=0 \
#    -monitor telnet:127.0.0.1:${MONITOR_PORT},server,nowait \
#    -serial stdio

qemu-system-aarch64 \
    -M virt,secure=on,gic-version=3 \
    -cpu cortex-a72 \
    -m 4G \
    -smp 4 \
    -nographic \
    -no-reboot \
    -device loader,file=${LOAD_FILE},addr=0x42480000 \
    -device loader,file=${START_FILE},addr=0x42c80000,cpu-num=0 \
    -monitor telnet:127.0.0.1:${MONITOR_PORT},server,nowait \
    -serial stdio
