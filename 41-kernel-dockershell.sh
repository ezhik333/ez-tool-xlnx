./set_jobs_n.sh
docker run --rm -it -v=${PWD}/linux-xlnx/:/linux-xlnx/ -v=${PWD}/_out/:/_out/ ez-tool-xlnx /bin/bash
