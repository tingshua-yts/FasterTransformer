set -x
set -e
#ckp=/mnt/model/bloom-7b-pai/ft_model/2-gpu
#ckp=/mnt/model/bloom-7b1-ft/2-gpu/
#ckp=/mnt/model/bloom-7b1-ft-fp16/2-gpu
#ckp=/mnt/model/bloom-7b-pai/ft_model_fp16/2-gpu
export CUDA_VISIBLE_DEVICES=0,1
python ../../examples/pytorch/gpt/bloom_lambada.py \
    --tokenizer-path /mnt/model/bloom-7b1 \
    --dataset-path /mnt/data/lambada/lambada_test.jsonl \
    --batch-size 4 \
    --test-hf \
    --show-progress