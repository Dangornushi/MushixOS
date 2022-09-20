#!/bin/bash

edk2DIR=$HOME/edk2
MushiOSDIR=$HOME/workspace/os-dev
mntDIR=$HOME/mnt
osbookDIR=$HOME/osbook

source $osbookDIR/devenv/buildenv.sh

echo "Kernel Building"

cd $MushiOSDIR/kernel/
make

source $MushiOSDIR/setup_local.sh
cd $edk2DIR
build

$osbookDIR/devenv/run_qemu.sh $edk2DIR/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $MushiOSDIR/kernel/kernel.elf
