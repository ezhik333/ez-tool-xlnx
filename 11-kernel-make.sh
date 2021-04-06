./set_jobs_n.sh
docker run --rm -it -v=${PWD}/linux-xlnx/:/linux-xlnx/ -v=${PWD}/_out/:/_out/ ez-tool-xlnx /bin/bash /scripts/make_kernel.sh -j ${MY_GCC_NJOBS} $*
cp ./linux-xlnx/arch/arm64/boot/Image ./_out/
