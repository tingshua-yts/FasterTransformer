set -x
set -e
export PYTHONPATH=/mnt/project/FasterTransformer:/mnt/project/bloom_rapidformer_train_base-master:/mnt
#MODEL_DIR=/mnt/model/megatron_lm_345m
MODEL_DIR=/mnt/model/bloom-7b-pai/
rm -rf /mnt/model/bloom-7b-pai/ft_model/2-gpu
python  /mnt/project/FasterTransformer/demo/bloom/megatron_bloom_ckpt_convert.py \
        -head_num 16 \
        -i $MODEL_DIR/mp_rank_00// \
        -o $MODEL_DIR/ft_model \
        -t_g 1 \
        -i_g 2 \
        --vocab-path $MODEL_DIR/gpt2-vocab.json \
        --merges-path $MODEL_DIR/gpt2-merges.txt