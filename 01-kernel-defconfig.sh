docker run --rm -it -v=${PWD}/linux-xlnx/:/linux-xlnx/ -v=${PWD}/_out/:/_out/ ez-tool-xlnx /bin/bash /scripts/make_kernel.sh xilinx_zynqmp_defconfig
