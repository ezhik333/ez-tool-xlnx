./set_jobs_n.sh
docker run --rm -it -v=${PWD}/arm-trusted-firmware/:/arm-trusted-firmware/ -v=${PWD}/_out/:/_out/ -w=/arm-trusted-firmware/ ez-tool-xlnx /bin/bash /scripts/make_atf.sh -j ${MY_GCC_NJOBS} $*
cp ./arm-trusted-firmware/build/zynqmp/release/bl31/bl31.elf ./_out/