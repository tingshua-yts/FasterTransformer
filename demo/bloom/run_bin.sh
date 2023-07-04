set -e
set -x
dir=`pwd`
cd ../../build
mpirun --allow-run-as-root -n 4 ./bin/multi_gpu_gpt_example
cd $dir