# ez-tool-xlnx

Dockerfile and some scripts for easy building of linux-xlnx kernel, u-boot, ATF in a container.

Works for ZynqMP processors. 
U-Boot builds with ZCU106 board device-tree.
You can change parameters in Dockerfile and scripts to make this work for Zynq 7000 and another boards (not tested yet).

## First steps
Run scripts to download gcc compiler and clone Xilinx repositories

    ./get_gcc.sh
    ./gitclone.sh

Run script to build docker image

    ./docker_build.sh

Edit scripts that you will use.

## Scripts

``01-kernel-defconfig.sh`` - runs ``make defconfig`` for kernel

``01-kernel-menuconfig.sh`` - runs ``make menuconfig`` for kernel

``02-u-boot-defconfig.sh`` - runs ``make defconfig`` for u-boot

``02-u-boot-menuconfig.sh`` - runs ``make menuconfig`` for u-boot

``11-kernel-make.sh`` - builds kernel

``12-u-boot-make.sh`` - builds u-boot

``13-atf-make.sh`` - builds arm-trusted firmware

``21-kernel-clean.sh`` - runs ``make clean`` for kernel

``22-u-boot-clean.sh`` - runs ``make clean`` for u-boot

``31-kernel-distclean.sh`` - runs ``make distclean`` for kernel

``32-u-boot-distclean.sh`` - runs ``make distclean`` for u-boot

``41-kernel-dockershell.sh`` - runs shell in a container for kernel build environment

``42-u-boot-dockershell.sh`` - runs shell in a container for u-boot build environment

``set_jobs_n.sh`` - sets number of jobs parameter for ``make``
