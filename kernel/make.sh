#!/bin/bash

source ~/osbook/devenv/buildenv.sh

cd ~/workspace/mikanos/kernel

make

cd ~/edk2

source edksetup.sh
source ~/osbook/devenv/buildenv.sh

build

~/osbook/devenv/run_qemu.sh ~/edk2/Build/MikanLoaderX64/DEBUG_CLANGPDB/X64/Loader.efi ~/workspace/mikanos/kernel/kernel.elf
