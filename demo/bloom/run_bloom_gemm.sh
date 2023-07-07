set -x
set -e
workddir=`pwd`
cd ../../build
batch_size=16
beam_width=1
max_input_len=150 # 从lambada数据集获取到的
head_number=32
size_per_head=128
inter_size=16384
vocab_size=250880
data_type=1
tensor_para_size=2
is_append=0
./bin/gpt_gemm  $batch_size \
                $beam_width \
                $max_input_len \
                $head_number \
                $size_per_head \
                $inter_size \
                $vocab_size \
                $data_type \
                $tensor_para_size \
                $is_append
cp gemm_config.in $workddir
cd $workddir