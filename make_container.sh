edk2DIR=$HOME/edk2
MushiOSDIR=$HOME/workspace
mntDIR=$HOME/mnt
osbookDIR=$HOME/osbook

source $osbookDIR/devenv/buildenv.sh

cd $MushiOSDIR/kernel/
clang++ $CPPFLAGS -O2 -Wall -g --target=x86_64-elf -ffreestanding -mno-red-zone -fno-exceptions -fno-rtti -std=c++17 -c main.cpp
ld.lld --entry KernelMain -z norelro --image-base 0x100000 --static -o kernel.elf main.o

source $MushiOSDIR/setup_container.sh
cd $edk2DIR
build

$osbookDIR/devenv/run_qemu.sh $edk2DIR/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $MushiOSDIR/kernel/kernel.elf
