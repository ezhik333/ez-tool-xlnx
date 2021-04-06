FROM debian:stable-slim
RUN apt update
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -q -y gawk gcc xterm autoconf libtool \
texinfo net-tools zlib1g-dev gcc-multilib build-essential device-tree-compiler \
zlib1g:i386 libncurses-dev libssl-dev libelf-dev flex bison libssl-dev bc make xz-utils apt-utils mc
COPY ./gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz .
RUN tar -xf ./gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu.tar.xz && \
    cp -r ./gcc-arm-10.2-2020.11-x86_64-aarch64-none-linux-gnu/* /
RUN mkdir /linux-xlnx && mkdir /u-boot-xlnx && mkdir /_out
VOLUME /linux-xlnx
VOLUME /u-boot-xlnx
VOLUME /arm-trusted-firmware
VOLUME /_out
WORKDIR /linux-xlnx

RUN mkdir /scripts && \
    echo 'export ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu-' > /scripts/make_kernel.sh && \
    echo 'export ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu-' > /scripts/make_atf.sh && \
    echo 'export ARCH=arm DEVICE_TREE=zynqmp-zcu106-revA CROSS_COMPILE=aarch64-none-linux-gnu-' > /scripts/make_uboot.sh && \
    echo 'make $*' >> /scripts/make_kernel.sh && \
    echo 'make $*' >> /scripts/make_uboot.sh && \
    echo 'make PLAT=zynqmp RESET_TO_BL31=1 $*' >> /scripts/make_atf.sh && \
    echo 'cp ./arch/arm64/boot/Image /_out/' >> /scripts/make_kernel.sh && \
    echo 'cp ./u-boot.elf /_out/' >> /scripts/make_uboot.sh && \
    echo 'cp ./build/zynqmp/release/bl31/bl31.elf /_out/' >> /scripts/make_atf.sh && \
    chmod +x /scripts/*.sh



#RUN echo 'make VERBOSE=1 ARCH=arm64 CROSS_COMPILE=aarch64-none-linux-gnu- $*' > ./../make.sh
#RUN echo 'make VERBOSE=1 ARCH=arm DEVICE_TREE=zynqmp-zcu106-revA CROSS_COMPILE=aarch64-none-linux-gnu- $*' > ./../make2.sh
#RUN chmod +x ./../make.sh && chmod +x ./../make2.sh