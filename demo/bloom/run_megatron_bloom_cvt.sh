set -x
set -e
export PYTHONPATH=/mnt/project/FasterTransformer:/mnt/project/bloom_rapidformer_train_base-master:/mnt
#MODEL_DIR=/mnt/model/megatron_lm_345m
MODEL_DIR=/mnt/model/bloom-7b-pai/
rm -rf /mnt/model/bloom-7b-pai/ft_model_fp16/2-gpu
python  /mnt/project/FasterTransformer/demo/bloom/megatron_bloom_ckpt_convert.py \
        -head_num 32 \
        --weight-data-type fp16 \
        -i $MODEL_DIR/mp_rank_00/ \
        -o $MODEL_DIR/ft_model_fp16 \
        -t_g 1 \
        -i_g 2