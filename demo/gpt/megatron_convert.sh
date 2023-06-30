set -x
set -e
export PYTHONPATH=/mnt/project/FasterTransformer
MODEL_DIR=/mnt/model/megatron_lm_345m
python  /mnt/project/FasterTransformer/examples/pytorch/gpt/utils/megatron_ckpt_convert.py \
        -head_num 16 \
        -i $MODEL_DIR/release/ \
        -o $MODEL_DIR/ft_model_test \
        -t_g 1 \
        -i_g 2 \
        --vocab-path $MODEL_DIR/gpt2-vocab.json \
        --merges-path $MODEL_DIR/gpt2-merges.txt