#!/bin/bash

edk2_PATH=$HOME/edk2
MushiOS_PATH=$HOME/workspace/os-dev

cd $edk2_PATH
ln -s $MushiOS_PATH/MikanLoaderPkg .
source edksetup.sh
cp $MushiOS_PATH/MikanLoaderPkg/target.txt $edk2_PATH/Conf/target.txt

