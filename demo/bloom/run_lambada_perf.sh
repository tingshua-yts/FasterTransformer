set -x
set -e
#ckp=/mnt/model/bloom-7b-pai/ft_model/2-gpu
#ckp=/mnt/model/bloom-7b1-ft/2-gpu/
ckp=/mnt/model/bloom-7b1-ft-fp16/2-gpu
ckp=/mnt/model/bloom-7b-pai/ft_model_fp16/2-gpu
workd_size=2
mpirun --allow-run-as-root -n $workd_size python ../../examples/pytorch/gpt/bloom_lambada.py \
    --lib-path /mnt/project/FasterTransformer/build/lib/libth_transformer.so \
    --checkpoint-path $ckp \
    --batch-size 16 \
    --tokenizer-path /mnt/model/bloom-7b1 \
    --dataset-path /mnt/data/lambada/lambada_test.jsonl \
    --show-progress