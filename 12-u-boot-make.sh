./set_jobs_n.sh
docker run --rm -it -v=${PWD}/u-boot-xlnx/:/u-boot-xlnx/ -v=${PWD}/_out/:/_out/ -w=/u-boot-xlnx/ ez-tool-xlnx /bin/bash /scripts/make_uboot.sh -j ${MY_GCC_NJOBS} u-boot.elf $*
cp ./u-boot-xlnx/u-boot.elf ./_out/