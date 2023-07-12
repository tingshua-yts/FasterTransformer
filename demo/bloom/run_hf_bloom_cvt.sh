set -x
set -e
export PYTHONPATH=/mnt/project/FasterTransformer:/mnt/project/bloom_rapidformer_train_base-master:/mnt
python  /mnt/project/FasterTransformer/examples/pytorch/gpt/utils/huggingface_bloom_convert.py  \
        -i /mnt/model/bloom-7b1 \
        -o /mnt/model/bloom-7b1-ft-fp16 \
        -tp 1 \
        -dt fp16 \
        -p 64 -v
