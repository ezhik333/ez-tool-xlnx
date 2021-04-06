./set_jobs_n.sh
docker run --rm -it -v=${PWD}/u-boot-xlnx/:/u-boot-xlnx/ -v=${PWD}/_out/:/_out/ -w=/u-boot-xlnx/ ez-tool-xlnx /bin/bash