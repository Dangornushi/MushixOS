#!/bin/bash

source ~/osbook/devenv/buildenv.sh

cd ~/workspace/mikanos/kernel

clang++ $CPPFLAGS -O2 --target=x86_64-elf -fno-exceptions -ffreestanding -c main.cpp
ld.lld $LDFLAGS --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o

cd ~/edk2

source edksetup.sh
source ~/osbook/devenv/buildenv.sh

build

~/osbook/devenv/run_qemu.sh ~/edk2/Build/MikanLoaderX64/DEBUG_CLANGPDB/X64/Loader.efi ~/workspace/mikanos/kernel/kernel.elf
